--==================================================
-- NHATKHANH HUB LOADER
-- KEY + HWID + RENDER API
--
-- FLOW:
-- Loader
--   -> Verify Key + HWID
--   -> Get session
--   -> Get protected/hub.lua
--   -> Run hub.lua
--
-- Khi Hub hop server:
--   -> queue loader
--   -> server mới
--   -> Verify Key + HWID lại
--   -> Get session mới
--   -> Get hub.lua
--   -> Run hub.lua
--
-- KHÔNG DÙNG AJJAN.LUA
--==================================================
if not game:IsLoaded() then
    game.Loaded:Wait()
end
--==================================================
-- CONFIG
--==================================================
local API_URL =
    "https://bloxhub-api.onrender.com"
local VERIFY_ENDPOINT =
    API_URL .. "/api/verify"
local SCRIPT_ENDPOINT =
    API_URL .. "/api/script"
local KEY_FILE =
    "NhatKhanh_Hub_Key.txt"
--==================================================
-- SERVICES
--==================================================
local Players =
    game:GetService("Players")
local HttpService =
    game:GetService("HttpService")
local RbxAnalyticsService =
    game:GetService("RbxAnalyticsService")
local LocalPlayer =
    Players.LocalPlayer
--==================================================
-- HELPERS
--==================================================
local function trim(value)
    if type(value) ~= "string" then
        return ""
    end
    return value:match("^%s*(.-)%s*$") or ""
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
local function makeRequest(options)
    if type(executorRequest) ~= "function" then
        return nil
    end
    local ok, response =
        pcall(function()
            return executorRequest(options)
        end)
    if ok then
        return response
    end
    return nil
end
--==================================================
-- POST
--==================================================
local function httpPost(url, data)
    if type(executorRequest) ~= "function" then
        return false,
            "Executor không hỗ trợ HTTP Request."
    end
    local encodeOk, encoded =
        pcall(function()
            return HttpService:JSONEncode(data)
        end)
    if not encodeOk then
        return false,
            "Không thể mã hóa request."
    end
    local response =
        makeRequest({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] =
                    "application/json"
            },
            Body = encoded
        })
    if not response then
        return false,
            "Không thể kết nối API."
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
    if tonumber(statusCode)
        and tonumber(statusCode) >= 400 then
        local message =
            body
        local decodeOk, decoded =
            pcall(function()
                return HttpService:JSONDecode(body)
            end)
        if decodeOk
            and type(decoded) == "table" then
            message =
                decoded.message
                or decoded.error
                or body
        end
        return false,
            tostring(message)
    end
    if body == "" then
        return false,
            "API trả về dữ liệu rỗng."
    end
    return true,
        body
end
--==================================================
-- GET SCRIPT
--==================================================
local function getHubSource(sessionToken)
    if type(sessionToken) ~= "string"
        or sessionToken == "" then
        return false,
            "Session Token không hợp lệ."
    end
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
            "Không thể tải hub.lua."
    end
    local statusCode =
        response.StatusCode
        or response.status_code
        or response.Status
    if tonumber(statusCode)
        and tonumber(statusCode) >= 400 then
        local body =
            response.Body
            or response.body
            or ""
        return false,
            "API từ chối tải Hub: "
            .. tostring(body)
    end
    local source =
        response.Body
        or response.body
    if type(source) ~= "string"
        or source == "" then
        return false,
            "hub.lua rỗng."
    end
    return true,
        source
end
--==================================================
-- HWID
--==================================================
local function getHWID()
    if type(gethwid) == "function" then
        local ok, result =
            pcall(gethwid)
        if ok
            and type(result) == "string"
            and result ~= "" then
            return result
        end
    end
    if type(get_hwid) == "function" then
        local ok, result =
            pcall(get_hwid)
        if ok
            and type(result) == "string"
            and result ~= "" then
            return result
        end
    end
    local ok, clientId =
        pcall(function()
            return RbxAnalyticsService:GetClientId()
        end)
    if ok
        and type(clientId) == "string"
        and clientId ~= "" then
        return clientId
    end
    return nil
