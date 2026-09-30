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
main.Size = UDim2.fromOffset(530, 500)
main.Position = UDim2.new(.5, -265, .5, -250)
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

local search = Instance.new("TextBox")
search.Size = UDim2.new(1,-150,0,35)
search.Position = UDim2.fromOffset(15,75)
search.BackgroundColor3 = Color3.fromRGB(55,24,44)
search.PlaceholderText = "🔎 Tìm pet / egg..."
search.PlaceholderColor3 = Color3.fromRGB(165,115,145)
search.TextColor3 = Color3.new(1,1,1)
search.Text = ""
search.ClearTextOnFocus = false
search.Font = Enum.Font.Gotham
search.TextSize = 13
search.Parent = main
Instance.new("UICorner", search).CornerRadius = UDim.new(0,9)

local refresh = Instance.new("TextButton")
refresh.Size = UDim2.fromOffset(120,35)
refresh.Position = UDim2.new(1,-135,0,75)
refresh.BackgroundColor3 = Color3.fromRGB(220,70,145)
refresh.Text = "↻ Refresh"
refresh.TextColor3 = Color3.new(1,1,1)
refresh.Font = Enum.Font.GothamBold
refresh.TextSize = 13
refresh.Parent = main
Instance.new("UICorner", refresh).CornerRadius = UDim.new(0,9)

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1,-30,1,-225)
list.Position = UDim2.fromOffset(15,120)
list.BackgroundColor3 = Color3.fromRGB(24,11,20)
list.BorderSizePixel = 0
list.ScrollBarThickness = 5
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.Parent = main
Instance.new("UICorner", list).CornerRadius = UDim.new(0,10)

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0,4)

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

local unfav = makeButton("♡ Bỏ favorite",15,150)
local sellPets = makeButton("💰 Bán pets",180,150)
local sellEggs = makeButton("🥚 Bán eggs",345,160)

local function render()
    for _, c in ipairs(list:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end

    local q = search.Text:lower()
    local shown = 0

    local function add(kind,item)
        if q ~= "" and not item.name:lower():find(q,1,true) then return end
        shown += 1

        local row = Instance.new("TextLabel")
        row.Size = UDim2.new(1,-10,0,28)
        row.BackgroundColor3 = kind == "PET"
            and Color3.fromRGB(64,28,52)
            or Color3.fromRGB(45,28,58)
        row.BorderSizePixel = 0
        row.Text = string.format(
            "%s  %s  • UID: %s%s%s",
            kind == "PET" and "🐾" or "🥚",
            item.name,
            tostring(item.uid),
            item.favorite and "  ♥" or "",
            item.equipped and "  [EQUIPPED]" or ""
        )
        row.TextColor3 = item.favorite
            and Color3.fromRGB(255,175,220)
            or Color3.fromRGB(235,225,235)
        row.Font = Enum.Font.Gotham
        row.TextSize = 11
        row.TextXAlignment = Enum.TextXAlignment.Left
        row.Parent = list
        Instance.new("UICorner",row).CornerRadius = UDim.new(0,6)
    end

    for _, p in ipairs(pets) do add("PET",p) end
    for _, e in ipairs(eggs) do add("EGG",e) end

    status.Text = string.format(
        "🐾 %d pets  •  🥚 %d eggs  •  Hiển thị %d",
        #pets,#eggs,shown
    )
end

local busy = false

local function run(label, fn)
    if busy then return end
    busy = true
    status.Text = label

    task.spawn(function()
        local ok, result = pcall(fn)
        status.Text = ok and tostring(result or "Hoàn tất") or ("Lỗi: "..tostring(result))
        task.wait(.25)
        scan()
        render()
        busy = false
    end)
end

unfav.MouseButton1Click:Connect(function()
    run("Đang bỏ favorite...",function()
        local remote = getRemote("WriteFavourite")
        if not remote then error("Không tìm thấy WriteFavourite") end

        local count = 0
        for _, p in ipairs(pets) do
            if p.favorite then
                pcall(function() remote:FireServer(p.uid,false) end)
                count += 1
                task.wait(.08)
            end
        end
        return "Đã gửi bỏ favorite: "..count
    end)
end)

sellPets.MouseButton1Click:Connect(function()
    run("Đang bán pets...",function()
        local remote = getRemote("SellSelection")
        if not remote then error("Không tìm thấy SellSelection") end

        local ids = {}
        for _, p in ipairs(pets) do
            if not p.favorite and not p.equipped then
                table.insert(ids,p.uid)
            end
        end

        local total = 0
        for i=1,#ids,50 do
            local batch = {}
            for j=i,math.min(i+49,#ids) do
                table.insert(batch,ids[j])
            end
            remote:FireServer({Assets=batch,Eggs={}})
            total += #batch
            task.wait(.08)
        end

        return "Đã gửi bán pets: "..total
    end)
end)

sellEggs.MouseButton1Click:Connect(function()
    run("Đang bán eggs...",function()
        local remote = getRemote("SellSelection")
        if not remote then error("Không tìm thấy SellSelection") end

        local ids = {}
        for _, e in ipairs(eggs) do
            if not e.favorite then
                table.insert(ids,e.uid)
            end
        end

        local total = 0
        for i=1,#ids,50 do
            local batch = {}
            for j=i,math.min(i+49,#ids) do
                table.insert(batch,ids[j])
            end
            remote:FireServer({Assets={},Eggs=batch})
            total += #batch
            task.wait(.08)
        end

        return "Đã gửi bán eggs: "..total
    end)
end)

refresh.MouseButton1Click:Connect(function()
    if scan() then
        render()
    else
        status.Text = "Chưa lấy được Save data. Hãy đợi game load rồi Refresh."
    end
end)

search:GetPropertyChangedSignal("Text"):Connect(render)

if scan() then
    render()
else
    status.Text = "Không tìm thấy Save data. Hãy bấm Refresh."
end

notify("NhatKhanh Hub đã mở.")
