-- NhatKhanh Hub - Key + HWID gate
local NK_API = "https://nhatkhanh-key-api.onrender.com"
local NK_KEY_FILE = "NhatKhanh_Key.txt"
local function nk_request(o) local f=request or http_request or (syn and syn.request); if not f then return nil,"request_not_supported" end; local ok,r=pcall(f,o); if not ok then return nil,tostring(r) end; return r end
local function nk_hwid() local f=gethwid or get_hwid; if f then local ok,v=pcall(f); if ok and v and tostring(v)~="" then return tostring(v) end end; if syn and syn.gethwid then local ok,v=pcall(syn.gethwid); if ok and v and tostring(v)~="" then return tostring(v) end end; return nil end
local function nk_read() if isfile and readfile then local ok,e=pcall(isfile,NK_KEY_FILE); if ok and e then local ok2,v=pcall(readfile,NK_KEY_FILE); if ok2 and v then return tostring(v):match("^%s*(.-)%s*$") end end end end
local function nk_save(k) if writefile then pcall(writefile,NK_KEY_FILE,k) end end
local function nk_del() if delfile and isfile then local ok,e=pcall(isfile,NK_KEY_FILE); if ok and e then pcall(delfile,NK_KEY_FILE) end end end
local function nk_verify(k,h)
 local HttpService=game:GetService("HttpService")
 local res,err=nk_request({Url=NK_API.."/api/verify-public",Method="POST",Headers={["Content-Type"]="application/json"},Body=HttpService:JSONEncode({key=k,hwid=h})})
 if not res then return false,err or "request_failed" end
 local raw=res.Body or res.body or ""
 local ok,d=pcall(function() return HttpService:JSONDecode(raw) end)
 if not ok or type(d)~="table" then return false,"bad_response" end
 return d.valid==true,d
end
local function nk_gate()
 local Players=game:GetService("Players"); local plr=Players.LocalPlayer; local hwid=nk_hwid()
 if not hwid then warn("[NhatKhanh] Executor does not expose HWID."); return false end
 local saved=nk_read()
 if saved then local ok,d=nk_verify(saved,hwid); if ok then getgenv().NhatKhanhAuthorized=true; getgenv().NhatKhanhKey=saved; getgenv().NhatKhanhExpires=d.expires; return true end; nk_del() end
 local gui=Instance.new("ScreenGui"); gui.Name="NhatKhanhKeyGate"; gui.ResetOnSpawn=false; pcall(function() gui.Parent=game:GetService("CoreGui") end); if not gui.Parent then gui.Parent=plr:WaitForChild("PlayerGui") end
 local fr=Instance.new("Frame"); fr.Size=UDim2.fromOffset(360,190); fr.Position=UDim2.new(.5,-180,.5,-95); fr.BackgroundColor3=Color3.fromRGB(25,25,25); fr.BorderSizePixel=0; fr.Parent=gui; Instance.new("UICorner",fr).CornerRadius=UDim.new(0,12)
 local title=Instance.new("TextLabel"); title.Size=UDim2.new(1,-30,0,35); title.Position=UDim2.fromOffset(15,10); title.BackgroundTransparency=1; title.Text="NhatKhanh Hub • Enter Key"; title.TextColor3=Color3.new(1,1,1); title.TextSize=20; title.Font=Enum.Font.GothamBold; title.Parent=fr
 local box=Instance.new("TextBox"); box.Size=UDim2.new(1,-30,0,42); box.Position=UDim2.fromOffset(15,55); box.PlaceholderText="NKH-XXXXX-XXXXX-XXXXX"; box.ClearTextOnFocus=false; box.TextSize=16; box.TextColor3=Color3.new(1,1,1); box.BackgroundColor3=Color3.fromRGB(40,40,40); box.Parent=fr; Instance.new("UICorner",box).CornerRadius=UDim.new(0,8)
 local btn=Instance.new("TextButton"); btn.Size=UDim2.new(1,-30,0,40); btn.Position=UDim2.fromOffset(15,108); btn.Text="VERIFY KEY"; btn.TextSize=16; btn.TextColor3=Color3.new(1,1,1); btn.BackgroundColor3=Color3.fromRGB(75,75,75); btn.Parent=fr; Instance.new("UICorner",btn).CornerRadius=UDim.new(0,8)
 local st=Instance.new("TextLabel"); st.Size=UDim2.new(1,-30,0,25); st.Position=UDim2.fromOffset(15,153); st.BackgroundTransparency=1; st.Text=""; st.TextColor3=Color3.new(1,1,1); st.TextSize=13; st.Parent=fr
 local done=false; btn.MouseButton1Click:Connect(function() if done then return end; local k=tostring(box.Text or ""):match("^%s*(.-)%s*$"); if k=="" then st.Text="Enter your Key."; return end; local h=nk_hwid(); if not h then st.Text="HWID unsupported."; return end; btn.Text="CHECKING..."; local ok,d=nk_verify(k,h); if ok then nk_save(k); getgenv().NhatKhanhAuthorized=true; getgenv().NhatKhanhKey=k; getgenv().NhatKhanhExpires=d.expires; st.Text="Key valid"; done=true; task.wait(.5); gui:Destroy() else nk_del(); btn.Text="VERIFY KEY"; st.Text="Invalid: "..tostring(d.error or "unknown") end end)
 while gui.Parent do task.wait(.2) end
 return getgenv().NhatKhanhAuthorized==true
