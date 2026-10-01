-- VIPQUAANH.lua
-- Auto Execute + Auto Re-Execute sau Teleport

local SOURCE_URL =
    "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/vipquaanh.lua"

-- ==========================================
-- AUTO GỌI LẠI FILE SAU KHI TELEPORT
-- ==========================================

local function queueReExecute()
    local code = [[
        task.wait(2)

        pcall(function()
            local url =
                "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/vipquaanh.lua"

            local source = game:HttpGet(url)
            local func = loadstring(source)

            if func then
                func()
            end
        end)
    ]]

    if type(queue_on_teleport) == "function" then
        pcall(function()
            queue_on_teleport(code)
        end)
        return
    end

    if type(queueonteleport) == "function" then
        pcall(function()
            queueonteleport(code)
        end)
        return
    end

    if type(syn) == "table"
        and type(syn.queue_on_teleport) == "function" then

        pcall(function()
            syn.queue_on_teleport(code)
        end)

        return
    end
end

queueReExecute()


-- ==========================================
-- CODE VIPQUAANH CỦA BẠN
-- ==========================================

print("VIPQUAANH đã Execute!")


-- ==========================================
-- NẾU CÓ TELEPORT TRONG SCRIPT
-- queueReExecute() TRƯỚC KHI TELEPORT
-- ==========================================

-- Ví dụ:
-- queueReExecute()
-- game:GetService("TeleportService"):Teleport(...)
