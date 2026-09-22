-- ============================================
-- ⚔ BEN HUB — Заставка + Chams Script
-- ============================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- ============ ЭКРАН ЗАГРУЗКИ ============
local oldLoading = playerGui:FindFirstChild("BenHubLoading")
if oldLoading then oldLoading:Destroy() end

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "BenHubLoading"
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.DisplayOrder = 999
loadingGui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = loadingGui

TweenService:Create(bg, TweenInfo.new(0.4), {BackgroundTransparency = 0.3}):Play()

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 300, 0, 180)
container.Position = UDim2.new(0.5, -150, 0.5, -90)
container.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
container.BackgroundTransparency = 0.05
container.BorderSizePixel = 0
container.Parent = loadingGui
Instance.new("UICorner", container).CornerRadius = UDim.new(0, 16)

local containerStroke = Instance.new("UIStroke")
containerStroke.Color = Color3.fromRGB(120, 80, 255)
containerStroke.Thickness = 2
containerStroke.Transparency = 0.2
containerStroke.Parent = container

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 20)
title.BackgroundTransparency = 1
title.Text = "⚔ BEN HUB"
title.TextColor3 = Color3.fromRGB(220, 180, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextTransparency = 1
title.Parent = container

TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 75)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Loading..."
subtitle.TextColor3 = Color3.fromRGB(160, 140, 200)
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 13
subtitle.TextTransparency = 1
subtitle.Parent = container

TweenService:Create(subtitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -60, 0, 10)
barBg.Position = UDim2.new(0, 30, 1, -50)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
barBg.BorderSizePixel = 0
barBg.Parent = container
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

local barGlow = Instance.new("Frame")
barGlow.Size = UDim2.new(0, 40, 1, 0)
barGlow.Position = UDim2.new(1, -40, 0, 0)
barGlow.BackgroundColor3 = Color3.fromRGB(200, 160, 255)
barGlow.BackgroundTransparency = 0.3
barGlow.BorderSizePixel = 0
barGlow.Parent = barFill
Instance.new("UICorner", barGlow).CornerRadius = UDim.new(1, 0)

local percentLbl = Instance.new("TextLabel")
percentLbl.Size = UDim2.new(1, 0, 0, 18)
percentLbl.Position = UDim2.new(0, 0, 1, -25)
percentLbl.BackgroundTransparency = 1
percentLbl.Text = "0%"
percentLbl.TextColor3 = Color3.fromRGB(200, 180, 255)
percentLbl.Font = Enum.Font.GothamBold
percentLbl.TextSize = 12
percentLbl.Parent = container

local steps = {
    {percent = 20, text = "Загрузка интерфейса..."},
    {percent = 45, text = "Инициализация чамсов..."},
    {percent = 70, text = "Настройка маркеров..."},
    {percent = 90, text = "Почти готово..."},
    {percent = 100, text = "Готово! ⚔"},
}

