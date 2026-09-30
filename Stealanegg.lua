-- NhatKhanh Hub

local SLATE_URL = "https://raw.githubusercontent.com/PulseZax/Slate/refs/heads/main/.lua"

local PINK = Color3.fromRGB(255, 105, 180)
local LIGHT_PINK = Color3.fromRGB(255, 150, 205)
local DARK_PINK = Color3.fromRGB(220, 55, 140)

local CATALOG = {
    {
        Key = "mm2",
        Name = "Murder Mystery 2",
        Places = {142823291},
        Universe = 66654135,
        Loader = "https://api.luarmor.net/files/v4/loaders/5857a6cfae3b902eb3c2dff7cdbf173b.lua",
        Listed = true,
        Tone = PINK,
    },
    {
        Key = "speed",
        Name = "+1 Speed Keyboard Escape",
        Places = {95082159892680, 118941584817777, 93411036959889},
        Universe = 9584852943,
        Loader = "https://api.luarmor.net/files/v4/loaders/385c6d8937bfc4ef284dc8c27b50e1c5.lua",
        Listed = false,
        Tone = PINK,
    },
    {
        Key = "gag",
        Name = "Grow A Garden 2",
        Places = {97598239454123},
        Universe = 10200395747,
        Loader = "https://api.luarmor.net/files/v4/loaders/abd74919679fad90b027ed4e177cea66.lua",
        Listed = true,
        Tone = PINK,
    },
    {
        Key = "sandiego",
        Name = "San Diego Border Roleplay",
        Places = {136020512003847},
        Universe = 9855761734,
        Loader = "https://api.luarmor.net/files/v4/loaders/16e8365b42517b9a82b7e0a9f4120d3c.lua",
        Listed = true,
        Tone = PINK,
    },
    {
        Key = "stealegg",
        Name = "Steal An Egg",
        Places = {107778070777162},
        Universe = 10563114921,
        Loader = "https://api.luarmor.net/files/v4/loaders/9eaf6021130040db2646aa9b094427ef.lua",
        Listed = true,
        Tone = PINK,
    },
    {
        Key = "rivals",
        Name = "RIVALS",
        Places = {
            17625359962,
            71874690745115,
            117398147513099,
            129604661913557,
            133215910299950,
            18126510175
        },
        Universe = 6035872082,
        Loader = "https://api.luarmor.net/files/v4/loaders/8ea20a4f7e9fb8343eec902723cf66f6.lua",
        Listed = true,
        Tone = PINK,
    },
    {
        Key = "bloxstrike",
        Name = "BloxStrike",
        Places = {
            114234929420007,
            108194354348181,
            135434213652028,
            101836176558619
        },
        Universe = 7633926880,
        Loader = "https://api.luarmor.net/files/v4/loaders/107fbc36b735fcffe3b85e3eb7b84eb5.lua",
        Listed = true,
        Tone = PINK,
    },
}

local Players = game:GetService("Players")

local function thumb(placeId)
    return string.format(
        "rbxthumb://type=Asset&id=%d&w=150&h=150",
        placeId
    )
end

local function launch(entry)
    return pcall(function()
        return loadstring(
            game:HttpGet(entry.Loader),
            "@" .. entry.Key
        )()
    end)
end

local function arm(element, action)
    if type(element) ~= "table" then
        return
    end

    local last = 0

    for _, part in ipairs({
        element.button,
        element.card,
        element.hitbox
    }) do
        if typeof(part) == "Instance" then
            pcall(function()
                part.Active = true

                part.InputBegan:Connect(function(input)
                    if input.UserInputType ~= Enum.UserInputType.MouseButton1
                        and input.UserInputType ~= Enum.UserInputType.Touch then
                        return
                    end

                    if os.clock() - last < 0.5 then
                        return
                    end

                    last = os.clock()
                    action()
                end)
            end)
        end
    end
end

local function matchPlace(placeId, universeId)
    for _, entry in ipairs(CATALOG) do
        if entry.Universe and entry.Universe == universeId then
            return entry
        end
    end

    for _, entry in ipairs(CATALOG) do
        for _, id in ipairs(entry.Places) do
            if id == placeId then
                return entry
            end
        end
    end

    return nil
end

local supported = matchPlace(game.PlaceId, game.GameId)

if supported then
    local ok, err = launch(supported)

    if not ok then
        warn(
            "NhatKhanh Hub: "
            .. supported.Name
            .. " không thể khởi chạy - "
            .. tostring(err)
        )
    end

    return
end

if type(_G.NhatKhanhHubLoader) == "table" then
    pcall(function()
        _G.NhatKhanhHubLoader.Window:Destroy()
    end)
end

_G.NhatKhanhHubLoader = {}

