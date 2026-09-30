-- Auto execute after server teleport (executor support required)
local SOURCE_URL = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/Account_Ban_Notice.lua"

local function queueForTeleport()
    local queued = [[
        task.wait(2)
        pcall(function()
            local src = game:HttpGet("]] .. SOURCE_URL .. [[")
            loadstring(src)()
        end)
    ]]

    if typeof(queue_on_teleport) == "function" then
        queue_on_teleport(queued)
        return true
    elseif typeof(queueonteleport) == "function" then
        queueonteleport(queued)
        return true
    elseif syn and typeof(syn.queue_on_teleport) == "function" then
        syn.queue_on_teleport(queued)
        return true
    end

    return false
end

pcall(queueForTeleport)

-- Account ban notice simulation
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("AccountBanNotice")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "AccountBanNotice"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = pg

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(245,245,245)
bg.BorderSizePixel = 0
bg.Parent = gui

local panel = Instance.new("Frame")
panel.Size = UDim2.fromOffset(520,330)
panel.Position = UDim2.new(0.5,-260,0.5,-165)
panel.BackgroundColor3 = Color3.fromRGB(255,255,255)
panel.BorderSizePixel = 0
panel.Parent = bg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,8)
corner.Parent = panel

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(225,225,225)
stroke.Thickness = 1
stroke.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-50,0,48)
title.Position = UDim2.fromOffset(25,25)
title.BackgroundTransparency = 1
title.Text = "TÀI KHOẢN BỊ KHÓA"
title.TextColor3 = Color3.fromRGB(35,35,35)
title.Font = Enum.Font.GothamBold
title.TextSize = 25
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = panel

local dot = Instance.new("TextLabel")
dot.Size = UDim2.fromOffset(20,20)
dot.Position = UDim2.new(1,-45,0,34)
dot.BackgroundTransparency = 1
dot.Text = "."
dot.TextColor3 = Color3.fromRGB(220,40,40)
dot.Font = Enum.Font.GothamBold
dot.TextSize = 24
dot.Parent = panel

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1,-50,0,115)
body.Position = UDim2.fromOffset(25,82)
body.BackgroundTransparency = 1
body.Text = "Chúng tôi phát hiện hoạt động gian lận hoặc sử dụng phần mềm không được phép trên tài khoản này.\n\nLý do: Gian lận / Sử dụng phần mềm trái phép\nThời hạn: Vĩnh viễn"
body.TextColor3 = Color3.fromRGB(65,65,65)
body.Font = Enum.Font.Gotham
body.TextSize = 16
body.TextWrapped = true
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Parent = panel

local line = Instance.new("Frame")
line.Size = UDim2.new(1,-50,0,1)
line.Position = UDim2.fromOffset(25,215)
line.BackgroundColor3 = Color3.fromRGB(230,230,230)
line.BorderSizePixel = 0
line.Parent = panel

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1,-50,0,50)
info.Position = UDim2.fromOffset(25,235)
info.BackgroundTransparency = 1
info.Text = "."
info.TextColor3 = Color3.fromRGB(120,120,120)
info.Font = Enum.Font.Gotham
info.TextSize = 13
info.TextXAlignment = Enum.TextXAlignment.Left
info.Parent = panel
