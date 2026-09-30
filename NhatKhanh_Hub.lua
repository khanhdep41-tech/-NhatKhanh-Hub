local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Nhat Khanh"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game.CoreGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 290, 0, 220)

-- Scale the entire GUI to 50% while keeping the original layout intact
local UIScale = Instance.new("UIScale")
UIScale.Scale = 0.5
UIScale.Parent = MainFrame

MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(60, 60, 180)
Stroke.Thickness = 1.5

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 36)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.GothamBold
Title.Text = "Nhat Khan Hub"
Title.TextColor3 = Color3.fromRGB(230, 230, 230)
Title.TextSize = 14
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -28, 0, 6)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(230, 50, 50)
CloseBtn.TextSize = 13
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Info player sekarang
local NowLabel = Instance.new("TextLabel", MainFrame)
NowLabel.Position = UDim2.new(0, 10, 0, 44)
NowLabel.Size = UDim2.new(1, -20, 0, 22)
NowLabel.BackgroundTransparency = 1
NowLabel.Font = Enum.Font.GothamBold
NowLabel.TextXAlignment = Enum.TextXAlignment.Left
NowLabel.TextColor3 = Color3.fromRGB(89, 200, 80)
NowLabel.TextSize = 13

-- Status
local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Position = UDim2.new(0, 10, 0, 70)
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
StatusLabel.TextSize = 12
StatusLabel.TextWrapped = true

-- Max player setting
local MaxLabel = Instance.new("TextLabel", MainFrame)
MaxLabel.Position = UDim2.new(0, 10, 0, 105)
MaxLabel.Size = UDim2.new(1, -20, 0, 18)
MaxLabel.BackgroundTransparency = 1
MaxLabel.Font = Enum.Font.Gotham
MaxLabel.TextXAlignment = Enum.TextXAlignment.Left
MaxLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
MaxLabel.TextSize = 11
MaxLabel.Text = "Nhảy sever 1 người:"

local MaxBox = Instance.new("TextBox", MainFrame)
MaxBox.Position = UDim2.new(0, 10, 0, 126)
MaxBox.Size = UDim2.new(1, -20, 0, 28)
MaxBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
MaxBox.BorderSizePixel = 0
MaxBox.Font = Enum.Font.GothamBold
MaxBox.Text = "1"
MaxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxBox.TextSize = 14
MaxBox.ClearTextOnFocus = false
Instance.new("UICorner", MaxBox).CornerRadius = UDim.new(0, 6)

local HopBtn = Instance.new("TextButton", MainFrame)
HopBtn.Position = UDim2.new(0, 10, 0, 162)
HopBtn.Size = UDim2.new(0, 125, 0, 45)
HopBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 160)
HopBtn.BorderSizePixel = 0
HopBtn.Font = Enum.Font.GothamBold
HopBtn.Text = "Hop on command"
HopBtn.TextColor3 = Color3.fromRGB(235, 235, 235)
HopBtn.TextSize = 13
Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 6)

local AutoBtn = Instance.new("TextButton", MainFrame)
AutoBtn.Position = UDim2.new(0, 145, 0, 162)
AutoBtn.Size = UDim2.new(0, 135, 0, 45)
AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
AutoBtn.BorderSizePixel = 0
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.Text = "Auto Hop: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.TextSize = 13
Instance.new("UICorner", AutoBtn).CornerRadius = UDim.new(0, 6)

-- ==============================
-- LOGIC
-- ==============================

local autoEnabled = false
local autoThread = nil

-- Update label player count realtime
task.spawn(function()
    while ScreenGui.Parent do
        local count = #Players:GetPlayers()
        NowLabel.Text = " sever hiện có : " .. count
        task.wait(1)
    end
end)

local function getRandomServer()
    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local ok, raw = pcall(function() return game:HttpGet(url) end)
    if not ok or not raw or raw == ""  máy chủ đầy

    local ok2, data = pcall(HttpService.JSONDecode, HttpService, raw)
    if not ok2 or not data or not data.data or #data.data == 0 máy chủ đầy

    local currentId = tostring(game.JobId)
    local candidates = {}
    for _, s in ipairs(data.data) do
        if s.id and tostring(s.id) ~= currentId then
            table.insert(candidates, tostring(s.id))
        end
    end

    if #candidates == 0 then return nil end

    -- Ambil random dari kandidat
    return candidates[math.random(1, #candidates)]
end

local function hopOnce()
    local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
    local currentCount = #Players:GetPlayers()

    -- Cek dulu server sekarang
    if currentCount <= threshold then
        StatusLabel.Text = "✓ Server count " .. currentCount .. " player. if low hop."
        StatusLabel.TextColor3 = Color3.fromRGB(80, 200, 80)
        return false -- tidak perlu hop
    end

    StatusLabel.Text = "Server đầy " .. currentCount .. " player. Mencari server lain..."
    StatusLabel.TextColor3 = Color3.fromRGB(235, 180, 30)
    task.wait(0.5)

    local serverId = getRandomServer()
    if not serverId then
        StatusLabel.Text = "Gagal ambil server list. Cek HTTP Request di executor."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        return false
    end

    StatusLabel.Text = "Đang  dịch chuyển ..."
    StatusLabel.TextColor3 = Color3.fromRGB(100, 160, 235)
    task.wait(0.5)

    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(PlaceId, serverId, LocalPlayer)
    end)

    if not ok then
        StatusLabel.Text = "Teleport error: " .. tostring(err):sub(1, 60)
        StatusLabel.TextColor3 = Color3.fromRGB(235, 60, 60)
        return false
    end

    return true
end

HopBtn.MouseButton1Click:Connect(function()
    HopBtn.Active = false
    hopOnce()
    task.wait(2)
    HopBtn.Active = true
end)

AutoBtn.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled

    if autoEnabled then
        AutoBtn.Text = "Tự động Hop: ON"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)

        autoThread = task.spawn(function()
            while autoEnabled and ScreenGui.Parent do
                local threshold = math.max(1, math.floor(tonumber(MaxBox.Text) or 1))
                local count = #Players:GetPlayers()

                if count <= threshold then
                    -- Sudah di server yang sesuai, tidak perlu hop
                    StatusLabel.Text = "✓ " .. count .. " player di sini. Menunggu..."
                    StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
                    task.wait(3)
                else
                    hopOnce()
                    task.wait(5)
                end
            end
        end)
    else
        AutoBtn.Text = "Tự động Hop: OFF"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
        if autoThread then
            task.cancel(autoThread)
            autoThread = nil
        end
        StatusLabel.Text = "Tự Động Hop."
        StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    end
end)

-- Init
StatusLabel.Text = "Nhảy Sever Vip 1 Người."
StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