for i, step in ipairs(steps) do
    task.wait(0.35)
    subtitle.Text = step.text
    local targetSize = UDim2.new(step.percent / 100, 0, 1, 0)
    TweenService:Create(barFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
    percentLbl.Text = step.percent .. "%"
end

task.wait(0.6)

TweenService:Create(container, TweenInfo.new(0.5), {
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, -150, 0.5, -110)
}):Play()
TweenService:Create(containerStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
TweenService:Create(subtitle, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
TweenService:Create(percentLbl, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
TweenService:Create(barBg, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(barFill, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(barGlow, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()

task.wait(0.6)
loadingGui:Destroy()

-- ============ ОСНОВНОЙ СКРИПТ BEN HUB ============

local COLORS = {
    Player     = Color3.fromRGB(255, 60, 60),
    Drone      = Color3.fromRGB(255, 130, 0),
    MyDrone    = Color3.fromRGB(60, 255, 60),
    Gazel      = Color3.fromRGB(180, 60, 255),
    Leaderboard = Color3.fromRGB(0, 150, 255),
}
local TRANSPARENCY = 0.5
local DRONE_MARKER_SHOW_DISTANCE = 1500
local DRONE_MARKER_MAX_DISTANCE = 10000
local LEADERBOARD_NAME = ""

local DRONE_KEYWORDS = {"shahed", "шахед", "дрон", "бпла", "uav", "drone"}
local GAZEL_KEYWORDS = {"gazel", "газель", "газел"}
local LEADERBOARD_KEYWORDS = {
    "leaderboard", "лидерборд", "лидербор", "таблица", "рейтинг",
    "top", "rank", "stats", "board", "scoreboard", "табло"
}
local MY_NAMES = {"benmaster505", "benmaster", "benloniks", "benlonik"}

local state = { Player = false, Drone = true, MyDrone = false, Gazel = true, Leaderboard = false }
local activeChams = {}
local droneMarkers = {}

local function applyDroneMarker(model)
    if droneMarkers[model] then return end
    local basePart = model:FindFirstChildWhichIsA("BasePart") or model.PrimaryPart
    if not basePart then
        for _, d in ipairs(model:GetDescendants()) do
            if d:IsA("BasePart") then basePart = d; break end
        end
    end
    if not basePart then return end

    local bb = Instance.new("BillboardGui")
    bb.Name = "DroneMarkerGui"
    bb.Size = UDim2.new(0, 100, 0, 24)
    bb.StudsOffset = Vector3.new(0, 6, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = DRONE_MARKER_MAX_DISTANCE
    bb.LightInfluence = 0
    bb.Adornee = basePart
    bb.Enabled = false
    bb.Parent = basePart

    local distLbl = Instance.new("TextLabel")
    distLbl.Size = UDim2.new(1, 0, 1, 0)
    distLbl.BackgroundTransparency = 1
    distLbl.Text = "0"
    distLbl.TextColor3 = COLORS.Drone
    distLbl.TextStrokeTransparency = 0
    distLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distLbl.Font = Enum.Font.GothamBold
    distLbl.TextSize = 18
    distLbl.Parent = bb

    droneMarkers[model] = {gui = bb, label = distLbl}
end

local function removeDroneMarker(model)
    local m = droneMarkers[model]
    if m then
        if m.gui then m.gui:Destroy() end
        droneMarkers[model] = nil
    end
end

local function updateDroneMarkerDistances()
    local char = localPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local myPos = root.Position
    for model, m in pairs(droneMarkers) do
        if not model.Parent or not m.gui or not m.gui.Parent then
            droneMarkers[model] = nil
        else
            local pivot = model:GetPivot().Position
            local dist = (myPos - pivot).Magnitude
            m.label.Text = tostring(math.floor(dist))
            m.gui.Enabled = dist <= DRONE_MARKER_SHOW_DISTANCE
        end
    end
end

local function removeCham(model)
    local d = activeChams[model]
    if d then
        if d.highlight then d.highlight:Destroy() end
        activeChams[model] = nil
    end
    removeDroneMarker(model)
end

local function removeChamsByType(t)
    for m, d in pairs(activeChams) do
        if d.type == t then
            if d.highlight then d.highlight:Destroy() end
            activeChams[m] = nil
            if t == "Drone" then removeDroneMarker(m) end
        end
    end
end

local function removeAllChams()
    for _, d in pairs(activeChams) do
        if d.highlight then d.highlight:Destroy() end
    end
    activeChams = {}
    for m in pairs(droneMarkers) do removeDroneMarker(m) end
end

local function applyCham(model, typeName)
    if not model or not model.Parent then return end
    local color = COLORS[typeName]
    if not color then return end
    local ex = activeChams[model]
    if ex and ex.type == typeName then return end
    if ex then removeCham(model) end
    local h = Instance.new("Highlight")
    h.Name = "ChamsHighlight"
    h.FillColor = color
    h.OutlineColor = color
    h.FillTransparency = TRANSPARENCY
    h.OutlineTransparency = 0.1
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Adornee = model
    h.Parent = model
    activeChams[model] = {highlight = h, type = typeName}
    if typeName == "Drone" then applyDroneMarker(model) end
end

local function isMyDrone(model)
    if localPlayer.Character and model:IsDescendantOf(localPlayer.Character) then return true end
    for _, c in ipairs(model:GetChildren()) do
        if c:IsA("ObjectValue") and c.Value == localPlayer then return true end
        if c:IsA("StringValue") and c.Value then
            local v = tostring(c.Value):lower()
            for _, n in ipairs(MY_NAMES) do
                if string.find(v, n) then return true end
            end
        end
    end
    local nm = model.Name:lower()
    for _, n in ipairs(MY_NAMES) do
        if string.find(nm, n) then return true end
    end
    if model.Parent then
        local pn = model.Parent.Name:lower()
        for _, n in ipairs(MY_NAMES) do
            if string.find(pn, n) then return true end
        end
    end
    return false
end

local function isLeaderboardModel(model)
    local nm = model.Name:lower()
    if LEADERBOARD_NAME ~= "" then
        return string.find(nm, LEADERBOARD_NAME:lower()) ~= nil
    end
    for _, kw in ipairs(LEADERBOARD_KEYWORDS) do
        if string.find(nm, kw) then return true end
    end
    if model.Parent then
        local pn = model.Parent.Name:lower()
        for _, kw in ipairs(LEADERBOARD_KEYWORDS) do
            if string.find(pn, kw) then return true end
        end
    end
    return false
end

local function classify(model)
    if not model or not model.Parent or not model:IsA("Model") then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character == model then
            if p == localPlayer then return nil end
            return "Player"
        end
    end
    if isMyDrone(model) then return "MyDrone" end
    local nm = model.Name:lower()
    for _, kw in ipairs(GAZEL_KEYWORDS) do
        if string.find(nm, kw) then return "Gazel" end
    end
    for _, kw in ipairs(DRONE_KEYWORDS) do
        if string.find(nm, kw) then return "Drone" end
    end
    if isLeaderboardModel(model) then return "Leaderboard" end
    return nil
end

local function updateModel(model)
    if not model or not model.Parent then removeCham(model); return end
    local t = classify(model)
    if not t then removeCham(model); return end
    if state[t] then applyCham(model, t) else removeCham(model) end
end

local function rescanAll()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then updateModel(obj) end
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BenHubGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local MENU_WIDTH = 360
local MENU_HEIGHT = 340

local main = Instance.new("Frame")
main.Size = UDim2.new(0, MENU_WIDTH, 0, MENU_HEIGHT)
main.Position = UDim2.new(0, 20, 0.5, -MENU_HEIGHT/2)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
main.BackgroundTransparency = 0.05
main.BorderSizePixel = 0
main.Visible = true
main.Parent = screenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(120, 80, 255)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = main

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 38)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 25, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = main
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 10)
titleFix.Position = UDim2.new(0, 0, 1, -10)
titleFix.BackgroundColor3 = Color3.fromRGB(35, 25, 60)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -80, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚔ BEN HUB"
titleLabel.TextColor3 = Color3.fromRGB(220, 180, 255)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 26, 0, 26)
minBtn.Position = UDim2.new(1, -62, 0, 6)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(20, 20, 25)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 17
minBtn.BorderSizePixel = 0
minBtn.Parent = titleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -31, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

local sectionLabel = Instance.new("TextLabel")
sectionLabel.Size = UDim2.new(1, -20, 0, 26)
sectionLabel.Position = UDim2.new(0, 10, 0, 44)
sectionLabel.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
sectionLabel.BackgroundTransparency = 0.3
sectionLabel.Text = "VISUALS"
sectionLabel.TextColor3 = Color3.fromRGB(200, 180, 255)
sectionLabel.Font = Enum.Font.GothamBold
sectionLabel.TextSize = 12
sectionLabel.BorderSizePixel = 0
sectionLabel.Parent = main
Instance.new("UICorner", sectionLabel).CornerRadius = UDim.new(0, 8)

local contentHolder = Instance.new("Frame")
contentHolder.Size = UDim2.new(1, -20, 1, -96)
contentHolder.Position = UDim2.new(0, 10, 0, 76)
contentHolder.BackgroundTransparency = 1
contentHolder.Parent = main

local pageLayout = Instance.new("UIListLayout")
pageLayout.Padding = UDim.new(0, 5)
pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
pageLayout.Parent = contentHolder

local function createToggle(text, key, color, order)
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(1, 0, 0, 40)
    row.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
    row.BorderSizePixel = 0
    row.Text = ""
    row.AutoButtonColor = false
    row.LayoutOrder = order
    row.Parent = contentHolder
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 1
    stroke.Transparency = 0.7
    stroke.Parent = row

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 9, 0, 9)
    dot.Position = UDim2.new(0, 10, 0.5, -4.5)
    dot.BackgroundColor3 = color
    dot.BorderSizePixel = 0
    dot.Parent = row
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -90, 1, 0)
    lbl.Position = UDim2.new(0, 25, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 12
    lbl.Parent = row

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0, 50, 0, 24)
    status.Position = UDim2.new(1, -58, 0.5, -12)
    status.Text = "ВЫКЛ"
    status.Font = Enum.Font.GothamBold
    status.TextSize = 11
    status.BorderSizePixel = 0
    status.Parent = row
    Instance.new("UICorner", status).CornerRadius = UDim.new(0, 6)

    local function refresh()
        if state[key] then
            status.Text = "ВКЛ"
            status.BackgroundColor3 = Color3.fromRGB(30, 70, 40)
            status.TextColor3 = Color3.fromRGB(80, 255, 120)
            stroke.Transparency = 0.3
            row.BackgroundColor3 = Color3.fromRGB(40, 44, 54)
        else
            status.Text = "ВЫКЛ"
            status.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
            status.TextColor3 = Color3.fromRGB(255, 120, 120)
            stroke.Transparency = 0.7
            row.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
        end
    end

    row.MouseButton1Click:Connect(function()
        state[key] = not state[key]
        refresh()
        if state[key] then rescanAll() else removeChamsByType(key) end
    end)

    refresh()
end

createToggle("Игроки",     "Player",      COLORS.Player,      1)
createToggle("Шахеды",     "Drone",       COLORS.Drone,       2)
createToggle("Мой Шахед",  "MyDrone",     COLORS.MyDrone,     3)
createToggle("Газели",     "Gazel",       COLORS.Gazel,       4)
createToggle("Лидерборды", "Leaderboard", COLORS.Leaderboard, 5)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "BenHubToggle"
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(0, 20, 0.5, -30)
toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 25, 60)
toggleBtn.Text = "BEN\nHUB"
toggleBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 13
toggleBtn.TextWrapped = true
toggleBtn.BorderSizePixel = 0
toggleBtn.Visible = false
toggleBtn.Parent = screenGui
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 10)

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(120, 80, 255)
toggleStroke.Thickness = 2
toggleStroke.Transparency = 0.2
toggleStroke.Parent = toggleBtn

local dragging, dragStart, startPos = false, nil, nil
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        local p = input.Position
        local function inRect(pp, tl, sz)
            return pp.X >= tl.X and pp.X <= tl.X + sz.X
               and pp.Y >= tl.Y and pp.Y <= tl.Y + sz.Y
        end
        if inRect(p, minBtn.AbsolutePosition, minBtn.AbsoluteSize) then return end
        if inRect(p, closeBtn.AbsolutePosition, closeBtn.AbsoluteSize) then return end
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local btnDragging, btnDragStart, btnStartPos = false, nil, nil
local btnMoved = false

toggleBtn.InputBegan:Connect(function(input)
    if input.Us
