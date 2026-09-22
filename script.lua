-- ============================================
-- ⚔ BEN HUB — Loader с заставкой
-- ============================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- Удаляем старый экран загрузки
local old = playerGui:FindFirstChild("BenHubLoad")
if old then old:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "BenHubLoad"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.DisplayOrder = 999
sg.Parent = playerGui

-- Затемнение
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(15, 8, 30)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = sg
TweenService:Create(bg, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()

-- Карточка
local card = Instance.new("Frame")
card.Size = UDim2.new(0, 280, 0, 140)
card.Position = UDim2.new(0.5, -140, 0.5, -70)
card.BackgroundColor3 = Color3.fromRGB(25, 15, 45)
card.BackgroundTransparency = 1
card.BorderSizePixel = 0
card.Parent = sg
Instance.new("UICorner", card).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(160, 100, 255)
stroke.Thickness = 2
stroke.Transparency = 1
stroke.Parent = card

TweenService:Create(card, TweenInfo.new(0.4), {BackgroundTransparency = 0.05}):Play()
TweenService:Create(stroke, TweenInfo.new(0.4), {Transparency = 0.2}):Play()

-- Название
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 15)
title.BackgroundTransparency = 1
title.Text = "⚔ BEN HUB"
title.TextColor3 = Color3.fromRGB(200, 160, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextTransparency = 1
title.Parent = card
TweenService:Create(title, TweenInfo.new(0.4), {TextTransparency = 0}):Play()

-- Подзаголовок
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 72)
sub.BackgroundTransparency = 1
sub.Text = "Загрузка..."
sub.TextColor3 = Color3.fromRGB(160, 130, 210)
sub.Font = Enum.Font.GothamMedium
sub.TextSize = 13
sub.TextTransparency = 1
sub.Parent = card
TweenService:Create(sub, TweenInfo.new(0.4), {TextTransparency = 0}):Play()

-- Прогресс-бар
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -60, 0, 8)
barBg.Position = UDim2.new(0, 30, 1, -30)
barBg.BackgroundColor3 = Color3.fromRGB(45, 30, 70)
barBg.BorderSizePixel = 0
barBg.Parent = card
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(160, 100, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBg
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

task.wait(0.3)
TweenService:Create(barFill, TweenInfo.new(0.9), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(1.0)

-- Плавное исчезновение
TweenService:Create(card, TweenInfo.new(0.35), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -140, 0.5, -90)}):Play()
TweenService:Create(stroke, TweenInfo.new(0.35), {Transparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
TweenService:Create(sub, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
TweenService:Create(barBg, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
TweenService:Create(barFill, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
TweenService:Create(bg, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()

task.wait(0.45)
sg:Destroy()

-- ============ ЗАПУСК BEN HUB ============
loadstring(game:HttpGet("https://raw.githubusercontent.com/ylizar922-bot/Ben-hub/main/script.lua"))()

-- Уведомление
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚔ BEN HUB",
        Text = "Успешно загружено!",
        Duration = 3
    })
end)