end
if not nk_gate() then error("NhatKhanh Hub: Key verification failed.") end

--// Nhat Khan Hub
--// Volt-compatible
--// Auto re-execute after teleport
--// Draggable GUI
--// Mục tiêu: SERVER CÔNG KHAI có ĐÚNG 1 NGƯỜI CHƠI

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
    warn("[Nhat Khan] Không tìm thấy LocalPlayer")
    return
end

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- SOURCE URL
--==================================================

local SOURCE_URL =
    "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/NhatKhanh_Hub_Key.lua"

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

        local source = "https://raw.githubusercontent.com/khanhdep41-tech/-NhatKhanh-Hub/refs/heads/main/NhatKhanh_Hub_Key.lua"

        local success, result = pcall(function()
            local response = game:HttpGet(source)
            local fn = loadstring(response)

            if not fn then
                error("Không thể load source.")
            end

            fn()
        end)

        if not success then
            warn("[Nhat Khan] Auto execute thất bại:", result)
        end
    ]]

    local success = false
    local method = nil

    -- queue_on_teleport
    if type(queue_on_teleport) == "function" then

        local ok = pcall(function()
            queue_on_teleport(queuedCode)
        end)

        if ok then
            success = true
            method = "queue_on_teleport"
        end
    end

    -- queueonteleport
    if not success and type(queueonteleport) == "function" then

        local ok = pcall(function()
            queueonteleport(queuedCode)
        end)

        if ok then
            success = true
            method = "queueonteleport"
        end
    end

    -- syn.queue_on_teleport
    if not success
        and type(syn) == "table"
        and type(syn.queue_on_teleport) == "function" then

        local ok = pcall(function()
            syn.queue_on_teleport(queuedCode)
        end)

        if ok then
            success = true
            method = "syn.queue_on_teleport"
        end
    end

    if success then
        print("[Nhat Khan] Đã xếp hàng auto execute:", method)
        return true
    end

    warn(
        "[Nhat Khan] Executor không hỗ trợ queue_on_teleport."
    )

    return false
end

--==================================================
-- XÓA GUI CŨ
--==================================================

local old = PlayerGui:FindFirstChild("NhatKhanh")

if old then
    old:Destroy()
end

--==================================================
-- GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NhatKhanh"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
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

