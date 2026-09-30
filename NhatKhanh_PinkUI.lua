-- NhatKhanh Hub
-- Pink Fullscreen UI
-- Không có nút thoát / Không kéo di chuyển được

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("NhatKhanh_FullPink")
if old then
    old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "NhatKhanh_FullPink"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

-- Background
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.fromScale(1, 1)
background.Position = UDim2.fromScale(0, 0)
background.BackgroundColor3 = Color3.fromRGB(28, 8, 22)
background.BorderSizePixel = 0
background.Active = true
background.Parent = gui

-- Pink gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 18, 75)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(205, 45, 135)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 12, 55))
})
gradient.Rotation = 25
gradient.Parent = background

-- Dark overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(15, 5, 12)
overlay.BackgroundTransparency = 0.35
overlay.BorderSizePixel = 0
overlay.Parent = background

-- Main panel: gần full màn hình
local panel = Instance.new("Frame")
panel.Name = "MainPanel"
panel.Size = UDim2.fromScale(0.90, 0.86)
panel.Position = UDim2.fromScale(0.05, 0.07)
panel.BackgroundColor3 = Color3.fromRGB(48, 10, 38)
panel.BackgroundTransparency = 0.04
panel.BorderSizePixel = 0
panel.Active = true
panel.Parent = overlay

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 18)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(255, 82, 178)
panelStroke.Thickness = 2
panelStroke.Transparency = 0.1
panelStroke.Parent = panel

local panelGradient = Instance.new("UIGradient")
panelGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 14, 58)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 8, 28))
})
panelGradient.Rotation = 90
panelGradient.Parent = panel

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, -30, 0, 80)
header.Position = UDim2.fromOffset(15, 15)
header.BackgroundColor3 = Color3.fromRGB(205, 43, 135)
header.BackgroundTransparency = 0.12
header.BorderSizePixel = 0
header.Parent = panel

Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 66, 157)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 32, 108))
})
headerGradient.Rotation = 0
headerGradient.Parent = header

-- AJJANS HUB animated red "A" logo
local logo = Instance.new("Frame")
logo.Name = "AjjansLogo"
logo.Size = UDim2.fromOffset(58, 58)
logo.Position = UDim2.new(0, 12, 0.5, -29)
logo.BackgroundColor3 = Color3.fromRGB(18, 4, 8)
logo.BorderSizePixel = 0
logo.Parent = header
Instance.new("UICorner", logo).CornerRadius = UDim.new(1, 0)

local logoStroke = Instance.new("UIStroke", logo)
logoStroke.Color = Color3.fromRGB(255, 35, 35)
logoStroke.Thickness = 2

local aText = Instance.new("TextLabel")
aText.Size = UDim2.fromScale(1, 1)
aText.BackgroundTransparency = 1
aText.Text = "A"
dot.BackgroundTransparency = 0.05 + (1 - pulse) * 0.7

        aText.TextColor3 = Color3.fromRGB(255, 35, 35)
aText.Font = Enum.Font.GothamBlack
aText.TextSize = 38
aText.TextXAlignment = Enum.TextXAlignment.Center
aText.TextYAlignment = Enum.TextYAlignment.Center
aText.Parent = logo


local dot = Instance.new("Frame")
dot.Name = "PulseDot"
dot.Size = UDim2.fromOffset(9, 9)
dot.Position = UDim2.new(1, -8, 0, 4)
dot.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
dot.BorderSizePixel = 0
dot.Parent = logo
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

local ajText = Instance.new("TextLabel")
ajText.Size = UDim2.fromOffset(130, 22)
ajText.Position = UDim2.new(0, 70, 0.5, -11)
ajText.BackgroundTransparency = 1
ajText.Text = "AJJANS HUB"
ajText.TextColor3 = Color3.fromRGB(255, 75, 75)
ajText.Font = Enum.Font.GothamBold
ajText.TextSize = 15
ajText.TextXAlignment = Enum.TextXAlignment.Left
ajText.Parent = header


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -190, 0, 42)
title.Position = UDim2.fromOffset(155, 8)
title.BackgroundTransparency = 1
title.Text = "🌸 NHAT KHANH HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 25
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -30, 0, 22)
subtitle.Position = UDim2.fromOffset(15, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "STEAL AN EGG • PREMIUM HUB"
subtitle.TextColor3 = Color3.fromRGB(255, 205, 235)
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Center
subtitle.Parent = header

-- Center content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -50, 1, -125)
content.Position = UDim2.fromOffset(25, 110)
content.BackgroundTransparency = 1
content.Parent = panel

