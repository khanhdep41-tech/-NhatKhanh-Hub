--==================================================
-- NHATKHANH HUB LOADER
-- Key + HWID + Auto Save Key + Auto Verify
-- Hub Loader + Ajjan Auto Re-Execute
--==================================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--==================================================
-- CONFIG
--==================================================

local API_URL = "https://bloxhub-api.onrender.com"

local VERIFY_ENDPOINT = API_URL .. "/api/verify"
local SCRIPT_ENDPOINT = API_URL .. "/api/script"

local AJJAN_URL =
    "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/Ajjan.lua"

local KEY_FILE = "NhatKhanh_Hub_Key.txt"

--==================================================
-- SERVICES
--==================================================

local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- UTIL
--==================================================

local function trim(value)
    if type(value) ~= "string" then
        return ""
    end

    return value:match("^%s*(.-)%s*$") or ""
end

local function safeCall(fn, ...)
    local args = {...}

    local ok, result = pcall(function()
        return fn(table.unpack(args))
    end)

    if ok then
        return true, result
    end

    return false, result
end

--==================================================
-- REQUEST FUNCTION
--==================================================

local executorRequest =
    (syn and syn.request)
    or (http and http.request)
    or (fluxus and fluxus.request)
    or (getgenv and getgenv().request)
    or (_G and rawget(_G, "request"))

local function request(options)
    if type(executorRequest) == "function" then
        local ok, response = pcall(function()
            return executorRequest(options)
        end)

        if ok and response then
            return response
        end
    end

    return nil
end

--==================================================
-- GET
--==================================================

local function httpGet(url)
    local response = request({
        Url = url,
        Method = "GET"
    })

    if response then
        local body = response.Body or response.body

        if type(body) == "string" and body ~= "" then
            return true, body
        end
    end

    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)

    if ok and type(result) == "string" and result ~= "" then
        return true, result
    end

    return false, "HTTP GET failed."
end

--==================================================
-- POST
--==================================================

local HttpService = game:GetService("HttpService")

local function httpPost(url, data)
    if type(executorRequest) ~= "function" then
        return false, "Executor does not support HTTP POST."
    end

    local encoded

    local encodeOk, encodeResult = pcall(function()
        return HttpService:JSONEncode(data)
    end)

    if not encodeOk then
        return false, "Failed to encode request."
    end

    encoded = encodeResult

    local response = request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = encoded
    })

    if not response then
        return false, "HTTP POST failed."
    end

    local statusCode =
        response.StatusCode
        or response.status_code
        or response.Status

    local body =
        response.Body
        or response.body

    if type(body) ~= "string" then
        body = ""
    end

    if tonumber(statusCode) and tonumber(statusCode) >= 400 then
        local message = body

        local decodeOk, decoded = pcall(function()
            return HttpService:JSONDecode(body)
        end)

        if decodeOk and type(decoded) == "table" then
            message = decoded.message or decoded.error or body
        end

        return false, tostring(message)
    end

    if body == "" then
        return false, "Empty server response."
    end

    return true, body
end

--==================================================
-- HWID
--==================================================

local function getHWID()
    local possibleFunctions = {
        "gethwid",
        "get_hwid"
    }

    for _, name in ipairs(possibleFunctions) do
        local fn = _G[name]

        if type(fn) == "function" then
            local ok, result = pcall(fn)

            if ok and type(result) == "string" and result ~= "" then
                return result
            end
        end

        if getgenv then
            local env = getgenv()

            if env and type(env[name]) == "function" then
                local ok, result = pcall(env[name])

                if ok and type(result) == "string" and result ~= "" then
                    return result
                end
            end
        end
    end

    local ok, clientId = pcall(function()
        return RbxAnalyticsService:GetClientId()
    end)

    if ok and type(clientId) == "string" and clientId ~= "" then
        return clientId
    end

    return nil
end

--==================================================
-- KEY FILE
--==================================================

local function saveKey(key)
    key = trim(key)

    if key == "" then
        return false
    end

    if type(writefile) ~= "function" then
        return false
    end

    local ok = pcall(function()
        writefile(KEY_FILE, key)
    end)

    return ok
end

local function loadSavedKey()
    if type(isfile) ~= "function" then
        return nil
    end

    if type(readfile) ~= "function" then
        return nil
    end

    local existsOk, exists = pcall(function()
        return isfile(KEY_FILE)
    end)

    if not existsOk or not exists then
        return nil
    end

    local readOk, content = pcall(function()
        return readfile(KEY_FILE)
    end)

    if not readOk then
        return nil
    end

    content = trim(content)

    if content == "" then
        return nil
    end

    return content
