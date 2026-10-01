--// Nhat Khan Hub
--// Volt-compatible
--// Auto re-execute after teleport
--// Draggable GUI
--// Mục tiêu: SERVER CÔNG KHAI có ĐÚNG 1 NGƯỜI CHƠI

local Players = game:GetService(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("UGxheWVycw==")))
local TeleportService = game:GetService(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGVsZXBvcnRTZXJ2aWNl")))
local HttpService = game:GetService(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("SHR0cFNlcnZpY2U=")))
local UserInputService = game:GetService(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VXNlcklucHV0U2VydmljZQ==")))

local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
    warn(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gS2jDtG5nIHTDrG0gdGjhuqV5IExvY2FsUGxheWVy")))
    return
end

local PlayerGui = LocalPlayer:WaitForChild(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("UGxheWVyR3Vp")))

--==================================================
-- SOURCE URL
--==================================================

local SOURCE_URL =
    ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2toYW5oZGVwNDEtdGVjaC8tTmhhdEtoYW5oLUh1Yi9yZWZzL2hlYWRzL21haW4vU2V2ZXIlMjBWaXAlMjAxJTIwTmd1b2klMjBIdWIubHVh"))

--==================================================
-- AUTO-HOP STATE
--==================================================

if getgenv then
    getgenv().NhatKhanAutoHop =
        getgenv().NhatKhanAutoHop or false
end

local function getAutoState()

    if getgenv then
        return getgenv().NhatKhanAutoHop == true
    end

    return false
end

local function setAutoState(value)

    if getgenv then
        getgenv().NhatKhanAutoHop = value == true
    end

end

--==================================================
-- TELEPORT QUEUE
--==================================================

local function queueForTeleport()

    local queuedCode = [[
        task.wait(2)

        local source = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2toYW5oZGVwNDEtdGVjaC8tTmhhdEtoYW5oLUh1Yi9yZWZzL2hlYWRzL21haW4vU2V2ZXIlMjBWaXAlMjAxJTIwTmd1b2klMjBIdWIubHVh"))

        local success, result = pcall(function()
            local response = game:HttpGet(source)
            local fn = loadstring(response)

            if not fn then
                error(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("S2jDtG5nIHRo4buDIGxvYWQgc291cmNlLg==")))
            end

            fn()
        end)

        if not success then
            warn(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gQXV0byBleGVjdXRlIHRo4bqldCBi4bqhaTo=")), result)
        end
    ]]

    local success = false
    local method = nil

    -- queue_on_teleport
    if type(queue_on_teleport) == ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("ZnVuY3Rpb24=")) then

        local ok = pcall(function()
            queue_on_teleport(queuedCode)
        end)

        if ok then
            success = true
            method = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("cXVldWVfb25fdGVsZXBvcnQ="))
        end
    end

    -- queueonteleport
    if not success and type(queueonteleport) == ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("ZnVuY3Rpb24=")) then

        local ok = pcall(function()
            queueonteleport(queuedCode)
        end)

        if ok then
            success = true
            method = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("cXVldWVvbnRlbGVwb3J0"))
        end
    end

    -- syn.queue_on_teleport
    if not success
        and type(syn) == ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("dGFibGU="))
        and type(syn.queue_on_teleport) == ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("ZnVuY3Rpb24=")) then

        local ok = pcall(function()
            syn.queue_on_teleport(queuedCode)
        end)

        if ok then
            success = true
            method = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("c3luLnF1ZXVlX29uX3RlbGVwb3J0"))
        end
    end

    if success then
        print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gxJDDoyB44bq/cCBow6BuZyBhdXRvIGV4ZWN1dGU6")), method)
        return true
    end

    warn(
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gRXhlY3V0b3Iga2jDtG5nIGjhu5cgdHLhu6MgcXVldWVfb25fdGVsZXBvcnQu"))
    )

    return false
end

--==================================================
-- XÓA GUI CŨ
--==================================================

local old = PlayerGui:FindFirstChild(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmhhdEtoYW5o")))

if old then
    old:Destroy()
end

--==================================================
-- GUI
--==================================================

local ScreenGui = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("U2NyZWVuR3Vp")))
ScreenGui.Name = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmhhdEtoYW5o"))
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Main = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("RnJhbWU=")))
Main.Size = UDim2.fromOffset(580, 440)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(190, 45, 150)
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = ScreenGui

--==================================================
-- 1/3 SIZE
--==================================================