local scroll = Instance.new("ScrollingFrame")
scroll.Name = "PaymentPanel"
scroll.Size = UDim2.fromScale(1, 1)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 5
scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 92, 180)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new()
scroll.Parent = content

local padding = Instance.new("UIPadding", scroll)
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 20)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 12)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder

local function card(height, color)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -5, 0, height)
    f.BackgroundColor3 = color or Color3.fromRGB(59, 13, 46)
    f.BorderSizePixel = 0
    f.Parent = scroll
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

    local s = Instance.new("UIStroke", f)
    s.Color = Color3.fromRGB(255, 83, 175)
    s.Thickness = 1
    s.Transparency = 0.35
    return f
end

local function label(parent, textValue, size, color, bold, align)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -30, 1, 0)
    l.Position = UDim2.fromOffset(15, 0)
    l.BackgroundTransparency = 1
    l.Text = textValue
    l.TextColor3 = color or Color3.fromRGB(245, 225, 238)
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize = size or 14
    l.TextWrapped = true
    l.TextXAlignment = align or Enum.TextXAlignment.Left
    l.TextYAlignment = Enum.TextYAlignment.Center
    l.Parent = parent
    return l
end

-- HERO
local hero = card(92, Color3.fromRGB(188, 38, 123))
local hg = Instance.new("UIGradient", hero)
hg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 61, 153)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 28, 96))
})
hg.Rotation = 20

local heroTitle = label(hero, "🇻🇳  HƯỚNG DẪN THANH TOÁN\nNHATKHANH", 21,
    Color3.fromRGB(255,255,255), true, Enum.TextXAlignment.Center)

-- GREETING
local hello = card(62)
label(hello,
    "Xin chào bạn ❤️\nCảm ơn bạn đã mua AJJAN HUB từ NhatKhanh!",
    14, Color3.fromRGB(255,220,239), false, Enum.TextXAlignment.Center)

-- BANK
local bank = card(142, Color3.fromRGB(50, 13, 41))
label(bank, "🏦  PHƯƠNG THỨC THANH TOÁN", 16,
    Color3.fromRGB(255,125,195), true, Enum.TextXAlignment.Left).Size =
    UDim2.new(1,-30,0,34)

local bankInfo = Instance.new("TextLabel")
bankInfo.Size = UDim2.new(1,-30,0,90)
bankInfo.Position = UDim2.fromOffset(15,45)
bankInfo.BackgroundTransparency = 1
bankInfo.Text = "Ngân hàng:  Vietcombank\nTên tài khoản:  Nguyen Nhat Khanh\nSTK:  0841000108129"
bankInfo.TextColor3 = Color3.fromRGB(248,232,242)
bankInfo.Font = Enum.Font.GothamMedium
bankInfo.TextSize = 14
bankInfo.TextWrapped = true
bankInfo.TextXAlignment = Enum.TextXAlignment.Left
bankInfo.TextYAlignment = Enum.TextYAlignment.Center
bankInfo.Parent = bank

-- PRICES
local prices = card(160, Color3.fromRGB(54, 13, 44))
label(prices, "💵  BẢNG GIÁ KEY", 16,
    Color3.fromRGB(255,125,195), true, Enum.TextXAlignment.Left).Size =
    UDim2.new(1,-30,0,30)

local priceBox = Instance.new("Frame")
priceBox.Size = UDim2.new(1,-30,0,105)
priceBox.Position = UDim2.fromOffset(15,45)
priceBox.BackgroundTransparency = 1
priceBox.Parent = prices

local priceLayout = Instance.new("UIListLayout", priceBox)
priceLayout.FillDirection = Enum.FillDirection.Horizontal
priceLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
priceLayout.VerticalAlignment = Enum.VerticalAlignment.Center
priceLayout.Padding = UDim.new(0,8)

local function priceItem(icon, name, price)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0.32,0,1,0)
    f.BackgroundColor3 = Color3.fromRGB(78,19,61)
    f.BorderSizePixel = 0
    f.Parent = priceBox
    Instance.new("UICorner",f).CornerRadius = UDim.new(0,11)

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1,-8,1,-10)
    t.Position = UDim2.fromOffset(4,5)
    t.BackgroundTransparency = 1
    t.Text = icon.."\n"..name.."\n"..price
    t.TextColor3 = Color3.fromRGB(255,235,247)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.TextWrapped = true
    t.TextXAlignment = Enum.TextXAlignment.Center
    t.TextYAlignment = Enum.TextYAlignment.Center
    t.Parent = f
