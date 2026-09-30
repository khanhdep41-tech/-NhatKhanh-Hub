-- ==========================================
-- STEAL AN EGG - 3 CHỨC NĂNG
-- ==========================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Tìm PetSatchel
local PetSatchel

pcall(function()
    PetSatchel =
        ReplicatedStorage
        :WaitForChild("Shared")
        :WaitForChild("Remotes")
        :WaitForChild("PetSatchel")
end)

if not PetSatchel then
    warn("Không tìm thấy PetSatchel")
    return
end

-- ==========================================
-- 1. BỎ YÊU THÍCH TẤT CẢ PET
-- ==========================================

local function UnfavoriteAllPets(petList)
    if not petList then
        return
    end

    for _, pet in pairs(petList) do
        local uid = pet.UID or pet.uid or pet.Id or pet.id

        if uid then
            pcall(function()
                PetSatchel.WriteFavourite:FireServer(
                    uid,
                    false
                )
            end)

            task.wait(0.05)
        end
    end
end


-- ==========================================
-- 2. BÁN PET
-- ==========================================

local function SellPets(petList)
    if not petList then
        return
    end

    local selected = {}

    for _, pet in pairs(petList) do
        local uid = pet.UID or pet.uid or pet.Id or pet.id

        if uid then
            selected[uid] = true
        end
    end

    if next(selected) then
        pcall(function()
            PetSatchel.SellSelection:FireServer(selected)
        end)
    end
end


-- ==========================================
-- 3. BÁN PET TẤT CẢ
-- ==========================================

local function SellAllPets()
    pcall(function()
        PetSatchel.SellEveryPet:FireServer()
    end)
end


-- ==========================================
-- DÙNG:
-- ==========================================

-- UnfavoriteAllPets(PET_LIST)

-- SellPets(PET_LIST)

-- SellAllPets()