local UIScale = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlTY2FsZQ==")))
UIScale.Scale = 0.34
UIScale.Parent = Main

local MainCorner = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlDb3JuZXI=")))
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlTdHJva2U=")))
MainStroke.Color = Color3.fromRGB(245, 100, 210)
MainStroke.Thickness = 3
MainStroke.Parent = Main

--==================================================
-- TITLE
--==================================================

local Title = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dExhYmVs")))
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(20, 15)
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmhhdCBLaGFuIEh1Yg=="))
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 30
Title.Active = true
Title.Parent = Main

local Subtitle = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dExhYmVs")))
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.fromOffset(20, 65)
Subtitle.Size = UDim2.new(1, -40, 0, 30)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VHLDrG5oIGNodXnhu4NuIG3DoXkgY2jhu6cgMSBuZ8aw4budaSBjaMahaQ=="))
Subtitle.TextColor3 = Color3.fromRGB(255, 220, 245)
Subtitle.TextSize = 16
Subtitle.Active = true
Subtitle.Parent = Main

--==================================================
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragStart = nil
local startPosition = nil

local function updateDrag(input)

    if not dragStart or not startPosition then
        return
    end

    local delta =
        input.Position - dragStart

    Main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,

        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

local function startDrag(input)

    dragging = true
    dragStart = input.Position
    startPosition = Main.Position

    input.Changed:Connect(function()

        if input.UserInputState ==
            Enum.UserInputState.End then

            dragging = false
        end

    end)
end

Title.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        startDrag(input)
    end

end)

Subtitle.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        startDrag(input)
    end

end)

UserInputService.InputChanged:Connect(function(input)

    if not dragging then
        return
    end

    if input.UserInputType ==
        Enum.UserInputType.MouseMovement
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        updateDrag(input)
    end

end)

--==================================================
-- CURRENT SERVER
--==================================================

local CurrentLabel = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dExhYmVs")))
CurrentLabel.BackgroundColor3 =
    Color3.fromRGB(210, 55, 170)

CurrentLabel.Position =
    UDim2.fromOffset(25, 110)

CurrentLabel.Size =
    UDim2.new(1, -50, 0, 50)

CurrentLabel.Font =
    Enum.Font.GothamBold

CurrentLabel.TextColor3 =
    Color3.fromRGB(255, 255, 255)

CurrentLabel.TextSize = 18
CurrentLabel.Parent = Main

local CurrentCorner = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlDb3JuZXI=")))
CurrentCorner.CornerRadius =
    UDim.new(0, 10)

CurrentCorner.Parent = CurrentLabel

--==================================================
-- STATUS
--==================================================

local Status = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dExhYmVs")))

Status.BackgroundColor3 =
    Color3.fromRGB(180, 40, 140)

Status.Position =
    UDim2.fromOffset(25, 175)

Status.Size =
    UDim2.new(1, -50, 0, 85)

Status.Font =
    Enum.Font.Gotham

Status.Text =
    ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("U+G6tE4gU8OATkdcbk3hu6VjIHRpw6p1OiDEkcO6bmcgMSBuZ8aw4budaSBjaMahaQ=="))

Status.TextColor3 =
    Color3.fromRGB(255, 255, 255)

Status.TextSize = 17
Status.TextWrapped = true
Status.Parent = Main

local StatusCorner = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlDb3JuZXI=")))
StatusCorner.CornerRadius =
    UDim.new(0, 10)

StatusCorner.Parent = Status

--==================================================
-- HOP BUTTON
--==================================================

local HopButton = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dEJ1dHRvbg==")))

HopButton.BackgroundColor3 =
    Color3.fromRGB(205, 55, 165)

HopButton.Position =
    UDim2.fromOffset(25, 280)

HopButton.Size =
    UDim2.new(1, -50, 0, 55)

HopButton.BorderSizePixel = 0

HopButton.Font =
    Enum.Font.GothamBold

HopButton.Text =
    ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("Q0hVWeG7gk4gTkdBWQ=="))

HopButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

HopButton.TextSize = 20
HopButton.Parent = Main

local HopCorner = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlDb3JuZXI=")))
HopCorner.CornerRadius =
    UDim.new(0, 10)

HopCorner.Parent = HopButton

--==================================================
-- AUTO BUTTON
--==================================================

local AutoButton = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VGV4dEJ1dHRvbg==")))