end

local function deleteSavedKey()
    if type(delfile) ~= "function" then
        return
    end

    pcall(function()
        delfile(KEY_FILE)
    end)
end

--==================================================
-- GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NhatKhanh_Loader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(360, 235)
Main.Position = UDim2.new(0.5, -180, 0.5, -117)
Main.BackgroundColor3 = Color3.fromRGB(30, 10, 27)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(245, 65, 155)
Stroke.Thickness = 1.5

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 40)
Title.Position = UDim2.fromOffset(15, 12)
Title.BackgroundTransparency = 1
Title.Text = "NHATKHANH HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.Parent = Main

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -30, 0, 25)
SubTitle.Position = UDim2.fromOffset(15, 48)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Key Verification"
SubTitle.TextColor3 = Color3.fromRGB(255, 145, 210)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.Parent = Main

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -30, 0, 42)
KeyBox.Position = UDim2.fromOffset(15, 82)
KeyBox.BackgroundColor3 = Color3.fromRGB(50, 20, 45)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(170, 150, 165)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 9)

local VerifyButton = Instance.new("TextButton")
VerifyButton.Size = UDim2.new(1, -30, 0, 42)
VerifyButton.Position = UDim2.fromOffset(15, 132)
VerifyButton.BackgroundColor3 = Color3.fromRGB(195, 38, 125)
VerifyButton.BorderSizePixel = 0
VerifyButton.Text = "VERIFY KEY"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.TextSize = 14
VerifyButton.Parent = Main

Instance.new("UICorner", VerifyButton).CornerRadius = UDim.new(0, 9)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -30, 0, 42)
Status.Position = UDim2.fromOffset(15, 180)
Status.BackgroundTransparency = 1
Status.Text = "Enter your key."
Status.TextColor3 = Color3.fromRGB(220, 200, 215)
Status.Font = Enum.Font.Gotham
Status.TextSize = 11
Status.TextWrapped = true
Status.Parent = Main

--==================================================
-- AJJAN TELEPORT
--==================================================

local ajjanQueued = false

local function queueAjjan()
    if ajjanQueued then
        return true
    end

    local queuedCode = [[
        task.wait(2)

        pcall(function()
            local source = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/Ajjan.lua"

            local response = game:HttpGet(source)

            if type(response) == "string" and response ~= "" then
                local fn, err = loadstring(response)

                if fn then
                    fn()
                else
                    warn("[NhatKhanh] Ajjan compile error: " .. tostring(err))
                end
            end
        end)
    ]]

    local queueFunctions = {
        function()
            if type(queue_on_teleport) == "function" then
                queue_on_teleport(queuedCode)
                return true
            end
        end,

        function()
            if type(queueonteleport) == "function" then
                queueonteleport(queuedCode)
                return true
            end
        end,

        function()
            if type(queue_on_tp) == "function" then
                queue_on_tp(queuedCode)
                return true
            end
        end,

        function()
            if type(syn) == "table"
                and type(syn.queue_on_teleport) == "function" then

                syn.queue_on_teleport(queuedCode)
                return true
            end
        end
    }

    for _, fn in ipairs(queueFunctions) do
        local ok, result = pcall(fn)

        if ok and result == true then
            ajjanQueued = true
            return true
        end
    end

    return false
end

--==================================================
-- VERIFY KEY
--==================================================

local function verifyKey(key)
    key = trim(key)

    if key == "" then
        return false, "Key is empty."
    end

    local hwid = getHWID()

    if not hwid then
        return false, "Could not get HWID."
    end

    Status.Text = "Checking Key + HWID..."

    local ok, body = httpPost(VERIFY_ENDPOINT, {
        key = key,
        hwid = hwid
    })

    if not ok then
        return false, body
    end

    local decodeOk, data = pcall(function()
        return HttpService:JSONDecode(body)
    end)

    if not decodeOk or type(data) ~= "table" then
        return false, "Invalid server response."
    end

    if data.valid ~= true then
        return false, data.message or "Key verification failed."
    end

    if type(data.sessionToken) ~= "string"
        or data.sessionToken == "" then

        return false, "Server did not return a session token."
    end

    return true, data.sessionToken
end

--==================================================
-- LOAD HUB
--==================================================

