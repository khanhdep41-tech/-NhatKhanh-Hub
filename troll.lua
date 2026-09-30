-- NhatKhanh - Steal An Egg
-- 3 chức năng:
-- 1. Bỏ yêu thích tất cả pet
-- 2. Bán tất cả pet
-- 3. Bán tất cả egg

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- ==============================
-- TÌM REMOTE
-- ==============================

local Remotes

pcall(function()
    local shared = ReplicatedStorage:FindFirstChild("Shared")
    local remotesFolder = shared and shared:FindFirstChild("Remotes")

    if remotesFolder then
        local ok, result = pcall(require, remotesFolder)
        if ok and result then
            Remotes = result
        end
    end
end)

local PetSatchel = Remotes and Remotes.PetSatchel

-- Fallback Remote mới
local SellSelection

pcall(function()
    local packages = ReplicatedStorage:FindFirstChild("Packages")
    local networking = packages and packages:FindFirstChild("Networking")

    if networking then
        SellSelection =
            networking:FindFirstChild("RE/PetSatchel/SellSelection")
    end
end)

-- ==============================
-- LẤY SAVE
-- ==============================

local function GetSave()
    local save

    pcall(function()
        local shared = ReplicatedStorage:FindFirstChild("Shared")

        if shared then
            local modules = shared:FindFirstChild("Modules")

            if modules then
                local saveModule = modules:FindFirstChild("Save")

                if saveModule then
                    local ok, result = pcall(require, saveModule)

                    if ok and type(result) == "table" then
                        save = result
                    end
                end
            end
        end
    end)

    return save
end

-- ==============================
-- TÌM GAME SAVE QUA MODULE
-- ==============================

local function FindSaveModule()
    local result

    pcall(function()
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("ModuleScript") and obj.Name == "Save" then
                local ok, data = pcall(require, obj)

                if ok and type(data) == "table" then
                    if data.Get and type(data.Get) == "function" then
                        result = data
                        break
                    end
                end
            end
        end
    end)

    return result
end

local SaveModule = FindSaveModule()

local function GetPlayerSave()
    local save

    if SaveModule then
        pcall(function()
            save = SaveModule.Get()
        end)
    end

    return save
end

-- ==============================
-- BỎ YÊU THÍCH TẤT CẢ PET
-- ==============================

local function UnfavoriteAllPets()
    local save = GetPlayerSave()

    if not save then
        warn("Không lấy được dữ liệu inventory.")
        return
    end

    local inventory = save.Inventory or {}
    local count = 0

    for uid, item in pairs(inventory) do
        local favorite = false

        if type(item) == "table" then
            favorite =
                item.IsFavorite == true
                or item.Favorite == true
        end

        if favorite then
            pcall(function()
                if PetSatchel and PetSatchel.WriteFavourite then
                    PetSatchel.WriteFavourite:FireServer(
                        uid,
                        false
                    )

                    count += 1
                end
            end)

            task.wait(0.08)
        end
    end

    print("Đã bỏ yêu thích:", count, "pet")
end

-- ==============================
-- BÁN TẤT CẢ PET
-- ==============================

local function SellAllPets()
    local save = GetPlayerSave()

    if not save then
        warn("Không lấy được dữ liệu inventory.")
        return
    end

    local inventory = save.Inventory or {}
    local equipped = {}

    for _, uid in ipairs(
        save.EquippedAssets
        or save.EquippedPets
        or {}
    ) do
        equipped[uid] = true
    end

    local pets = {}

    for uid, item in pairs(inventory) do
        -- Không bán pet đang equipped
        if not equipped[uid] then
            table.insert(pets, uid)
        end
    end

    if #pets == 0 then
        warn("Không có pet để bán.")
        return
    end

    local total = 0

    -- Game nguồn dùng batch 50
    for i = 1, #pets, 50 do

        local batch = {}

        for j = i, math.min(i + 49, #pets) do
            table.insert(batch, pets[j])
        end

        local sent = false

        pcall(function()
            if PetSatchel and PetSatchel.SellSelection then

                PetSatchel.SellSelection:FireServer({
                    Assets = batch,
                    Eggs = {}
                })

                sent = true
            end
        end)

        if not sent and SellSelection then
            pcall(function()

                SellSelection:FireServer({
                    Assets = batch,
                    Eggs = {}
                })

                sent = true
            end)
        end

        if sent then
            total += #batch
        end

        task.wait(0.2)
    end

    print("Đã gửi yêu cầu bán:", total, "pet")
end

-- ==============================
-- BÁN TẤT CẢ EGG
-- ==============================

local function SellAllEggs()
    local save = GetPlayerSave()

    if not save then
        warn("Không lấy được dữ liệu egg.")
        return
    end

    local eggInventory = save.EggInventory or {}
    local eggs = {}

    for uid, item in pairs(eggInventory) do
        table.insert(eggs, uid)
    end

    if #eggs == 0 then
        warn("Không có egg để bán.")
        return
    end

    local total = 0

    for i = 1, #eggs, 50 do

        local batch = {}

        for j = i, math.min(i + 49, #eggs) do
            table.insert(batch, eggs[j])
        end

        local sent = false

        pcall(function()
            if PetSatchel and PetSatchel.SellSelection then

                PetSatchel.SellSelection:FireServer({
                    Assets = {},
                    Eggs = batch
                })

                sent = true
            end
        end)

        if not sent and SellSelection then
            pcall(function()

                SellSelection:FireServer({
                    Assets = {},
                    Eggs = batch
                })

                sent = true
            end)
        end

        if sent then
            total += #batch
        end

        task.wait(0.2)
    end

    print("Đã gửi yêu cầu bán:", total, "egg")
end

-- ==============================
-- TẠO GIAO DIỆN
-- ==============================

local gui = Instance.new("ScreenGui")
gui.Name = "NhatKhanh_StealAnEgg"
gui.ResetOnSpawn = false

pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

if not gui.Parent then
    gui.Parent = player:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 230)
frame.Position = UDim2.new(0.5, -150, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(35, 15, 28)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 105, 180)
stroke.Thickness = 2
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "💗 NhatKhanh - Steal An Egg"
title.TextColor3 = Color3.fromRGB(255, 150, 210)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function Button(text, y, callback)

    local button = Instance.new("TextButton")

    button.Size = UDim2.new(1, -30, 0, 45)
    button.Position = UDim2.new(0, 15, 0, y)

    button.BackgroundColor3 =
        Color3.fromRGB(220, 60, 145)

    button.TextColor3 =
        Color3.fromRGB(255, 255, 255)

    button.Text = text
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.BorderSizePixel = 0

    button.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    button.MouseButton1Click:Connect(function()
        task.spawn(callback)
    end)

    return button
end

Button(
    "💗 Bỏ yêu thích tất cả Pet",
    50,
    UnfavoriteAllPets
)

Button(
    "💰 Bán tất cả Pet",
    100,
    SellAllPets
)

Button(
    "🥚 Bán tất cả Egg",
    150,
    SellAllEggs
)

print("NhatKhanh Steal An Egg đã khởi động.")