AutoButton.BackgroundColor3 =
    Color3.fromRGB(180, 40, 140)

AutoButton.Position =
    UDim2.fromOffset(25, 350)

AutoButton.Size =
    UDim2.new(1, -50, 0, 55)

AutoButton.BorderSizePixel = 0

AutoButton.Font =
    Enum.Font.GothamBold

AutoButton.Text =
    ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG7sCDEkOG7mE5HOiBU4bquVA=="))

AutoButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

AutoButton.TextSize = 20
AutoButton.Parent = Main

local AutoCorner = Instance.new(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VUlDb3JuZXI=")))
AutoCorner.CornerRadius =
    UDim.new(0, 10)

AutoCorner.Parent = AutoButton

--==================================================
-- STATE
--==================================================

local hopping = false
local autoHop = getAutoState()

--==================================================
-- STATUS FUNCTIONS
--==================================================

local function setStatus(text)
    Status.Text = text
end

local function updatePlayerCount()

    CurrentLabel.Text =
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TcOheSBjaOG7pyBoaeG7h24gdOG6oWk6IA=="))
        .. tostring(#Players:GetPlayers())
        .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IG5nxrDhu51pIGNoxqFp"))

end

updatePlayerCount()

Players.PlayerAdded:Connect(
    updatePlayerCount
)

Players.PlayerRemoving:Connect(
    updatePlayerCount
)

--==================================================
-- INITIAL AUTO STATE
--==================================================

if autoHop then

    AutoButton.Text =
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG7sCDEkOG7mE5HOiBC4bqsVA=="))

    AutoButton.BackgroundColor3 =
        Color3.fromRGB(235, 75, 195)

    setStatus(
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG7sCDEkOG7mE5HIMSQw4MgxJDGr+G7okMgS0jDlEkgUEjhu6RDXG4=")) ..
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBhbmcgdMOsbSBtw6F5IGNo4bunIGPDsyDEkcO6bmcgMSBuZ8aw4budaS4uLg=="))
    )

end

--==================================================
-- TELEPORT ERROR
--==================================================

local teleportFailed = false
local teleportFailureMessage = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)(""))

pcall(function()

    TeleportService.TeleportInitFailed:Connect(
        function(
            player,
            teleportResult,
            errorMessage
        )

            if player ~= LocalPlayer then
                return
            end

            teleportFailed = true

            teleportFailureMessage =
                tostring(
                    errorMessage
                    or teleportResult
                )

            warn(
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gTOG7l2kgY2h1eeG7g24gbcOheSBjaOG7pzo=")),
                teleportFailureMessage
            )
        end
    )

end)

--==================================================
-- SERVER API
--==================================================

local function getServerPage(cursor)

    local url =
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("aHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw=="))
        .. tostring(game.PlaceId)
        .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("L3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1Bc2MmbGltaXQ9MTAw"))

    if cursor and cursor ~= ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("")) then

        url =
            url
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("JmN1cnNvcj0="))
            .. HttpService:UrlEncode(cursor)

    end

    local success, response =
        pcall(function()

            return game:HttpGet(url)

        end)

    if not success then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TOG7lkkgS+G6vlQgTuG7kEk6XG4="))
            .. tostring(response)

    end

    if type(response) ~= ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("c3RyaW5n"))
        or #response == 0 then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("QVBJIGtow7RuZyB0cuG6oyB24buBIGThu68gbGnhu4d1Lg=="))

    end

    local decodeSuccess, data =
        pcall(function()

            return HttpService:JSONDecode(
                response
            )

        end)

    if not decodeSuccess then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TOG7lkkgxJDhu4xDIEThu64gTEnhu4ZVOlxu"))
            .. tostring(data)

    end

    if type(data) ~= ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("dGFibGU=")) then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("ROG7ryBsaeG7h3UgbcOheSBjaOG7pyBraMO0bmcgaOG7o3AgbOG7hy4="))

    end

    if type(data.data) ~= ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("dGFibGU=")) then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("S2jDtG5nIHTDrG0gdGjhuqV5IGRhbmggc8OhY2ggbcOheSBjaOG7py4="))

    end

    return data
end

--==================================================
-- SHUFFLE
--==================================================

local function shuffle(list)

    for i = #list, 2, -1 do

        local j =
            math.random(1, i)

        list[i], list[j] =
            list[j], list[i]

    end

    return list
end

--==================================================
-- FIND SERVERS
--==================================================