local UIScale = Instance.new("UIScale")
UIScale.Scale = 0.34
UIScale.Parent = Main

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(245, 100, 210)
MainStroke.Thickness = 3
MainStroke.Parent = Main

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(20, 15)
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "Nhat Khan Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 30
Title.Active = true
Title.Parent = Main

local Subtitle = Instance.new("TextLabel")
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.fromOffset(20, 65)
Subtitle.Size = UDim2.new(1, -40, 0, 30)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Trình chuyển máy chủ 1 người chơi"
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

local CurrentLabel = Instance.new("TextLabel")
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

local CurrentCorner = Instance.new("UICorner")
CurrentCorner.CornerRadius =
    UDim.new(0, 10)

CurrentCorner.Parent = CurrentLabel

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")

Status.BackgroundColor3 =
    Color3.fromRGB(180, 40, 140)

Status.Position =
    UDim2.fromOffset(25, 175)

Status.Size =
    UDim2.new(1, -50, 0, 85)

Status.Font =
    Enum.Font.Gotham

Status.Text =
    "SẴN SÀNG\nMục tiêu: đúng 1 người chơi"

Status.TextColor3 =
    Color3.fromRGB(255, 255, 255)

Status.TextSize = 17
Status.TextWrapped = true
Status.Parent = Main

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius =
    UDim.new(0, 10)

StatusCorner.Parent = Status

--==================================================
-- HOP BUTTON
--==================================================

local HopButton = Instance.new("TextButton")

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
    "CHUYỂN NGAY"

HopButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

HopButton.TextSize = 20
HopButton.Parent = Main

local HopCorner = Instance.new("UICorner")
HopCorner.CornerRadius =
    UDim.new(0, 10)

HopCorner.Parent = HopButton

--==================================================
-- AUTO BUTTON
--==================================================

local AutoButton = Instance.new("TextButton")

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
    "TỰ ĐỘNG: TẮT"

AutoButton.TextColor3 =
    Color3.fromRGB(255, 255, 255)

AutoButton.TextSize = 20
AutoButton.Parent = Main

local AutoCorner = Instance.new("UICorner")
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
        "Máy chủ hiện tại: "
        .. tostring(#Players:GetPlayers())
        .. " người chơi"

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
        "TỰ ĐỘNG: BẬT"

    AutoButton.BackgroundColor3 =
        Color3.fromRGB(235, 75, 195)

    setStatus(
        "TỰ ĐỘNG ĐÃ ĐƯỢC KHÔI PHỤC\n" ..
        "Đang tìm máy chủ có đúng 1 người..."
    )

end

--==================================================
-- TELEPORT ERROR
--==================================================

local teleportFailed = false
local teleportFailureMessage = ""

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
                "[Nhat Khan] Lỗi chuyển máy chủ:",
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
        "https://games.roblox.com/v1/games/"
        .. tostring(game.PlaceId)
        .. "/servers/Public?sortOrder=Asc&limit=100"

    if cursor and cursor ~= "" then

        url =
            url
            .. "&cursor="
            .. HttpService:UrlEncode(cursor)

    end

    local success, response =
        pcall(function()

            return game:HttpGet(url)

        end)

    if not success then

        return nil,
            "LỖI KẾT NỐI:\n"
            .. tostring(response)

    end

    if type(response) ~= "string"
        or #response == 0 then

        return nil,
            "API không trả về dữ liệu."

    end

    local decodeSuccess, data =
        pcall(function()

            return HttpService:JSONDecode(
                response
            )

        end)

    if not decodeSuccess then

        return nil,
            "LỖI ĐỌC DỮ LIỆU:\n"
            .. tostring(data)

    end

    if type(data) ~= "table" then

        return nil,
            "Dữ liệu máy chủ không hợp lệ."

    end

    if type(data.data) ~= "table" then

        return nil,
            "Không tìm thấy danh sách máy chủ."

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
            "ĐANG TÌM MÁY CHỦ...\n"
            .. "Trang "
            .. page
            .. " / 10\n"
            .. "Đang tìm máy chủ có đúng 1 người"
        )

        local data, errorMessage =
            getServerPage(cursor)

        if not data then
            return nil, errorMessage
        end

        for _, server in
            ipairs(data.data) do

            local id =
                tostring(server.id or "")

            local playing =
                tonumber(
                    server.playing or 0
                )

            local maxPlayers =
                tonumber(
                    server.maxPlayers or 0
                )

            if id ~= ""
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
            or cursor == "" then

            break
        end

        task.wait(0.15)
    end

    if #candidates == 0 then

        return nil,
            "Không tìm thấy máy chủ công khai có đúng 1 người."

    end

    shuffle(candidates)

    return candidates
