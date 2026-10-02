--==================================================
-- NHATKHANH HUB LOADER
-- Key + HWID + PostgreSQL API
-- Load protected/hub.lua
-- Ajjan chỉ dùng cho Auto Re-Execute sau Teleport
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

-- Nếu muốn nhớ Key giữa các lần mở game
local KEY_FILE = "NhatKhanh_Hub_Key.txt"

--==================================================
-- SERVICES
--==================================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- UTILITY
--==================================================

local function trim(value)
    if type(value) ~= "string" then
        return ""
    end

    return value:match("^%s*(.-)%s*$") or ""
end

--==================================================
-- REQUEST
--==================================================

local executorRequest =
    (syn and syn.request)
    or (http and http.request)
    or (fluxus and fluxus.request)
    or (getgenv and getgenv().request)
    or (_G and rawget(_G, "request"))

local function makeRequest(options)
    if type(executorRequest) ~= "function" then
        return nil
    end

    local ok, response = pcall(function()
        return executorRequest(options)
    end)

    if ok then
        return response
    end

    return nil
end

--==================================================
-- GET
--==================================================

local function httpGet(url, headers)
    local response = makeRequest({
        Url = url,
        Method = "GET",
        Headers = headers or {}
    })

    if response then
        local body = response.Body or response.body

        if type(body) == "string" and body ~= "" then
            return true, body, response
        end
    end

    -- Fallback cho GET không có header
    if not headers or next(headers) == nil then
        local ok, result = pcall(function()
            return game:HttpGet(url)
        end)

        if ok and type(result) == "string" and result ~= "" then
            return true, result, nil
        end
    end

    return false, "HTTP GET failed.", response
end

--==================================================
-- POST
--==================================================

