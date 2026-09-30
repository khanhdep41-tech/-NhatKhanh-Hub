-- NhatKhanh Hub - Compact Pink Payment UI
-- Static / lightweight / non-draggable / no animation / no close button

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("NhatKhanh_Compact")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "NhatKhanh_Compact"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = pg

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(330, 365)
main.Position = UDim2.new(0.5, -165, 0.5, -182)
main.BackgroundColor3 = Color3.fromRGB(38, 8, 30)
main.BorderSizePixel = 0
main.Active = false
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(245, 65, 155)
stroke.Thickness = 1.5

local header = Instance.new("Frame")
header.Size = UDim2.new(1, -16, 0, 55)
header.Position = UDim2.fromOffset(8, 8)
header.BackgroundColor3 = Color3.fromRGB(190, 35, 120)
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 11)

local logo = Instance.new("TextLabel")
logo.Size = UDim2.fromOffset(42, 42)
logo.Position = UDim2.fromOffset(7, 6)
logo.BackgroundColor3 = Color3.fromRGB(45, 4, 12)
logo.Text = "A"
logo.TextColor3 = Color3.fromRGB(255, 45, 45)
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 28
logo.Parent = header
Instance.new("UICorner", logo).CornerRadius = UDim.new(1, 0)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 0, 25)
title.Position = UDim2.fromOffset(57, 5)
title.BackgroundTransparency = 1
title.Text = "AJJANS HUB"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -60, 0, 20)
sub.Position = UDim2.fromOffset(57, 29)
sub.BackgroundTransparency = 1
sub.Text = "NhatKhanh Reseller"
sub.TextColor3 = Color3.fromRGB(255,205,232)
sub.Font = Enum.Font.Gotham
sub.TextSize = 11
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = header

local function section(y, h, titleText, bodyText)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -16, 0, h)
    box.Position = UDim2.fromOffset(8, y)
    box.BackgroundColor3 = Color3.fromRGB(55, 12, 43)
    box.BorderSizePixel = 0
    box.Parent = main
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -18, 0, 23)
    t.Position = UDim2.fromOffset(9, 5)
    t.BackgroundTransparency = 1
    t.Text = titleText
    t.TextColor3 = Color3.fromRGB(255,130,200)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = box

    local b = Instance.new("TextLabel")
    b.Size = UDim2.new(1, -18, 1, -31)
    b.Position = UDim2.fromOffset(9, 28)
    b.BackgroundTransparency = 1
    b.Text = bodyText
    b.TextColor3 = Color3.fromRGB(242,225,237)
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    b.TextWrapped = true
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.TextYAlignment = Enum.TextYAlignment.Top
    b.Parent = box
end

section(70, 78, "💰 THANH TOÁN", "🏦 Vietcombank\n👤 Nguyen Nhat Khanh\n🔢 STK: 0841000108129")

section(156, 91, "💵 BẢNG GIÁ", "♾️ Vĩnh viễn     280.000đ\n📅 1 tháng        130.000đ\n📆 1 tuần          90.000đ")

section(255, 55, "⚙️ FILE SETTING", "Discord: 50.000đ • Có video hướng dẫn • Update khi game update")

local zalo = Instance.new("TextLabel")
zalo.Size = UDim2.new(1, -16, 0, 42)
zalo.Position = UDim2.fromOffset(8, 315)
zalo.BackgroundColor3 = Color3.fromRGB(195, 38, 125)
zalo.Text = "📱 Zalo: 0986790434"
zalo.TextColor3 = Color3.new(1,1,1)
zalo.Font = Enum.Font.GothamBold
zalo.TextSize = 15
zalo.TextXAlignment = Enum.TextXAlignment.Center
zalo.TextYAlignment = Enum.TextYAlignment.Center
zalo.Parent = main
Instance.new("UICorner", zalo).CornerRadius = UDim.new(0, 10)
