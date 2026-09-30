-- Auto re-execute after server teleport when supported by the executor.
local SOURCE_URL = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/NhatKhanh_Compact_BanWarning.lua"

local function queueForTeleport()
    local queuedCode = [[
        task.wait(2)
        pcall(function()
            local source = "]] .. SOURCE_URL .. [["
            local response = game:HttpGet(source)
            local fn = loadstring(response)
            if fn then fn() end
        end)
    ]]

    if type(queue_on_teleport) == "function" then
        return pcall(function() queue_on_teleport(queuedCode) end)
    elseif type(queueonteleport) == "function" then
        return pcall(function() queueonteleport(queuedCode) end)
    elseif type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
        return pcall(function() syn.queue_on_teleport(queuedCode) end)
    end

    return false
end

pcall(queueForTeleport)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("NhatKhanhBanWarning")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "Cảnh Báo Gian Lận"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.DisplayOrder = 999999
gui.Parent = pg

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
bg.BorderSizePixel = 0
bg.Parent = gui

local panel = Instance.new("Frame")
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.new(0.82, 0, 0.62, 0)
panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
panel.BorderSizePixel = 0
panel.Parent = bg

local maxSize = Instance.new("UISizeConstraint")
maxSize.MaxSize = Vector2.new(720, 430)
maxSize.MinSize = Vector2.new(420, 290)
maxSize.Parent = panel

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = panel

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(225, 225, 225)
stroke.Thickness = 1
stroke.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 52)
title.Position = UDim2.fromOffset(25, 25)
title.BackgroundTransparency = 1
title.Text = "TÀI KHOẢN BỊ HẠN CHẾ"
title.TextColor3 = Color3.fromRGB(35, 35, 35)
title.Font = Enum.Font.GothamBold
title.TextSize = 25
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = panel

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1, -50, 0, 145)
body.Position = UDim2.fromOffset(25, 82)
body.BackgroundTransparency = 1
body.Text = " phát hiện hoạt động gian lận hoặc sử dụng phần mềm không được phép trong phiên này.\n\nLý do: Gian lận / Sử dụng phần mềm trái phép\nThời hạn: Vĩnh viễn"
body.TextColor3 = Color3.fromRGB(65, 65, 65)
body.Font = Enum.Font.Gotham
body.TextSize = 16
body.TextWrapped = true
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Parent = panel

local line = Instance.new("Frame")
line.Size = UDim2.new(1, -50, 0, 1)
line.Position = UDim2.fromOffset(25, 235)
line.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
line.BorderSizePixel = 0
line.Parent = panel

local dot = Instance.new("Frame")
dot.Size = UDim2.fromOffset(6, 6)
dot.Position = UDim2.new(0, 25, 0, 270)
dot.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
dot.BorderSizePixel = 0
dot.Parent = panel

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = dot