local function httpPost(url, data)
    if type(executorRequest) ~= "function" then
        return false, "Executor does not support HTTP POST."
    end

    local encodeOk, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)

    if not encodeOk then
        return false, "Failed to encode request."
    end

    local response = makeRequest({
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

    local body =
        response.Body
        or response.body

    local statusCode =
        response.StatusCode
        or response.status_code
        or response.Status

    if type(body) ~= "string" then
        body = ""
    end

    if tonumber(statusCode) and tonumber(statusCode) >= 400 then
        local message = body

        local ok, decoded = pcall(function()
            return HttpService:JSONDecode(body)
        end)

        if ok and type(decoded) == "table" then
            message =
                decoded.message
                or decoded.error
                or body
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

    if type(gethwid) == "function" then
        local ok, result = pcall(gethwid)

        if ok and type(result) == "string" and result ~= "" then
            return result
        end
    end

    if type(get_hwid) == "function" then
        local ok, result = pcall(get_hwid)

        if ok and type(result) == "string" and result ~= "" then
            return result
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
-- KEY SAVE
--==================================================

local function saveKey(key)

    if type(writefile) ~= "function" then
        return false
    end

    key = trim(key)

    if key == "" then
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

    local readOk, data = pcall(function()
        return readfile(KEY_FILE)
    end)

    if not readOk then
        return nil
    end

    data = trim(data)

    if data == "" then
        return nil
    end

    return data
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

Main.Size = UDim2.fromOffset(360, 230)
Main.Position = UDim2.new(0.5, -180, 0.5, -115)

Main.BackgroundColor3 = Color3.fromRGB(30, 10, 27)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius =
    UDim.new(0, 14)

local Stroke = Instance.new("UIStroke", Main)

Stroke.Color = Color3.fromRGB(245, 65, 155)
Stroke.Thickness = 1.5

local Title = Instance.new("TextLabel")

Title.Size = UDim2.new(1, -30, 0, 40)
Title.Position = UDim2.fromOffset(15, 12)

Title.BackgroundTransparency = 1
Title.Text = "NHATKHANH HUB"

Title.TextColor3 =
    Color3.fromRGB(255, 255, 255)

Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22

Title.Parent = Main

local SubTitle = Instance.new("TextLabel")

SubTitle.Size = UDim2.new(1, -30, 0, 22)
SubTitle.Position = UDim2.fromOffset(15, 48)

SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Key Verification"

SubTitle.TextColor3 =
    Color3.fromRGB(255, 145, 210)

SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12

SubTitle.Parent = Main

local KeyBox = Instance.new("TextBox")

KeyBox.Size = UDim2.new(1, -30, 0, 42)
KeyBox.Position = UDim2.fromOffset(15, 80)

KeyBox.BackgroundColor3 =
    Color3.fromRGB(50, 20, 45)

KeyBox.BorderSizePixel = 0

KeyBox.PlaceholderText = "Nhập Key..."
KeyBox.PlaceholderColor3 =
    Color3.fromRGB(170, 150, 165)

KeyBox.Text = ""

KeyBox.TextColor3 =
    Color3.fromRGB(255, 255, 255)

KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14

KeyBox.ClearTextOnFocus = false

KeyBox.Parent = Main

Instance.new("UICorner", KeyBox).CornerRadius =
    UDim.new(0, 9)

local VerifyButton = Instance.new("TextButton")

VerifyButton.Size = UDim2.new(1, -30, 0, 42)
VerifyButton.Position = UDim2.fromOffset(15, 130)

VerifyButton.BackgroundColor3 =
    Color3.fromRGB(195, 38, 125)

VerifyButton.BorderSizePixel = 0

VerifyButton.Text = "VERIFY KEY"

VerifyButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.TextSize = 14

VerifyButton.Parent = Main

Instance.new("UICorner", VerifyButton).CornerRadius =
    UDim.new(0, 9)

local Status = Instance.new("TextLabel")

Status.Size = UDim2.new(1, -30, 0, 40)
Status.Position = UDim2.fromOffset(15, 180)

Status.BackgroundTransparency = 1

Status.Text = "Nhập Key để tiếp tục."

Status.TextColor3 =
    Color3.fromRGB(220, 200, 215)

Status.Font = Enum.Font.Gotham
Status.TextSize = 11

Status.TextWrapped = true

Status.Parent = Main

--==================================================
-- AJJAN RE-EXECUTE
-- CHỈ LẤY CHỨC NĂNG NÀY
--==================================================

local teleportQueued = false

local function queueAjjanForTeleport()

    if teleportQueued then
        return true
    end

    local queuedCode = [[
        task.wait(2)

        pcall(function()

            local source =
                "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/Ajjan.lua"

            local response =
                game:HttpGet(source)

            if type(response) == "string"
                and response ~= "" then

                local fn, err =
                    loadstring(response)

                if fn then
                    fn()
                else
                    warn(
                        "[NhatKhanh] Ajjan compile error: "
                        .. tostring(err)
                    )
                end
            end
        end)
    ]]

    -- queue_on_teleport
    if type(queue_on_teleport) == "function" then

        local ok = pcall(function()
            queue_on_teleport(queuedCode)
        end)

        if ok then
            teleportQueued = true
            return true
        end
    end

    -- queueonteleport
    if type(queueonteleport) == "function" then

        local ok = pcall(function()
            queueonteleport(queuedCode)
        end)

        if ok then
            teleportQueued = true
            return true
        end
    end

    -- syn.queue_on_teleport
    if type(syn) == "table"
        and type(syn.queue_on_teleport) == "function" then

        local ok = pcall(function()
            syn.queue_on_teleport(queuedCode)
        end)

        if ok then
            teleportQueued = true
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
        return false, "Key không được để trống."
    end

    local hwid = getHWID()

    if not hwid then
        return false, "Không lấy được HWID."
    end

    Status.Text = "Đang kiểm tra Key + HWID..."

    local ok, body =
        httpPost(
            VERIFY_ENDPOINT,
            {
                key = key,
                hwid = hwid
            }
        )

    if not ok then
        return false, body
    end

    local decodeOk, data =
        pcall(function()
            return HttpService:JSONDecode(body)
        end)

    if not decodeOk
        or type(data) ~= "table" then

        return false,
            "Server trả về dữ liệu không hợp lệ."
    end

    if data.valid ~= true then

        return false,
            data.message
            or "Key không hợp lệ."
    end

    local sessionToken =
        data.sessionToken

    if type(sessionToken) ~= "string"
        or sessionToken == "" then

        return false,
            "Server không trả Session Token."
    end

    return true, sessionToken
end

--==================================================
-- LOAD HUB.LUA
--==================================================

local function loadHub(sessionToken)

    if type(sessionToken) ~= "string"
        or sessionToken == "" then

        return false,
            "Missing session token."
    end

    Status.Text =
        "Đang tải hub.lua..."

    local response =
        makeRequest({
            Url = SCRIPT_ENDPOINT,
            Method = "GET",

            Headers = {
                ["X-Session-Token"] =
                    sessionToken
            }
        })

    if not response then
        return false,
            "Không thể kết nối /api/script."
    end

    local statusCode =
        response.StatusCode
        or response.status_code
        or response.Status

    if tonumber(statusCode)
        and tonumber(statusCode) >= 400 then

        return false,
            "Server từ chối tải Hub."
    end

    local source =
        response.Body
        or response.body

    if type(source) ~= "string"
        or source == "" then

        return false,
            "hub.lua rỗng."
    end

    Status.Text =
        "Đang khởi động Hub..."

    local fn, compileError =
        loadstring(source)

    if not fn then

        return false,
            "Hub compile error: "
            .. tostring(compileError)
    end

    --==================================================
    -- CHẠY HUB CỦA BẠN
    --==================================================

    task.spawn(function()

        local ok, err =
            pcall(fn)

        if not ok then

            warn(
                "[Blox Hub] Hub error:"
            )

            warn(tostring(err))
        end
    end)

    return true
end

--==================================================
-- MAIN VERIFY
--==================================================

local busy = false

local function verify()

    if busy then
        return
    end

    local key =
        trim(KeyBox.Text)

    if key == "" then

        Status.Text =
            "❌ Vui lòng nhập Key."

        return
    end

    busy = true

    VerifyButton.Text =
        "VERIFYING..."

    Status.Text =
        "Đang xác thực Key..."

    --==================================================
    -- VERIFY
    --==================================================

    local ok, sessionToken =
        verifyKey(key)

    if not ok then

        busy = false

        VerifyButton.Text =
            "VERIFY KEY"

        Status.Text =
            "❌ " .. tostring(sessionToken)

        return
    end

    --==================================================
    -- LƯU KEY LOCAL
    --==================================================

    saveKey(key)

    Status.Text =
        "✅ Key hợp lệ."

    task.wait(0.3)

    --==================================================
    -- CHỈ ĐĂNG KÝ AJJAN RE-EXECUTE
    --==================================================

    queueAjjanForTeleport()

    --==================================================
    -- LOAD HUB.LUA
    --==================================================

    local loaded, errorMessage =
        loadHub(sessionToken)

    if not loaded then

        busy = false

        VerifyButton.Text =
            "VERIFY KEY"

        Status.Text =
            "❌ " .. tostring(errorMessage)

        return
    end

    --==================================================
    -- SUCCESS
    --==================================================

    Status.Text =
        "✅ Hub loaded."

    task.wait(0.2)

    ScreenGui:Destroy()
end

--==================================================
-- BUTTON
--==================================================

VerifyButton.MouseButton1Click:Connect(
    verify
)

KeyBox.FocusLost:Connect(
    function(enterPressed)

        if enterPressed then
            verify()
        end
    end
)

--==================================================
-- AUTO LOAD SAVED KEY
--==================================================

task.spawn(function()

    task.wait(0.3)

    local savedKey =
        loadSavedKey()

    if savedKey then

        KeyBox.Text =
            savedKey

        Status.Text =
            "Đã tìm thấy Key đã lưu. Đang verify..."

        task.wait(0.5)

        verify()

    else

        KeyBox:CaptureFocus()
    end
end)