local Slate = loadstring(
    game:HttpGet(SLATE_URL),
    "@Slate"
)()

pcall(function()
    Slate.Cleanup()
end)

pcall(function()
    Slate:PreloadIcons({"lucide"})
end)

local Window = Slate:CreateWindow({
    Name = "NhatKhanh Hub",
    Subtitle = "Trình quản lý Script",
    Icon = "heart",
    Logo = true,
    Size = UDim2.fromOffset(700, 500),
    ToggleKey = Enum.KeyCode.LeftControl,
})

pcall(function()
    Slate.Theme.Preset("Ash")
end)

pcall(function()
    Slate:SetFontFamily("JosefinSans")
end)

pcall(function()
    Window:SetBackdrop("aurora")
end)

pcall(function()
    local corner = Window.root:FindFirstChildOfClass("UICorner")

    if corner then
        corner.CornerRadius = UDim.new(0, 10)
    end

    local stroke = Window.root:FindFirstChildOfClass("UIStroke")

    if stroke then
        stroke.Thickness = 0
    end
end)

_G.NhatKhanhHubLoader.Window = Window

local Tab = Window:CreateTab({
    Name = "Danh sách Script",
    Icon = "layout-grid"
})

local placeName = "trò chơi này"

pcall(function()
    local info = game:GetService(
        "MarketplaceService"
    ):GetProductInfo(game.PlaceId)

    if info and info.Name then
        placeName = info.Name
    end
end)

-- Thông báo game chưa được hỗ trợ
do
    local notice = Tab:CreateSection({
        Name = "Game chưa hỗ trợ"
    })

    notice:Paragraph({
        Name = "Không có Script cho " .. placeName,
        Description = "Bạn có thể chọn một Script bên dưới để thử khởi chạy.",
    })
end

-- Danh sách Script
do
    local list = Tab:CreateSection({
        Name = "Script có sẵn"
    })

    local grid = list:Grid({
        Columns = 2,
        Height = 206,
        MinWidth = 196
    })

    for _, entry in ipairs(CATALOG) do
        if entry.Listed then

            local start = function()

                Slate:Notify({
                    Title = "NhatKhanh Hub",
                    Description = "Đang khởi chạy " .. entry.Name,
                    Icon = "play",
                    Duration = 5,
                })

                task.spawn(function()

                    local finished = false
                    local ok = nil
                    local err = nil

                    task.spawn(function()
                        ok, err = launch(entry)
                        finished = true
                    end)

                    local waited = 0

                    while not finished and waited < 6 do
                        task.wait(0.25)
                        waited += 0.25
                    end

                    if not finished then

                        Slate:Notify({
                            Title = "NhatKhanh Hub",
                            Description =
                                entry.Name
                                .. " đang chờ dữ liệu của game.",
                            Icon = "triangle-alert",
                            Tone = "Warning",
                            Duration = 10,
                        })

                    elseif not ok then

                        Slate:Notify({
                            Title = "NhatKhanh Hub",
                            Description =
                                entry.Name
                                .. " khởi chạy thất bại: "
                                .. tostring(err),
                            Icon = "circle-alert",
                            Tone = "Danger",
                            Duration = 10,
                        })

                    else

                        Slate:Notify({
                            Title = "NhatKhanh Hub",
                            Description =
                                entry.Name
                                .. " đã khởi chạy thành công!",
                            Icon = "circle-check",
                            Tone = "Success",
                            Duration = 8,
                        })

                    end
                end)
            end

            local card = grid:Invite({
                Name = entry.Name,

                Icon = thumb(
                    entry.Places[1]
                ),

                Stats = {
                    {
                        Text = "Mã Game "
                            .. tostring(entry.Places[1]),
                        Dot = PINK
                    },
                },

                Game = "ROBLOX",
                GameIcon = "gamepad-2",

                Tone = PINK,
                Glyph = "heart",

                ButtonText = "Chạy Script",
                ButtonColor = PINK,

                CopiedText = "Đang khởi chạy",

                Callback = start,
            })

            arm(card, start)
        end
    end
end

-- Nút đóng
do
    local close = Tab:CreateSection({
        Name = "Menu"
    })

    close:Button({
        Name = "Đóng Menu",
        Icon = "x",

        Callback = function()

            pcall(function()
                Window:Destroy()
            end)

            _G.NhatKhanhHubLoader = nil
        end,
    })
end

-- Thông báo cuối
Slate:Notify({
    Title = "NhatKhanh Hub",

    Description =
        "Không có Script cho "
        .. placeName
        .. ". Hãy chọn một Script bên dưới để chạy.",

    Icon = "heart",
    Tone = "Warning",
    Duration = 10,
})
