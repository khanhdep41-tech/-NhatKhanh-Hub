--// Nhat Khan Hub
--// Full GUI + server hopping + post-teleport reexecution
--// Target: public server with ONE EXISTING player.
--// Auto hopping starts OFF.

local HUB_SOURCE = [====[
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("NhatKhanh")
if old then
    old:Destroy()
end

local alive = true
local hopping = false
local generation = 0
local connections = {}
local pending = nil

local function connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(connections, connection)
    return connection
end

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "NhatKhanh"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

connect(gui.Destroying, function()
    alive = false
    generation += 1
    pending = nil

    for _, connection in ipairs(connections) do
        connection:Disconnect()
    end

    table.clear(connections)
end)

local function round(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = object
end

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(310, 150)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(190, 45, 150)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui
round(main, 18)

local scale = Instance.new("UIScale")
scale.Scale = 0.45
scale.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(245, 100, 210)
stroke.Thickness = 3
stroke.Parent = main

local function makeText(className, y, height, textValue, size, color)
    local object = Instance.new(className)
    object.Position = UDim2.fromOffset(12, y)
    object.Size = UDim2.new(1, -24, 0, height)
    object.BackgroundColor3 = color
    object.BorderSizePixel = 0
    object.Font = Enum.Font.GothamBold
    object.Text = textValue
    object.TextSize = size
    object.TextColor3 = Color3.new(1, 1, 1)
    object.TextWrapped = true
    object.Parent = main
    round(object, 12)
    return object
end

local title = makeText(
    "TextLabel", 8, 28, "Nhat Khan Hub", 18,
    Color3.fromRGB(190, 45, 150)
)
title.BackgroundTransparency = 1
title.Active = true

local current = makeText(
    "TextLabel", 42, 32, "MÁY CHỦ HIỆN TẠI: 0 NGƯỜI", 13,
    Color3.fromRGB(210, 55, 170)
)

local hopButton = makeText(
    "TextButton", 78, 60, "CHUYỂN NGAY", 22,
    Color3.fromRGB(220, 60, 175)
)
hopButton.AutoButtonColor = true

local function setStatus(text)
    -- Status is kept internally for error/progress logging.
    -- The compact GUI intentionally shows only the player count and hop button.
end

local function setBusy(value)
    hopping = value

    if alive then
        hopButton.Text = value and "ĐANG CHUYỂN..." or "CHUYỂN NGAY"
        hopButton.AutoButtonColor = not value
    end
end

--==================================================
-- DRAGGING
--==================================================

local dragInput
local dragStart
local startPosition

local function startDrag(input)
    if dragInput then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragInput = input
        dragStart = input.Position
        startPosition = main.Position
    end
end

connect(title.InputBegan, startDrag)

connect(UserInputService.InputChanged, function(input)
    if not alive or not dragInput then
        return
    end

    local mouseMove =
        dragInput.UserInputType == Enum.UserInputType.MouseButton1
        and input.UserInputType == Enum.UserInputType.MouseMovement

    if mouseMove or input == dragInput then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

connect(UserInputService.InputEnded, function(input)
    if input == dragInput then
        dragInput = nil
    end
end)

--==================================================
-- PLAYER COUNT
--==================================================

local function updateCount()
    if alive then
        current.Text =
            "MÁY CHỦ HIỆN TẠI: "
            .. tostring(#Players:GetPlayers())
            .. " NGƯỜI"
    end
end

updateCount()
connect(Players.PlayerAdded, updateCount)

connect(Players.ChildRemoved, function(child)
    if child:IsA("Player") then
        updateCount()
    end
end)

--==================================================
-- TELEPORT FAILURE
--==================================================

connect(TeleportService.TeleportInitFailed,
    function(failedPlayer, result, message, placeId)
        if not alive or failedPlayer ~= player or not pending then
            return
        end

        if placeId and placeId ~= game.PlaceId then
            return
        end

        pending.failed = true
        pending.reason = tostring(message or result)
    end
)

--==================================================
-- SERVER API
--==================================================

local function getPage(cursor)
    local url =
        "https://games.roblox.com/v1/games/"
        .. tostring(game.PlaceId)
        .. "/servers/Public?sortOrder=Asc&limit=100"

    if cursor then
        url ..= "&cursor=" .. HttpService:UrlEncode(cursor)
    end

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        return nil, "LỖI KẾT NỐI:\n" .. tostring(response)
    end

    if type(response) ~= "string" or response == "" then
        return nil, "API không trả về dữ liệu."
    end

    local decoded, data = pcall(function()
        return HttpService:JSONDecode(response)
    end)

    if not decoded then
        return nil, "LỖI ĐỌC DỮ LIỆU:\n" .. tostring(data)
    end

    if type(data) ~= "table" or type(data.data) ~= "table" then
        return nil, "Danh sách máy chủ không hợp lệ."
    end

    return data
end

local random = Random.new()

local function findServers()
    local candidates = {}
    local seenIds = {}
    local seenCursors = {}
    local cursor

    for page = 1, 10 do
        if not alive then
            return nil, "Đã dừng script."
        end

        setStatus(
            "ĐANG TÌM MÁY CHỦ...\nTrang "
            .. page .. " / 10\nMục tiêu: có sẵn 1 người"
        )

        local data, reason = getPage(cursor)

        if not alive then
            return nil, "Đã dừng script."
        end

        if not data then
            if #candidates > 0 then
                break
            end
            return nil, reason
        end

        for _, server in ipairs(data.data) do
            if type(server) == "table" then
                local id = server.id
                local playing = tonumber(server.playing)
                local capacity = tonumber(server.maxPlayers)

                if type(id) == "string"
                    and id ~= ""
                    and id ~= game.JobId
                    and not seenIds[id]
                    and playing == 1
                    and capacity
                    and capacity > playing then

                    seenIds[id] = true
                    table.insert(candidates, {
                        id = id,
                        playing = playing,
                        maxPlayers = capacity
                    })
                end
            end
        end

        if #candidates >= 20 then
            break
        end

        local nextCursor = data.nextPageCursor

        if type(nextCursor) ~= "string"
            or nextCursor == ""
            or seenCursors[nextCursor] then
            break
        end

        seenCursors[nextCursor] = true
        cursor = nextCursor
        task.wait(0.3)
    end

    if #candidates == 0 then
        return nil, "Không tìm thấy máy chủ có sẵn đúng 1 người."
    end

    for i = #candidates, 2, -1 do
        local j = random:NextInteger(1, i)
        candidates[i], candidates[j] = candidates[j], candidates[i]
    end

    return candidates
end

--==================================================
-- TELEPORT
--==================================================

local function tryTeleport(server)
    if not alive then
        return "Đã dừng script."
    end

    local attempt = {
        failed = false,
        reason = nil
    }
    pending = attempt

    setStatus(
        "ĐANG CHUYỂN MÁY CHỦ...\nCó sẵn "
        .. server.playing .. " / "
        .. server.maxPlayers .. " người"
    )

    local success, reason = pcall(function()
        TeleportService:TeleportToPlaceInstance(
            game.PlaceId,
            server.id,
            player
        )
    end)

    if not success then
        pending = nil
        return tostring(reason)
    end

    local started = os.clock()
    local notified = false

    -- Do not submit another request while teleport is pending.
    while alive and pending == attempt do
        if attempt.failed then
            pending = nil
            return attempt.reason
        end

        if not notified and os.clock() - started >= 30 then
            notified = true
            setStatus(
                "ĐANG CHỜ ROBLOX...\n"
                .. "Chưa nhận được lỗi chuyển máy chủ.\n"
                .. "Không gửi yêu cầu trùng lặp."
            )
        end

        task.wait(0.1)
    end

    return "Đã dừng script."
end

local function hop()
    local servers, reason = findServers()

    if not alive then
        return
    end

    if not servers then
        setStatus("KHÔNG TÌM THẤY MÁY CHỦ\n" .. tostring(reason))
        return
    end

    local attempts = math.min(#servers, 8)

    for index = 1, attempts do
        if not alive then
            return
        end

        local failure = tryTeleport(servers[index])

        if not alive then
            return
        end

        warn(
            "[Nhat Khan] Lần thử " .. index
            .. " thất bại: " .. tostring(failure)
        )

        setStatus(
            "CHUYỂN THẤT BẠI\n"
            .. tostring(failure)
            .. "\nLần thử " .. index .. " / " .. attempts
        )

        task.wait(0.75)
    end

    setStatus(
        "TẤT CẢ LẦN THỬ ĐỀU THẤT BẠI\n"
        .. "Bấm CHUYỂN NGAY để thử lại."
    )
end

local function runHop()
    if not alive or hopping then
        return
    end

    setBusy(true)

    task.spawn(function()
        local success, reason = xpcall(hop, function(err)
            return debug.traceback(tostring(err), 2)
        end)

        if not success and alive then
            pending = nil
            setStatus("LỖI SCRIPT:\n" .. tostring(reason))
            warn("[Nhat Khan] " .. tostring(reason))
        end

        if alive then
            setBusy(false)
        end
    end)
end

--==================================================
-- BUTTON
--==================================================

connect(hopButton.Activated, runHop)



print("[Nhat Khan] GUI đã khởi động.")
]====]

--==================================================
-- QUEUE REEXECUTION BEFORE ANY TELEPORT
--==================================================

local BOOTSTRAP = [====[
local hubSource, bootstrapSource = ...

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")

while not Players.LocalPlayer do
    task.wait()
end

Players.LocalPlayer:WaitForChild("PlayerGui")

local environment =
    type(getgenv) == "function" and getgenv() or _G

-- Remove the previous version's event listener.
local previous = environment.NhatKhanTeleportConnection

if previous then
    pcall(function()
        previous:Disconnect()
    end)

    environment.NhatKhanTeleportConnection = nil
end

local queueTeleport =
    queueonteleport
    or queue_on_teleport
    or queueteleport

-- Avoid repeatedly queuing this hub in the same server when
-- the user manually executes this source more than once.
local queueKey =
    tostring(game.PlaceId) .. ":" .. tostring(game.JobId)

if type(queueTeleport) == "function" then
    if environment.NhatKhanQueuedServer ~= queueKey then
        local nextSource =
            "local hubSource = "
            .. string.format("%q", hubSource)
            .. "\nlocal bootstrapSource = "
            .. string.format("%q", bootstrapSource)
            .. "\nlocal env = "
            .. "type(getgenv) == 'function' and getgenv() or _G"
            .. "\nenv.NhatKhanQueuedServer = nil"
            .. "\nlocal fn, err = loadstring(bootstrapSource)"
            .. "\nif not fn then error(err) end"
            .. "\nfn(hubSource, bootstrapSource)"

        local success, reason = pcall(function()
            queueTeleport(nextSource)
        end)

        if success then
            environment.NhatKhanQueuedServer = queueKey
            print("[Nhat Khan] REEXECUTION QUEUED before teleport.")
        else
            warn("[Nhat Khan] QUEUE FAILED: " .. tostring(reason))
        end
    else
        print("[Nhat Khan] Reexecution already queued in this server.")
    end
else
    warn(
        "[Nhat Khan] QUEUE API MISSING; "
        .. "cannot reexecute after teleport."
    )
end

local executeHub, compileError = loadstring(hubSource)

if not executeHub then
    error(
        "[Nhat Khan] GUI compile error: "
        .. tostring(compileError)
    )
end

print(
    "[Nhat Khan] Starting GUI in server: "
    .. tostring(game.JobId)
)

executeHub()
]====]

local start, compileError = loadstring(BOOTSTRAP)

if not start then
    error(
        "[Nhat Khan] Bootstrap error: "
        .. tostring(compileError)
    )
end

start(HUB_SOURCE, BOOTSTRAP)