end

--==================================================
-- TRY TELEPORT
--==================================================

local function tryTeleport(server)

    teleportFailed = false
    teleportFailureMessage = ""

    setStatus(
        "ĐANG CHUYỂN MÁY CHỦ...\n"
        .. "Người chơi: "
        .. tostring(server.playing)
        .. " / "
        .. tostring(server.maxPlayers)
    )

    -- Queue BEFORE teleport
    local queued =
        queueForTeleport()

    if not queued then

        warn(
            "[Nhat Khan] Không thể queue script."
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
            "CHUYỂN MÁY CHỦ THẤT BẠI:\n"
            .. tostring(errorMessage)

    end

    for i = 1, 50 do

        if teleportFailed then

            return false,
                "ROBLOX TỪ CHỐI CHUYỂN:\n"
                .. tostring(
                    teleportFailureMessage
                )

        end

        task.wait(0.1)
    end

    if game.JobId ~= server.id then

        return false,
            "Không thể hoàn tất chuyển máy chủ."

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
        "ĐANG TÌM..."

    HopButton.Active = false

    local servers, errorMessage =
        findServers()

    if not servers then

        setStatus(
            "KHÔNG TÌM THẤY MÁY CHỦ\n\n"
            .. tostring(errorMessage)
        )

        HopButton.Text =
            "CHUYỂN NGAY"

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
            "ĐANG THỬ MÁY CHỦ "
            .. attempt
            .. " / "
            .. attempts
            .. "\n"
            .. "Người chơi: "
            .. server.playing
            .. " / "
            .. server.maxPlayers
        )

        local success, reason =
            tryTeleport(server)

        if success then

            setStatus(
                "ĐANG CHUYỂN...\n\n"
                .. "Đang vào máy chủ 1 người."
            )

            return
        end

        warn(
            "[Nhat Khan] Lần thử "
            .. tostring(attempt)
            .. " thất bại:"
        )

        warn(tostring(reason))

        task.wait(0.5)
    end

    setStatus(
        "TẤT CẢ LẦN THỬ ĐỀU THẤT BẠI\n\n"
        .. "Hãy bấm CHUYỂN NGAY để thử lại."
    )

    HopButton.Text =
        "CHUYỂN NGAY"

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
                "TỰ ĐỘNG: BẬT"

            AutoButton.BackgroundColor3 =
                Color3.fromRGB(
                    235,
                    75,
                    195
                )

            setStatus(
                "ĐÃ BẬT TỰ ĐỘNG\n"
                .. "Đang tìm máy chủ có đúng 1 người..."
            )

            startAutoHop()

        else

            AutoButton.Text =
                "TỰ ĐỘNG: TẮT"

            AutoButton.BackgroundColor3 =
                Color3.fromRGB(
                    180,
                    40,
                    140
                )

            setStatus(
                "ĐÃ TẮT TỰ ĐỘNG\n\n"
                .. "Mục tiêu: đúng 1 người chơi"
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

print("====================================")
print("Nhat Khan Hub đã khởi động")
print("GUI có thể kéo bằng tiêu đề")
print("Auto-Hop:", autoHop)
print("Auto-execute sau teleport: ON")
print("Mục tiêu: đúng 1 người chơi")
print("====================================")