end
--==================================================
-- SAVE KEY
--==================================================
local function saveKey(key)
    if type(writefile) ~= "function" then
        return false
    end
    key =
        trim(key)
    if key == "" then
        return false
    end
    local ok =
        pcall(function()
            writefile(
                KEY_FILE,
                key
            )
        end)
    return ok
end
--==================================================
-- LOAD SAVED KEY
--==================================================
local function loadSavedKey()
    if type(isfile) ~= "function" then
        return nil
    end
    if type(readfile) ~= "function" then
        return nil
    end
    local existsOk, exists =
        pcall(function()
            return isfile(KEY_FILE)
        end)
    if not existsOk
        or not exists then
        return nil
    end
    local readOk, data =
        pcall(function()
            return readfile(KEY_FILE)
        end)
    if not readOk then
        return nil
    end
    data =
        trim(data)
    if data == "" then
        return nil
    end
    return data
end
--==================================================
-- GUI
--==================================================
local ScreenGui =
    Instance.new("ScreenGui")
ScreenGui.Name =
    "NhatKhanh_Loader"
ScreenGui.ResetOnSpawn =
    false
ScreenGui.ZIndexBehavior =
    Enum.ZIndexBehavior.Sibling
pcall(function()
    ScreenGui.Parent =
        game:GetService("CoreGui")
end)
if not ScreenGui.Parent then
    ScreenGui.Parent =
        LocalPlayer:WaitForChild("PlayerGui")
end
--==================================================
-- MAIN
--==================================================
local Main =
    Instance.new("Frame")
Main.Name =
    "Main"
Main.Size =
    UDim2.new(0, 360, 0, 230)
Main.Position =
    UDim2.new(0.5, -180, 0.5, -115)
Main.BackgroundColor3 =
    Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel =
    0
Main.Parent =
    ScreenGui
local Corner =
    Instance.new("UICorner")
Corner.CornerRadius =
    UDim.new(0, 12)
Corner.Parent =
    Main
--==================================================
-- TITLE
--==================================================
local Title =
    Instance.new("TextLabel")
Title.Size =
    UDim2.new(1, -30, 0, 35)
Title.Position =
    UDim2.new(0, 15, 0, 15)
Title.BackgroundTransparency =
    1
Title.Text =
    "NHATKHANH HUB"
Title.TextColor3 =
    Color3.fromRGB(255, 255, 255)
Title.TextSize =
    22
Title.Font =
    Enum.Font.GothamBold
Title.Parent =
    Main
--==================================================
-- SUBTITLE
--==================================================
local Subtitle =
    Instance.new("TextLabel")
Subtitle.Size =
    UDim2.new(1, -30, 0, 25)
Subtitle.Position =
    UDim2.new(0, 15, 0, 48)
Subtitle.BackgroundTransparency =
    1
Subtitle.Text =
    "Key Verification"
Subtitle.TextColor3 =
    Color3.fromRGB(160, 160, 170)
Subtitle.TextSize =
    14
Subtitle.Font =
    Enum.Font.Gotham
Subtitle.Parent =
    Main
--==================================================
-- KEY BOX
--==================================================
local KeyBox =
    Instance.new("TextBox")
KeyBox.Size =
    UDim2.new(1, -40, 0, 42)
KeyBox.Position =
    UDim2.new(0, 20, 0, 82)
KeyBox.BackgroundColor3 =
    Color3.fromRGB(32, 32, 40)
KeyBox.BorderSizePixel =
    0
KeyBox.PlaceholderText =
    "Nhập Key..."
KeyBox.PlaceholderColor3 =
    Color3.fromRGB(120, 120, 130)
KeyBox.Text =
    ""
KeyBox.TextColor3 =
    Color3.fromRGB(255, 255, 255)
KeyBox.TextSize =
    14
KeyBox.Font =
    Enum.Font.Gotham
KeyBox.ClearTextOnFocus =
    false
KeyBox.Parent =
    Main
local KeyCorner =
    Instance.new("UICorner")
KeyCorner.CornerRadius =
    UDim.new(0, 8)
KeyCorner.Parent =
    KeyBox
local KeyPadding =
    Instance.new("UIPadding")
KeyPadding.PaddingLeft =
    UDim.new(0, 12)