local function findServers()

    local currentJobId =
        tostring(game.JobId)

    local candidates = {}
    local cursor = nil

    for page = 1, 10 do

        setStatus(
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBBTkcgVMOMTSBNw4FZIENI4bumLi4uXG4="))
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VHJhbmcg"))
            .. page
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IC8gMTBcbg=="))
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBhbmcgdMOsbSBtw6F5IGNo4bunIGPDsyDEkcO6bmcgMSBuZ8aw4budaQ=="))
        )

        local data, errorMessage =
            getServerPage(cursor)

        if not data then
            return nil, errorMessage
        end

        for _, server in
            ipairs(data.data) do

            local id =
                tostring(server.id or ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("")))

            local playing =
                tonumber(
                    server.playing or 0
                )

            local maxPlayers =
                tonumber(
                    server.maxPlayers or 0
                )

            if id ~= ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)(""))
                and id ~= currentJobId
                and playing == 1
                and maxPlayers > playing then

                local duplicate = false

                for _, existing in
                    ipairs(candidates) do

                    if existing.id == id then

                        duplicate = true
                        break

                    end
                end

                if not duplicate then

                    table.insert(
                        candidates,
                        {
                            id = id,
                            playing = playing,
                            maxPlayers = maxPlayers
                        }
                    )

                end
            end
        end

        if #candidates >= 20 then
            break
        end

        cursor =
            data.nextPageCursor

        if not cursor
            or cursor == ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("")) then

            break
        end

        task.wait(0.15)
    end

    if #candidates == 0 then

        return nil,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("S2jDtG5nIHTDrG0gdGjhuqV5IG3DoXkgY2jhu6cgY8O0bmcga2hhaSBjw7MgxJHDum5nIDEgbmfGsOG7nWku"))

    end

    shuffle(candidates)

    return candidates
end

--==================================================
-- TRY TELEPORT
--==================================================

local function tryTeleport(server)

    teleportFailed = false
    teleportFailureMessage = ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)(""))

    setStatus(
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBBTkcgQ0hVWeG7gk4gTcOBWSBDSOG7pi4uLlxu"))
        .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmfGsOG7nWkgY2jGoWk6IA=="))
        .. tostring(server.playing)
        .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IC8g"))
        .. tostring(server.maxPlayers)
    )

    -- Queue BEFORE teleport
    local queued =
        queueForTeleport()

    if not queued then

        warn(
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gS2jDtG5nIHRo4buDIHF1ZXVlIHNjcmlwdC4="))
        )

    end

    local success, errorMessage =
        pcall(function()

            TeleportService:
                TeleportToPlaceInstance(
                    game.PlaceId,
                    server.id,
                    LocalPlayer
                )

        end)

    if not success then

        return false,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("Q0hVWeG7gk4gTcOBWSBDSOG7piBUSOG6pFQgQuG6oEk6XG4="))
            .. tostring(errorMessage)

    end

    for i = 1, 50 do

        if teleportFailed then

            return false,
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("Uk9CTE9YIFThu6ogQ0jhu5BJIENIVVnhu4JOOlxu"))
                .. tostring(
                    teleportFailureMessage
                )

        end

        task.wait(0.1)
    end

    if game.JobId ~= server.id then

        return false,
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("S2jDtG5nIHRo4buDIGhvw6BuIHThuqV0IGNodXnhu4NuIG3DoXkgY2jhu6cu"))

    end

    return true
end

--==================================================
-- HOP
--==================================================

