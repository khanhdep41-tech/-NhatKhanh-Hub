-- hopsvv.lua
-- NhatKhanh Hub
-- Re-execute chính hopsvv.lua sau teleport/server hop

local SOURCE_URL = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/hopsvv.lua"

local function queueForTeleport()
    local queuedCode = [[
        task.wait(2)

        pcall(function()
            local source = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/hopsvv.lua"
            local response = game:HttpGet(source)
            local fn = loadstring(response)

            if fn then
                fn()
            end
        end)
    ]]

    if type(queue_on_teleport) == "function" then
        return pcall(function()
            queue_on_teleport(queuedCode)
        end)
    end

    if type(queueonteleport) == "function" then
        return pcall(function()
            queueonteleport(queuedCode)
        end)
    end

    if type(syn) == "table"
        and type(syn.queue_on_teleport) == "function" then

        return pcall(function()
            syn.queue_on_teleport(queuedCode)
        end)
    end

    return false
end

pcall(queueForTeleport)


-- ==========================================
-- FULL SCREEN NOTICE
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "hopsvv"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = player:WaitForChild("PlayerGui")


-- Nền trắng toàn màn hình
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.fromScale(1, 1)
background.Position = UDim2.fromScale(0, 0)
background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
background.BorderSizePixel = 0
background.Parent = gui


-- Khung nội dung
local content = Instance.new("Frame")
content.Name = "Notice"
content.AnchorPoint = Vector2.new(0.5, 0.5)
content.Position = UDim2.fromScale(0.5, 0.5)
content.Size = UDim2.new(0.86, 0, 0, 360)
content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
content.BorderSizePixel = 0
content.Parent = background

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MaxSize = Vector2.new(600, 360)
sizeConstraint.MinSize = Vector2.new(300, 300)
sizeConstraint.Parent = content


-- Tiêu đề
local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 25, 0, 25)
title.Size = UDim2.new(1, -50, 0, 55)
title.Font = Enum.Font.GothamBold
title.Text = "TÀI KHOẢN ĐÃ BỊ KHÓA"
title.TextColor3 = Color3.fromRGB(25, 25, 25)
title.TextSize = 28
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = content


-- Dấu chấm
local dot = Instance.new("TextLabel")
dot.Name = "Dot"
dot.BackgroundTransparency = 1
dot.Position = UDim2.new(0, 25, 0, 82)
dot.Size = UDim2.new(0, 30, 0, 30)
dot.Font = Enum.Font.GothamBold
dot.Text = "."
dot.TextColor3 = Color3.fromRGB(220, 40, 40)
dot.TextSize = 28
dot.Parent = content


-- Nội dung
local message = Instance.new("TextLabel")
message.Name = "Message"
message.BackgroundTransparency = 1
message.Position = UDim2.new(0, 25, 0, 120)
message.Size = UDim2.new(1, -50, 0, 150)
message.Font = Enum.Font.Gotham
message.Text = [[
Tài khoản của bạn đã bị khóa vĩnh viễn
khỏi trải nghiệm này.

Lý do:
Phát hiện gian lận / sử dụng phần mềm trái phép

Thời hạn:
Vĩnh viễn
]]
message.TextColor3 = Color3.fromRGB(45, 45, 45)
message.TextSize = 17
message.TextWrapped = true
message.TextXAlignment = Enum.TextXAlignment.Left
message.TextYAlignment = Enum.TextYAlignment.Top
message.Parent = content


-- Dòng cuối
local footer = Instance.new("TextLabel")
footer.Name = "Footer"
footer.BackgroundTransparency = 1
footer.Position = UDim2.new(0, 25, 1, -55)
footer.Size = UDim2.new(1, -50, 0, 30)
footer.Font = Enum.Font.Gotham
footer.Text = "."
footer.TextColor3 = Color3.fromRGB(120, 120, 120)
footer.TextSize = 14
footer.TextXAlignment = Enum.TextXAlignment.Left
footer.Parent = content