KeyPadding.PaddingRight =
    UDim.new(0, 12)
KeyPadding.Parent =
    KeyBox
--==================================================
-- VERIFY BUTTON
--==================================================
local VerifyButton =
    Instance.new("TextButton")
VerifyButton.Size =
    UDim2.new(1, -40, 0, 42)
VerifyButton.Position =
    UDim2.new(0, 20, 0, 132)
VerifyButton.BackgroundColor3 =
    Color3.fromRGB(70, 70, 80)
VerifyButton.BorderSizePixel =
    0
VerifyButton.Text =
    "VERIFY KEY"
VerifyButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)
VerifyButton.TextSize =
    14
VerifyButton.Font =
    Enum.Font.GothamBold
VerifyButton.Parent =
    Main
local ButtonCorner =
    Instance.new("UICorner")
ButtonCorner.CornerRadius =
    UDim.new(0, 8)
ButtonCorner.Parent =
    VerifyButton
--==================================================
-- STATUS
--==================================================
local Status =
    Instance.new("TextLabel")
Status.Size =
    UDim2.new(1, -40, 0, 35)
Status.Position =
    UDim2.new(0, 20, 0, 180)
Status.BackgroundTransparency =
    1
Status.Text =
    "Nhập Key để tiếp tục."
Status.TextColor3 =
    Color3.fromRGB(170, 170, 180)
Status.TextSize =
    12
Status.Font =
    Enum.Font.Gotham
Status.TextWrapped =
    true
Status.Parent =
    Main
--==================================================
-- DRAG
--==================================================
local dragging =
    false
local dragStart
local startPosition
Title.InputBegan:Connect(
    function(input)
        if input.UserInputType
            == Enum.UserInputType.MouseButton1 then
            dragging =
                true
            dragStart =
                input.Position
            startPosition =
                Main.Position
            input.Changed:Connect(
                function()
                    if input.UserInputState
                        == Enum.UserInputState.End then
                        dragging =
                            false
                    end
                end
            )
        end
    end
)
game:GetService("UserInputService").InputChanged:Connect(
    function(input)
        if not dragging then
            return
        end
        if input.UserInputType
            ~= Enum.UserInputType.MouseMovement then
            return
        end
        local delta =
            input.Position
            - dragStart
        Main.Position =
            UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
    end
)
--==================================================
-- VERIFY KEY
--==================================================
local function verifyKey(key)
    key =
        trim(key)
    if key == "" then
        return false,
            "Key không được để trống."
    end
    local hwid =
        getHWID()
    if not hwid then
        return false,
            "Không lấy được HWID."
    end
    Status.Text =
        "Đang kiểm tra Key + HWID..."
    local ok, body =
        httpPost(
            VERIFY_ENDPOINT,
            {
                key = key,
                hwid = hwid
            }
        )
    if not ok then
        return false,
            body
    end
    local decodeOk, data =
        pcall(function()
            return HttpService:JSONDecode(body)
        end)
    if not decodeOk
        or type(data) ~= "table" then
        return false,
            "Server trả dữ liệu không hợp lệ."
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
    return true,
        sessionToken
end
--==================================================
-- LOAD HUB
--==================================================
local function loadHub(sessionToken)
    Status.Text =
        "Đang tải hub.lua..."
    local ok, source =
        getHubSource(
            sessionToken
        )
    if not ok then
        return false,
            source
    end
    local fn, compileError =
        loadstring(source)
    if not fn then
        return false,
            "Hub compile error: "
            .. tostring(compileError)
    end
    Status.Text =
        "Đang khởi động Hub..."
    task.spawn(
        function()
            local runOk, runError =
                pcall(fn)
            if not runOk then
                warn(
                    "[NhatKhanh] hub.lua error:"
                )
                warn(
                    tostring(runError)
                )
            end
        end
    )
    return true
end
--==================================================
-- QUEUE HUB AFTER TELEPORT
--==================================================
local teleportQueued =
    false