local function hop()

    if hopping then
        return
    end

    hopping = true

    HopButton.Text =
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBBTkcgVMOMTS4uLg=="))

    HopButton.Active = false

    local servers, errorMessage =
        findServers()

    if not servers then

        setStatus(
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("S0jDlE5HIFTDjE0gVEjhuqRZIE3DgVkgQ0jhu6Zcblxu"))
            .. tostring(errorMessage)
        )

        HopButton.Text =
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("Q0hVWeG7gk4gTkdBWQ=="))

        HopButton.Active = true
        hopping = false

        return
    end

    local attempts =
        math.min(#servers, 8)

    for attempt = 1, attempts do

        local server =
            servers[attempt]

        setStatus(
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBBTkcgVEjhu6wgTcOBWSBDSOG7piA="))
            .. attempt
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IC8g"))
            .. attempts
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("XG4="))
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmfGsOG7nWkgY2jGoWk6IA=="))
            .. server.playing
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IC8g"))
            .. server.maxPlayers
        )

        local success, reason =
            tryTeleport(server)

        if success then

            setStatus(
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBBTkcgQ0hVWeG7gk4uLi5cblxu"))
                .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBhbmcgdsOgbyBtw6F5IGNo4bunIDEgbmfGsOG7nWku"))
            )

            return
        end

        warn(
            ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("W05oYXQgS2hhbl0gTOG6p24gdGjhu60g"))
            .. tostring(attempt)
            .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("IHRo4bqldCBi4bqhaTo="))
        )

        warn(tostring(reason))

        task.wait(0.5)
    end

    setStatus(
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG6pFQgQ+G6oiBM4bqmTiBUSOG7rCDEkOG7gFUgVEjhuqRUIELhuqBJXG5cbg=="))
        .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("SMOjeSBi4bqlbSBDSFVZ4buCTiBOR0FZIMSR4buDIHRo4butIGzhuqFpLg=="))
    )

    HopButton.Text =
        ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("Q0hVWeG7gk4gTkdBWQ=="))

    HopButton.Active = true
    hopping = false
end

--==================================================
-- HOP BUTTON
--==================================================

HopButton.MouseButton1Click:Connect(
    function()

        if not hopping then
            task.spawn(hop)
        end

    end
)

--==================================================
-- AUTO HOP
--==================================================

local function startAutoHop()

    if not autoHop then
        return
    end

    task.spawn(function()

        -- Small delay after GUI creation
        task.wait(1)

        while autoHop do

            if not hopping then

                task.spawn(hop)

            end

            for i = 1, 15 do

                if not autoHop then
                    break
                end

                task.wait(1)

            end
        end
    end)
end

AutoButton.MouseButton1Click:Connect(
    function()

        autoHop = not autoHop

        setAutoState(autoHop)

        if autoHop then

            AutoButton.Text =
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG7sCDEkOG7mE5HOiBC4bqsVA=="))

            AutoButton.BackgroundColor3 =
                Color3.fromRGB(
                    235,
                    75,
                    195
                )

            setStatus(
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJDDgyBC4bqsVCBU4buwIMSQ4buYTkdcbg=="))
                .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJBhbmcgdMOsbSBtw6F5IGNo4bunIGPDsyDEkcO6bmcgMSBuZ8aw4budaS4uLg=="))
            )

            startAutoHop()

        else

            AutoButton.Text =
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("VOG7sCDEkOG7mE5HOiBU4bquVA=="))

            AutoButton.BackgroundColor3 =
                Color3.fromRGB(
                    180,
                    40,
                    140
                )

            setStatus(
                ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("xJDDgyBU4bquVCBU4buwIMSQ4buYTkdcblxu"))
                .. ((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TeG7pWMgdGnDqnU6IMSRw7puZyAxIG5nxrDhu51pIGNoxqFp"))
            )

        end
    end
)

--==================================================
-- START RESTORED AUTO HOP
--==================================================

if autoHop then
    startAutoHop()
end

--==================================================
-- READY
--==================================================

print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09")))
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TmhhdCBLaGFuIEh1YiDEkcOjIGto4bufaSDEkeG7mW5n")))
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("R1VJIGPDsyB0aOG7gyBrw6lvIGLhurFuZyB0acOqdSDEkeG7gQ==")))
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("QXV0by1Ib3A6")), autoHop)
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("QXV0by1leGVjdXRlIHNhdSB0ZWxlcG9ydDogT04=")))
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("TeG7pWMgdGnDqnU6IMSRw7puZyAxIG5nxrDhu51pIGNoxqFp")))
print(((function(x)local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local o="";x=x:gsub("[^"..b.."=]","");local p=0;local a=0;local c=0;local n=0;for i=1,#x do local q=b:find(x:sub(i,i),1,true);if q then q=q-1;if p==0 then a=q;p=1 elseif p==1 then c=q;p=2 elseif p==2 then n=q;p=3;o=o..string.char(a*4+math.floor(c/16));local r=(c%16)*16+math.floor(n/4);if x:sub(i+1,i+1)~="=" then o=o..string.char(r) end;local z=(n%4)*64;local q2=x:sub(i+2,i+2);if q2~="=" and q2~="" then local qv=b:find(q2,1,true)-1;o=o..string.char(z+qv) end;p=0 end end end;return o end)("PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09")))