local function loadHub(sessionToken)
    if type(sessionToken) ~= "string"
        or sessionToken == "" then

        return false, "Missing session token."
    end

    Status.Text = "Downloading NhatKhanh Hub..."

    local response = request({
        Url = SCRIPT_ENDPOINT,
        Method = "GET",
        Headers = {
            ["X-Session-Token"] = sessionToken
        }
    })

    if not response then
        return false, "Failed to request Hub."
    end

    local statusCode =
        response.StatusCode
        or response.status_code
        or response.Status

    if tonumber(statusCode) and tonumber(statusCode) >= 400 then
        return false, "Hub request rejected by server."
    end

    local source =
        response.Body
        or response.body

    if type(source) ~= "string" or source == "" then
        return false, "Hub source is empty."
    end

    Status.Text = "Starting NhatKhanh Hub..."

    local fn, compileError = loadstring(source)

    if not fn then
        return false, "Hub compile error: " .. tostring(compileError)
    end

    -- Hub chạy riêng để Loader không bị treo
    task.spawn(function()
        local runOk, runError = pcall(fn)

        if not runOk then
            warn("[NhatKhanh] Hub error:")
            warn(tostring(runError))
        end
    end)

    return true
end

--==================================================
-- LOAD AJJAN ONCE
--==================================================

local ajjanExecuted = false

local function executeAjjanOnce()
    if ajjanExecuted then
        return true
    end

    -- chống chạy lại trong cùng executor environment
    if getgenv then
        local env = getgenv()

        if env.NhatKhanh_AjjanExecuted == true then
            ajjanExecuted = true
            return true
        end

        env.NhatKhanh_AjjanExecuted = true
    end

    local ok, source = httpGet(AJJAN_URL)

    if not ok then
        warn("[NhatKhanh] Failed to download Ajjan:")
        warn(tostring(source))
        return false
    end

    local fn, compileError = loadstring(source)

    if not fn then
        warn("[NhatKhanh] Ajjan compile error:")
        warn(tostring(compileError))
        return false
    end

    ajjanExecuted = true

    task.spawn(function()
        local runOk, runError = pcall(fn)

        if not runOk then
            warn("[NhatKhanh] Ajjan error:")
            warn(tostring(runError))
        end
    end)

    return true
end

--==================================================
-- FULL LOAD
--==================================================

local function startAfterVerify(sessionToken)
    Status.Text = "Key verified. Loading..."

    -- Đăng ký teleport trước
    queueAjjan()

    task.wait(0.3)

    -- Load Hub
    local hubOk, hubError = loadHub(sessionToken)

    if not hubOk then
        return false, hubError
    end

    -- Đợi một chút rồi chạy Ajjan đúng 1 lần
    task.wait(0.5)

    executeAjjanOnce()

    return true
end

--==================================================
-- VERIFY BUTTON
--==================================================

local busy = false

local function verify()
    if busy then
        return
    end

    local key = trim(KeyBox.Text)

    if key == "" then
        Status.Text = "Please enter your key."
        return
    end

    busy = true

    VerifyButton.Text = "VERIFYING..."
    Status.Text = "Checking your key..."

    local ok, sessionToken = verifyKey(key)

    if not ok then
        busy = false
        VerifyButton.Text = "VERIFY KEY"

        Status.Text = "❌ " .. tostring(sessionToken)

        return
    end

    -- Chỉ lưu Key sau khi server xác nhận thành công
    saveKey(key)

    Status.Text = "✅ Verified. Loading Hub..."
    VerifyButton.Text = "VERIFIED"

    task.wait(0.5)

    local loaded, errorMessage = startAfterVerify(sessionToken)

    if not loaded then
        busy = false
        VerifyButton.Text = "VERIFY KEY"

        Status.Text = "❌ " .. tostring(errorMessage)

        return
    end

    -- Thành công -> đóng Loader
    if ScreenGui then
        ScreenGui:Destroy()
    end
end

VerifyButton.MouseButton1Click:Connect(verify)

KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verify()
    end
end)

--==================================================
-- AUTO LOAD SAVED KEY
--==================================================

task.spawn(function()
    task.wait(0.3)

    local savedKey = loadSavedKey()

    if savedKey then
        KeyBox.Text = savedKey
        Status.Text = "Saved key detected. Verifying..."

        task.wait(0.5)

        verify()
    else
        Status.Text = "Enter your key."
        KeyBox:CaptureFocus()
    end
end)