local function queueHubForTeleport()
    if teleportQueued then
        return true
    end
    -- IMPORTANT:
    -- Đây là code chạy ở SERVER MỚI.
    -- Nó KHÔNG gọi Ajjan.lua.
    -- Nó lấy Key đã lưu -> lấy HWID
    -- -> verify lại -> lấy session mới
    -- -> tải chính /api/script -> chạy hub.lua.
    local queuedCode = [[
        task.wait(2)
        pcall(function()
            local API_URL =
                "https://bloxhub-api.onrender.com"
            local VERIFY_ENDPOINT =
                API_URL .. "/api/verify"
            local SCRIPT_ENDPOINT =
                API_URL .. "/api/script"
            local KEY_FILE =
                "NhatKhanh_Hub_Key.txt"
            local Players =
                game:GetService("Players")
            local HttpService =
                game:GetService("HttpService")
            local RbxAnalyticsService =
                game:GetService("RbxAnalyticsService")
            local LocalPlayer =
                Players.LocalPlayer
            local function trim(value)
                if type(value) ~= "string" then
                    return ""
                end
                return value:match("^%s*(.-)%s*$") or ""
            end
            local function getHWID()
                if type(gethwid) == "function" then
                    local ok, result =
                        pcall(gethwid)
                    if ok
                        and type(result) == "string"
                        and result ~= "" then
                        return result
                    end
                end
                if type(get_hwid) == "function" then
                    local ok, result =
                        pcall(get_hwid)
                    if ok
                        and type(result) == "string"
                        and result ~= "" then
                        return result
                    end
                end
                local ok, clientId =
                    pcall(function()
                        return RbxAnalyticsService:GetClientId()
                    end)
                if ok
                    and type(clientId) == "string"
                    and clientId ~= "" then
                    return clientId
                end
                return nil
            end
            local function loadSavedKey()
                if type(isfile) ~= "function" then
                    return nil
                end
                if type(readfile) ~= "function" then
                    return nil
                end
                local existsOk, exists =
                    pcall(function()
                        return isfile(KEY_FILE)
                    end)
                if not existsOk
                    or not exists then
                    return nil
                end
                local readOk, data =
                    pcall(function()
                        return readfile(KEY_FILE)
                    end)
                if not readOk then
                    return nil
                end
                data =
                    trim(data)
                if data == "" then
                    return nil
                end
                return data
            end
            local executorRequest =
                (syn and syn.request)
                or (http and http.request)
                or (fluxus and fluxus.request)
                or (getgenv and getgenv().request)
                or (_G and rawget(_G, "request"))
            if type(executorRequest) ~= "function" then
                return
            end
            local function request(options)
                local ok, response =
                    pcall(function()
                        return executorRequest(options)
                    end)
                if ok then
                    return response
                end
                return nil
            end
            local key =
                loadSavedKey()
            if not key then
                warn(
                    "[NhatKhanh] Không tìm thấy Key đã lưu."
                )
                return
            end
            local hwid =
                getHWID()
            if not hwid then
                warn(
                    "[NhatKhanh] Không lấy được HWID."
                )
                return
            end
            --========================================
            -- VERIFY LẠI KEY Ở SERVER MỚI
            --========================================
            local encodedOk, encoded =
                pcall(function()
                    return HttpService:JSONEncode({
                        key = key,
                        hwid = hwid
                    })
                end)
            if not encodedOk then
                return
            end
            local verifyResponse =
                request({
                    Url = VERIFY_ENDPOINT,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] =
                            "application/json"
                    },
                    Body = encoded
                })
            if not verifyResponse then
                warn(
                    "[NhatKhanh] Verify sau teleport thất bại."
                )
                return
            end
            local verifyBody =
                verifyResponse.Body
                or verifyResponse.body
            if type(verifyBody) ~= "string"
                or verifyBody == "" then
                return
            end
            local decodeOk, verifyData =
                pcall(function()
                    return HttpService:JSONDecode(
                        verifyBody
                    )
                end)
            if not decodeOk
                or type(verifyData) ~= "table" then
                return
            end
            if verifyData.valid ~= true then
                warn(
                    "[NhatKhanh] Key không còn hợp lệ: "
                    .. tostring(
                        verifyData.message
                        or "Unknown"
                    )
                )
                return
            end
            local sessionToken =
                verifyData.sessionToken
            if type(sessionToken) ~= "string"
                or sessionToken == "" then
                return
            end
            --========================================
            -- LẤY CHÍNH HUB.LUA
            --========================================
            local hubResponse =
                request({
                    Url = SCRIPT_ENDPOINT,
                    Method = "GET",
                    Headers = {
                        ["X-Session-Token"] =
                            sessionToken
                    }
                })
            if not hubResponse then
                warn(
                    "[NhatKhanh] Không tải được hub.lua."
                )
                return
            end
            local hubBody =
                hubResponse.Body
                or hubResponse.body
            if type(hubBody) ~= "string"
                or hubBody == "" then
                return
            end
            --========================================
            -- CHẠY HUB.LUA
            --========================================
            local fn, err =
                loadstring(hubBody)
            if not fn then
                warn(
                    "[NhatKhanh] hub.lua compile error: "
                    .. tostring(err)
                )
                return
            end
            local runOk, runError =
                pcall(fn)
            if not runOk then
                warn(
                    "[NhatKhanh] hub.lua error: "
                    .. tostring(runError)
                )
            end
        end)
    ]]
    --==================================================
    -- QUEUE
    --==================================================
    if type(queue_on_teleport) == "function" then
        local ok =
            pcall(function()
                queue_on_teleport(
                    queuedCode
                )
            end)
        if ok then
            teleportQueued =
                true
            return true
        end
    end
    if type(queueonteleport) == "function" then
        local ok =
            pcall(function()
                queueonteleport(
                    queuedCode
                )
            end)
        if ok then
            teleportQueued =
                true
            return true
        end
    end
    if type(syn) == "table"
        and type(syn.queue_on_teleport) == "function" then
        local ok =
            pcall(function()
                syn.queue_on_teleport(
                    queuedCode
                )
            end)
        if ok then
            teleportQueued =
                true
            return true
        end
    end
    return false
