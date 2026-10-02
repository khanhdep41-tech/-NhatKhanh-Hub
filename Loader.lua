local API_URL = "https://bloxhub-api.onrender.com"
local SCRIPT_ENDPOINT = API_URL .. "/api/script"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local old = PlayerGui:FindFirstChild("BloxHubKeySystem")
if old then
    old:Destroy()
end

--------------------------------------------------
-- HTTP REQUEST
--------------------------------------------------

local function request(url, method, body, extraHeaders)
    local req =
        (syn and syn.request)
        or (http and http.request)
        or request
        or (fluxus and fluxus.request)

    if req then
        local headers = {
            ["Content-Type"] = "application/json"
        }

        if extraHeaders then
            for name, value in pairs(extraHeaders) do
                headers[name] = value
            end
        end

        local response = req({
            Url = url,
            Method = method or "GET",
            Headers = headers,
            Body = body and HttpService:JSONEncode(body) or nil
        })

        return response
    end

    if method == "GET" then
        return {
            StatusCode = 200,
            Body = game:HttpGet(url)
        }
    end

    error("Your executor does not expose an HTTP request function.")
end

--------------------------------------------------
-- GET HWID
--------------------------------------------------

local function getHWID()
    if type(gethwid) == "function" then
        local ok, value = pcall(gethwid)

        if ok and value and value ~= "" then
            return tostring(value)
        end
    end

    if type(get_hwid) == "function" then
        local ok, value = pcall(get_hwid)

        if ok and value and value ~= "" then
            return tostring(value)
        end
    end

    local ok, value = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)

    if ok and value and value ~= "" then
        return tostring(value)
    end

    return nil
end

--------------------------------------------------
-- TRIM
--------------------------------------------------

local function trim(value)
    return tostring(value or "")
        :gsub("^%s+", "")
        :gsub("%s+$", "")
end

--------------------------------------------------
-- VERIFY KEY
--------------------------------------------------

local function verifyKey(key)
    local hwid = getHWID()

    if not hwid then
        return false, "Could not determine your HWID."
    end

    local ok, response = pcall(function()
        return request(
            API_URL .. "/api/verify",
            "POST",
            {
                key = key,
                hwid = hwid
            }
        )
    end)

    if not ok or not response then
        return false, "Could not connect to the Blox Hub server."
    end

    local status = tonumber(response.StatusCode) or 0
    local body = response.Body or ""

    local decodedOk, data = pcall(function()
        return HttpService:JSONDecode(body)
    end)

    if not decodedOk then
        return false, "The server returned an invalid response."
    end

    if status ~= 200 or not data.valid then
        return false, tostring(
            data.message or "Key verification failed."
        )
    end

    return true, data
end

--------------------------------------------------
-- LOAD HUB
--------------------------------------------------

local function loadHub(sessionToken)
    if not sessionToken or sessionToken == "" then
        return false, "Missing session token."
    end

    local ok, response = pcall(function()
        return request(
            SCRIPT_ENDPOINT,
            "GET",
            nil,
            {
                ["X-Session-Token"] = sessionToken
            }
        )
    end)

    if not ok or not response then
        return false, "Could not download the Blox Hub script."
    end

    local status = tonumber(response.StatusCode) or 0

    if status < 200 or status >= 400 then
        return false,
            "The Blox Hub script request failed. HTTP "
            .. tostring(status)
    end

    local source = response.Body

    if type(source) ~= "string" or #source == 0 then
        return false, "The Blox Hub server returned an empty script."
    end

    local fn, compileError = loadstring(source)

    if not fn then
        return false,
            "The returned Blox Hub source could not be compiled: "
            .. tostring(compileError)
    end

    local runOk, runError = pcall(fn)

    if not runOk then
        return false,
            "Blox Hub failed to start: "
            .. tostring(runError)
    end

    return true
end

--------------------------------------------------
-- GUI
--------------------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxHubKeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(390, 230)
Main.Position = UDim2.new(0.5, -195, 0.5, -115)
Main.BackgroundColor3 = Color3.fromRGB(190, 45, 150)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(245, 100, 210)
Stroke.Thickness = 2
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(20, 12)
Title.Size = UDim2.new(1, -40, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Blox Hub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 24
Title.Parent = Main

local Subtitle = Instance.new("TextLabel")
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.fromOffset(20, 47)
Subtitle.Size = UDim2.new(1, -40, 0, 28)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Enter your key to continue"
Subtitle.TextColor3 = Color3.fromRGB(255, 225, 248)
Subtitle.TextSize = 14
Subtitle.Parent = Main

local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Position = UDim2.fromOffset(25, 88)
KeyBox.Size = UDim2.new(1, -50, 0, 45)
KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Gotham
KeyBox.PlaceholderText = "Enter your key"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(35, 20, 32)
KeyBox.PlaceholderColor3 = Color3.fromRGB(150, 125, 145)
KeyBox.TextSize = 14
KeyBox.Parent = Main

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyBox

local VerifyButton = Instance.new("TextButton")
VerifyButton.Name = "Verify"
VerifyButton.Position = UDim2.fromOffset(25, 145)
VerifyButton.Size = UDim2.new(1, -50, 0, 42)
VerifyButton.BackgroundColor3 = Color3.fromRGB(235, 75, 195)
VerifyButton.BorderSizePixel = 0
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.Text = "VERIFY KEY"
VerifyButton.TextColor3 = Color3.new(1, 1, 1)
VerifyButton.TextSize = 15
VerifyButton.Parent = Main

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 8)
VerifyCorner.Parent = VerifyButton

local Status = Instance.new("TextLabel")
Status.BackgroundTransparency = 1
Status.Position = UDim2.fromOffset(20, 192)
Status.Size = UDim2.new(1, -40, 0, 25)
Status.Font = Enum.Font.Gotham
Status.Text = "Ready"
Status.TextColor3 = Color3.fromRGB(255, 235, 252)
Status.TextSize = 12
Status.TextWrapped = true
Status.Parent = Main

--------------------------------------------------
-- DRAG
--------------------------------------------------

local dragging = false
local dragStart
local startPosition

local function beginDrag(input)
    dragging = true
    dragStart = input.Position
    startPosition = Main.Position

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

local function updateDrag(input)
    if not dragging then
        return
    end

    local delta = input.Position - dragStart

    Main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        beginDrag(input)
    end
end)

Subtitle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        beginDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        updateDrag(input)
    end
end)

--------------------------------------------------
-- VERIFY
--------------------------------------------------

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

    local ok, result = verifyKey(key)

    if not ok then
        busy = false

        VerifyButton.Text = "VERIFY KEY"
        Status.Text = "❌ " .. tostring(result)

        return
    end

    local sessionToken = result.sessionToken

    if not sessionToken or sessionToken == "" then
        busy = false

        VerifyButton.Text = "VERIFY KEY"
        Status.Text = "❌ Server did not return a session token."

        return
    end

    Status.Text = "✅ Key verified. Loading Blox Hub..."
    VerifyButton.Text = "VERIFIED"

    task.wait(0.5)

    ScreenGui:Destroy()

    local loaded, errorMessage = loadHub(sessionToken)

    if not loaded then
        warn("[Blox Hub] " .. tostring(errorMessage))
    end
end

VerifyButton.MouseButton1Click:Connect(verify)

KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verify()
    end
end)

KeyBox:CaptureFocus()
