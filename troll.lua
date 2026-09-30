-- NhatKhanh Hub - Steal An Egg
-- Pink UI + live Pet/Egg inventory scanner

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local guiParent = player:WaitForChild("PlayerGui")

local old = guiParent:FindFirstChild("NhatKhanh_StealEgg")
if old then old:Destroy() end

local function notify(t)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "NhatKhanh Hub",
            Text = tostring(t),
            Duration = 3
        })
    end)
end

local Save, AssetItems, EggRecords, Remotes

pcall(function() Save = require(ReplicatedStorage.Shared.Save) end)
pcall(function() AssetItems = require(ReplicatedStorage.Shared.Util.AssetItems) end)
pcall(function() EggRecords = require(ReplicatedStorage.Shared.Util.EggRecords) end)
pcall(function() Remotes = require(ReplicatedStorage.Shared.Remotes) end)

local function getSave()
    if Save then
        for _, fn in ipairs({"Get", "Peek"}) do
            if type(Save[fn]) == "function" then
                local ok, data = pcall(Save[fn])
                if ok and type(data) == "table" then return data end
            end
        end
    end
end

local function getRemote(name)
    local satchel = Remotes and Remotes.PetSatchel
    if satchel and satchel[name] then return satchel[name] end

    local networking = ReplicatedStorage:FindFirstChild("Packages")
    networking = networking and networking:FindFirstChild("Networking")
    if networking then
        return networking:FindFirstChild("RE/PetSatchel/" .. name)
    end
end

local function decode(mod, value)
    if mod and mod.Decode then
        local ok, result = pcall(mod.Decode, value)
        if ok and result then return result end
    end
    return value
end

local pets, eggs = {}, {}

local function scan()
    pets, eggs = {}, {}
    local data = getSave()
    if not data then return false end

    local equipped = {}
    for _, uid in ipairs(data.EquippedAssets or data.EquippedPets or {}) do
        equipped[uid] = true
    end

    for uid, raw in pairs(data.Inventory or {}) do
        local item = decode(AssetItems, raw)
        if type(item) == "table" then
            table.insert(pets, {
                uid = uid,
                name = tostring(item.DisplayName or item.Name or item.Category or "Unknown Pet"),
                favorite = item.IsFavorite == true or item.Favorite == true,
                equipped = equipped[uid] == true
            })
        end
    end

    for uid, raw in pairs(data.EggInventory or {}) do
        local item = decode(EggRecords, raw)
        if type(item) == "table" then
            table.insert(eggs, {
                uid = uid,
                name = tostring(item.DisplayName or item.Name or item.AssetCategory or item.Category or "Unknown Egg"),
                favorite = item.IsFavorite == true or item.Favorite == true
            })
        end
    end

    table.sort(pets, function(a,b) return a.name:lower() < b.name:lower() end)
    table.sort(eggs, function(a,b) return a.name:lower() < b.name:lower() end)
    return true
end

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = "NhatKhanh_StealEgg"
gui.ResetOnSpawn = false
gui.Parent = guiParent

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(530, 410)
main.Position = UDim2.new(.5, -265, .5, -205)
main.BackgroundColor3 = Color3.fromRGB(32, 14, 27)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

local outline = Instance.new("UIStroke", main)
outline.Color = Color3.fromRGB(255,90,175)
outline.Thickness = 2

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-60,0,40)
title.Position = UDim2.fromOffset(15,5)
title.BackgroundTransparency = 1
title.Text = "🌸 NHATKHANH HUB • STEAL AN EGG"
title.TextColor3 = Color3.fromRGB(255,165,215)
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35,30)
close.Position = UDim2.new(1,-45,0,10)
close.BackgroundColor3 = Color3.fromRGB(185,55,115)
close.Text = "×"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 22
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,-30,0,24)
status.Position = UDim2.fromOffset(15,45)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(220,175,205)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.TextXAlignment = Enum.TextXAlignment.Left
status.Text = "Đang quét inventory..."
status.Parent = main

local pricing = Instance.new("Frame")
pricing.Size = UDim2.new(1,-30,1,-150)
pricing.Position = UDim2.fromOffset(15,70)
pricing.BackgroundColor3 = Color3.fromRGB(45,18,37)
pricing.BorderSizePixel = 0
pricing.Parent = main
Instance.new("UICorner", pricing).CornerRadius = UDim.new(0,12)

local priceTitle = Instance.new("TextLabel")
priceTitle.Size = UDim2.new(1,-20,0,45)
priceTitle.Position = UDim2.fromOffset(10,10)
priceTitle.BackgroundTransparency = 1
priceTitle.Text = "🔑 BẢNG GIÁ KEY"
priceTitle.TextColor3 = Color3.fromRGB(255,170,220)
priceTitle.Font = Enum.Font.GothamBold
priceTitle.TextSize = 20
priceTitle.Parent = pricing

local function priceRow(y, icon, name, price)
    local row = Instance.new("TextLabel")
    row.Size = UDim2.new(1,-30,0,58)
    row.Position = UDim2.new(0,15,0,y)
    row.BackgroundColor3 = Color3.fromRGB(64,25,53)
    row.BorderSizePixel = 0
    row.Text = icon.."  "..name.."    "..price
    row.TextColor3 = Color3.fromRGB(255,240,250)
    row.Font = Enum.Font.GothamBold
    row.TextSize = 16
    row.TextXAlignment = Enum.TextXAlignment.Center
    row.Parent = pricing
    Instance.new("UICorner",row).CornerRadius = UDim.new(0,10)
    return row
end

priceRow(65,"♾️","KEY VĨNH VIỄN","280.000đ")
priceRow(135,"📅","KEY THÁNG","130.000đ")
priceRow(205,"📆","KEY TUẦN","90.000đ")

local zalo = Instance.new("TextLabel")
zalo.Size = UDim2.new(1,-30,0,42)
zalo.Position = UDim2.new(0,15,0,275)
zalo.BackgroundTransparency = 1
zalo.Text = "📱 Zalo: 0986790434"
zalo.TextColor3 = Color3.fromRGB(255,175,220)
zalo.Font = Enum.Font.GothamBold
zalo.TextSize = 16
zalo.TextXAlignment = Enum.TextXAlignment.Center
zalo.Parent = pricing

local function makeButton(text, x, width)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(width,38)
    b.Position = UDim2.new(0,x,1,-50)
    b.BackgroundColor3 = Color3.fromRGB(205,65,135)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.Parent = main
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,9)
    return b
end

)

search:GetPropertyChangedSignal("Text"):Connect(render)

if scan() then
    render()
else
    status.Text = "Không tìm thấy Save data. Hãy bấm Refresh."
end

notify("NhatKhanh Hub đã mở.")

notify("NhatKhanh Hub đã mở.")