end

priceItem("♾️","VĨNH VIỄN","280.000đ")
priceItem("📅","1 THÁNG","130.000đ")
priceItem("📆","1 TUẦN","90.000đ")

-- SETTING
local setting = card(102, Color3.fromRGB(67, 19, 55))
label(setting,
    "⚙️  FILE SETTING DISCORD\n50.000đ\nCó video hướng dẫn • Update file mới sau khi game update",
    14, Color3.fromRGB(255,215,235), true, Enum.TextXAlignment.Center)

-- STEPS
local steps = card(180, Color3.fromRGB(50, 12, 40))
label(steps, "📌  SAU KHI CHUYỂN KHOẢN", 16,
    Color3.fromRGB(255,125,195), true, Enum.TextXAlignment.Left).Size =
    UDim2.new(1,-30,0,34)

local stepText = Instance.new("TextLabel")
stepText.Size = UDim2.new(1,-30,0,120)
stepText.Position = UDim2.fromOffset(15,45)
stepText.BackgroundTransparency = 1
stepText.Text =
    "1️⃣  Gửi ảnh giao dịch/chuyển khoản thành công.\n\n" ..
    "2️⃣  Mình kiểm tra và xác nhận thanh toán.\n\n" ..
    "3️⃣  Sau khi xác nhận, mình gửi KEY AJJAN HUB 🔑"
stepText.TextColor3 = Color3.fromRGB(245,225,238)
stepText.Font = Enum.Font.GothamMedium
stepText.TextSize = 13
stepText.TextWrapped = true
stepText.TextXAlignment = Enum.TextXAlignment.Left
stepText.TextYAlignment = Enum.TextYAlignment.Top
stepText.Parent = steps

-- WARNING
local warning = card(70, Color3.fromRGB(83, 49, 25))
local ws = Instance.new("UIStroke", warning)
ws.Color = Color3.fromRGB(255,177,72)
ws.Transparency = 0.15
label(warning,
    "⚠️  Kiểm tra đúng tên người nhận và STK trước khi chuyển khoản.",
    13, Color3.fromRGB(255,218,155), true, Enum.TextXAlignment.Center)

-- SUPPORT
local support = card(112, Color3.fromRGB(116, 24, 77))
local sg = Instance.new("UIGradient", support)
sg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180,35,117)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(105,20,72))
})
sg.Rotation = 0
label(support,
    "❤️  CẢM ƠN BẠN ĐÃ ỦNG HỘ NHATKHANH\n\n" ..
    "AJJAN HUB RESELLER\n" ..
    "📱 Zalo: 0986790434\n" ..
    "🔄 Hỗ trợ renew key vĩnh viễn nếu khách muốn pass",
    14, Color3.fromRGB(255,245,250), true, Enum.TextXAlignment.Center)


-- Animated effects: pulse + glow + gentle movement
task.spawn(function()
    local t = 0
    while gui.Parent do
        t += task.wait(0.035)

        local pulse = (math.sin(t * 4) + 1) / 2

        -- Red AJJANS logo pulse
        logoStroke.Thickness = 2 + pulse * 2
        logoStroke.Transparency = 0.05 + (1 - pulse) * 0.35
        aText.TextColor3 = Color3.fromRGB(
            220 + math.floor(35 * pulse),
            20 + math.floor(25 * pulse),
            20 + math.floor(25 * pulse)
        )
        dot.BackgroundTransparency = 0.05 + (1 - pulse) * 0.7

        -- Header glow
        panelStroke.Thickness = 2 + pulse * 1.4
        panelStroke.Transparency = 0.08 + (1 - pulse) * 0.25

        -- Soft floating/breathing effect; panel never becomes draggable.
        local breathe = math.sin(t * 1.8) * 2
        header.Position = UDim2.fromOffset(15, 15 + breathe)

        -- Pink glow on the contact card
        if support then
            local sgStroke = support:FindFirstChildOfClass("UIStroke")
            if sgStroke then
                sgStroke.Transparency = 0.12 + (1 - pulse) * 0.35
                sgStroke.Thickness = 1 + pulse * 1.5
            end
        end
    end
end)

-- Fade-in
panel.BackgroundTransparency = 1
TweenService:Create(
    panel,
    TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.04}
):Play()