end
--==================================================
-- MAIN VERIFY
--==================================================
local busy =
    false
local function verify()
    if busy then
        return
    end
    busy =
        true
    VerifyButton.Text =
        "VERIFYING..."
    local key =
        trim(KeyBox.Text)
    if key == "" then
        busy =
            false
        VerifyButton.Text =
            "VERIFY KEY"
        Status.Text =
            "❌ Vui lòng nhập Key."
        return
    end
    local ok, sessionToken =
        verifyKey(key)
    if not ok then
        busy =
            false
        VerifyButton.Text =
            "VERIFY KEY"
        Status.Text =
            "❌ " .. tostring(sessionToken)
        return
    end
    -- Lưu Key để server mới dùng lại
    saveKey(key)
    Status.Text =
        "✅ Key hợp lệ."
    --==================================================
    -- QUEUE HUB RELOAD TRƯỚC KHI HUB HOP
    --==================================================
    local queued =
        queueHubForTeleport()
    if not queued then
        warn(
            "[NhatKhanh] Executor không hỗ trợ queue_on_teleport."
        )
        Status.Text =
            "⚠️ Executor không hỗ trợ auto re-execute."
    end
    task.wait(0.3)
    --==================================================
    -- CHẠY CHÍNH HUB.LUA
    --==================================================
    local loaded, errorMessage =
        loadHub(sessionToken)
    if not loaded then
        busy =
            false
        VerifyButton.Text =
            "VERIFY KEY"
        Status.Text =
            "❌ " .. tostring(errorMessage)
        return
    end
    Status.Text =
        "✅ Hub loaded."
    task.wait(0.3)
    -- Loader chỉ biến mất.
    -- hub.lua vẫn tiếp tục chạy.
    ScreenGui:Destroy()
end
--==================================================
-- BUTTON
--==================================================
VerifyButton.MouseButton1Click:Connect(
    verify
)
--==================================================
-- ENTER
--==================================================
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
task.spawn(
    function()
        task.wait(0.5)
        local savedKey =
            loadSavedKey()
        if savedKey then
            KeyBox.Text =
                savedKey
            Status.Text =
                "Đã tìm thấy Key. Đang verify..."
            task.wait(0.5)
            verify()
        else
            KeyBox:CaptureFocus()
        end
    end
)
