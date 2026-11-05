--[[
    ╔══════════════════════════════════════════════════════════╗
    ║                       RayUI v1.0                         ║
    ║           مكتبة مشغلات شاملة لسكربتات Roblox             ║
    ╠══════════════════════════════════════════════════════════╣
    ║  الميزات:                                                ║
    ║  • 4 شاشات تحميل (Pro Max, Xt, Dow, Ray)                ║
    ║  • 7 ثيمات + ColorP لتعديل الألوان                      ║
    ║  • Button, Toggle, Slider, Textbox, ColorPicker,        ║
    ║    Dropdown, Label, Section, Paragraph                  ║
    ║  • نظام إشعارات + نظام مفتاح                             ║
    ║  • حفظ/تحميل الإعدادات                                   ║
    ║  • نافذة قابلة للسحب والتصغير والتخصيص                  ║
    ║  • ButtonLike (تعديل زوايا الأزرار)                      ║
    ║  • Layout (ترتيب الأقسام أفقي/عمودي/شبكة)               ║
    ╚══════════════════════════════════════════════════════════╝
    
    الرخصة: MIT
    الاستخدام:
        local RayUI = loadstring(game:HttpGet("RAW_URL"))()
]]

-- ============================================================
-- الخدمات
-- ============================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- ============================================================
-- الجدول الرئيسي
-- ============================================================
local RayUI = {}
RayUI.__index = RayUI
RayUI.Version = "1.0"
RayUI._flags = {}
RayUI._configFile = "RayUI_Config.json"

-- ============================================================
-- الثيمات
-- ============================================================
RayUI.Themes = {
    Dark = {
        Background = Color3.fromRGB(30, 30, 30),
        Topbar = Color3.fromRGB(40, 40, 40),
        TabBar = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 180, 180),
        Accent = Color3.fromRGB(0, 150, 255),
        Button = Color3.fromRGB(50, 50, 50),
        ButtonHover = Color3.fromRGB(65, 65, 65),
        Input = Color3.fromRGB(20, 20, 20),
        ToggleOn = Color3.fromRGB(0, 200, 100),
        ToggleOff = Color3.fromRGB(70, 70, 70),
        Border = Color3.fromRGB(60, 60, 60),
    },
    VeryDark = {
        Background = Color3.fromRGB(12, 12, 12),
        Topbar = Color3.fromRGB(18, 18, 18),
        TabBar = Color3.fromRGB(8, 8, 8),
        Text = Color3.fromRGB(220, 220, 220),
        SubText = Color3.fromRGB(140, 140, 140),
        Accent = Color3.fromRGB(180, 0, 255),
        Button = Color3.fromRGB(25, 25, 25),
        ButtonHover = Color3.fromRGB(38, 38, 38),
        Input = Color3.fromRGB(5, 5, 5),
        ToggleOn = Color3.fromRGB(180, 0, 255),
        ToggleOff = Color3.fromRGB(40, 40, 40),
        Border = Color3.fromRGB(45, 45, 45),
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 240),
        Topbar = Color3.fromRGB(220, 220, 220),
        TabBar = Color3.fromRGB(200, 200, 200),
        Text = Color3.fromRGB(20, 20, 20),
        SubText = Color3.fromRGB(100, 100, 100),
        Accent = Color3.fromRGB(0, 120, 220),
        Button = Color3.fromRGB(210, 210, 210),
        ButtonHover = Color3.fromRGB(190, 190, 190),
        Input = Color3.fromRGB(255, 255, 255),
        ToggleOn = Color3.fromRGB(0, 180, 90),
        ToggleOff = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(160, 160, 160),
    },
    Ocean = {
        Background = Color3.fromRGB(10, 30, 50),
        Topbar = Color3.fromRGB(15, 40, 65),
        TabBar = Color3.fromRGB(8, 22, 38),
        Text = Color3.fromRGB(200, 230, 255),
        SubText = Color3.fromRGB(130, 180, 220),
        Accent = Color3.fromRGB(0, 200, 220),
        Button = Color3.fromRGB(25, 60, 90),
        ButtonHover = Color3.fromRGB(35, 80, 115),
        Input = Color3.fromRGB(5, 15, 25),
        ToggleOn = Color3.fromRGB(0, 220, 200),
        ToggleOff = Color3.fromRGB(40, 70, 95),
        Border = Color3.fromRGB(40, 90, 130),
    },
    Blood = {
        Background = Color3.fromRGB(20, 8, 8),
        Topbar = Color3.fromRGB(30, 10, 10),
        TabBar = Color3.fromRGB(15, 5, 5),
        Text = Color3.fromRGB(255, 220, 220),
        SubText = Color3.fromRGB(200, 150, 150),
        Accent = Color3.fromRGB(220, 20, 20),
        Button = Color3.fromRGB(50, 15, 15),
        ButtonHover = Color3.fromRGB(70, 20, 20),
        Input = Color3.fromRGB(10, 3, 3),
        ToggleOn = Color3.fromRGB(220, 30, 30),
        ToggleOff = Color3.fromRGB(60, 30, 30),
        Border = Color3.fromRGB(90, 25, 25),
    },
    Neon = {
        Background = Color3.fromRGB(15, 10, 30),
        Topbar = Color3.fromRGB(25, 15, 45),
        TabBar = Color3.fromRGB(10, 8, 22),
        Text = Color3.fromRGB(240, 220, 255),
        SubText = Color3.fromRGB(180, 150, 220),
        Accent = Color3.fromRGB(255, 0, 200),
        Button = Color3.fromRGB(40, 25, 70),
        ButtonHover = Color3.fromRGB(55, 35, 95),
        Input = Color3.fromRGB(8, 5, 18),
        ToggleOn = Color3.fromRGB(0, 255, 180),
        ToggleOff = Color3.fromRGB(50, 35, 80),
        Border = Color3.fromRGB(80, 50, 130),
    },
    Forest = {
        Background = Color3.fromRGB(20, 30, 20),
        Topbar = Color3.fromRGB(28, 40, 28),
        TabBar = Color3.fromRGB(15, 22, 15),
        Text = Color3.fromRGB(220, 255, 220),
        SubText = Color3.fromRGB(160, 200, 160),
        Accent = Color3.fromRGB(60, 200, 80),
        Button = Color3.fromRGB(40, 60, 40),
        ButtonHover = Color3.fromRGB(55, 80, 55),
        Input = Color3.fromRGB(10, 18, 10),
        ToggleOn = Color3.fromRGB(60, 200, 80),
        ToggleOff = Color3.fromRGB(45, 65, 45),
        Border = Color3.fromRGB(70, 100, 70),
    },
}

RayUI.CurrentTheme = RayUI.Themes.Dark
RayUI.ThemeName = "Dark"

-- ============================================================
-- دوال مساعدة
-- ============================================================
local function Create(className, props, parent)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    if parent then obj.Parent = parent end
    return obj
end

local function Tween(obj, time, goal, style, dir)
    local info = TweenInfo.new(
        time or 0.2,
        style or Enum.EasingStyle.Quad,
        dir or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, goal)
    t:Play()
    return t
end

local function Corner(parent, radius)
    return Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 6)
    }, parent)
end

local function Stroke(parent, color, thickness, transparency)
    return Create("UIStroke", {
        Color = color or Color3.fromRGB(60, 60, 60),
        Thickness = thickness or 1,
        Transparency = transparency or 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end

local function GetGuiParent()
    local ok, result = pcall(function()
        if CoreGui:FindFirstChild("RayUI") then
            CoreGui.RayUI:Destroy()
        end
        return CoreGui
    end)
    if ok then return result end
    if LocalPlayer:FindFirstChild("PlayerGui") then
        return LocalPlayer.PlayerGui
    end
    return CoreGui
end

-- ============================================================
-- Boot Screens
-- ============================================================
RayUI.BootTypes = {
    PRO_MAX = "Pro Max",
    XT = "Xt",
    DOW = "Dow",
    RAY = "Ray",
}

function RayUI:PlayBootProMax(scriptName, duration)
    scriptName = scriptName or "RayUI"
    duration = duration or 3

    local gui = Create("ScreenGui", {
        Name = "RayUI_Boot",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999,
    }, GetGuiParent())

    local bg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }, gui)

    local nameLabel = Create("TextLabel", {
        Size = UDim2.new(0, 400, 0, 60),
        Position = UDim2.new(0.5, -200, 0.5, -80),
        BackgroundTransparency = 1,
        Text = scriptName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 42,
    }, bg)

    local ringHolder = Create("Frame", {
        Size = UDim2.new(0, 80, 0, 80),
        Position = UDim2.new(0.5, -40, 0.5, 20),
        BackgroundTransparency = 1,
    }, bg)

    local ringBg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
    }, ringHolder)
    Corner(ringBg, 40)

    local spinningRing = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 150, 255),
        BorderSizePixel = 0,
    }, ringHolder)
    Corner(spinningRing, 40)

    Create("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(0.75, 1),
            NumberSequenceKeypoint.new(1, 1),
        }),
    }, spinningRing)

    local centerHole = Create("Frame", {
        Size = UDim2.new(0.7, 0, 0.7, 0),
        Position = UDim2.new(0.15, 0, 0.15, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }, ringHolder)
    Corner(centerHole, 30)

    local spin = RunService.RenderStepped:Connect(function()
        spinningRing.Rotation = (spinningRing.Rotation + 5) % 360
    end)

    task.spawn(function()
        task.wait(duration)
        spin:Disconnect()
        nameLabel.Text = "اكتمل تحميل " .. scriptName
        nameLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
        Tween(spinningRing, 0.3, {BackgroundColor3 = Color3.fromRGB(0, 255, 100)})
        task.wait(0.8)
        Tween(bg, 0.5, {BackgroundTransparency = 1})
        Tween(nameLabel, 0.5, {TextTransparency = 1})
        Tween(ringHolder, 0.5, {BackgroundTransparency = 1})
        task.wait(0.5)
        gui:Destroy()
    end)
end

function RayUI:PlayBootXt(scriptName, duration)
    scriptName = scriptName or "RayUI"
    duration = duration or 3

    local gui = Create("ScreenGui", {
        Name = "RayUI_Boot",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 999,
    }, GetGuiParent())

    local bg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }, gui)

    local glowLayers = {}
    local baseText = Create("TextLabel", {
        Size = UDim2.new(0, 500, 0, 80),
        Position = UDim2.new(0.5, -250, 0.5, -40),
        BackgroundTransparency = 1,
        Text = scriptName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 48,
        ZIndex = 2,
    }, bg)

    for i = 1, 6 do
        local glow = Create("TextLabel", {
            Size = UDim2.new(0, 500, 0, 80),
            Position = UDim2.new(0.5, -250, 0.5, -40),
            BackgroundTransparency = 1,
            Text = scriptName,
            TextColor3 = Color3.fromRGB(0, 200, 255),
            Font = Enum.Font.GothamBold,
            TextSize = 48 + i * 4,
            TextTransparency = 0.3 + i * 0.1,
            ZIndex = 1,
        }, bg)
        table.insert(glowLayers, glow)
    end

    local pulse = true
    local pulseConn
    pulseConn = RunService.Heartbeat:Connect(function()
        if not pulse then return end
        local t = tick()
        local alpha = (math.sin(t * 3) + 1) / 2
        for i, glow in ipairs(glowLayers) do
            glow.TextTransparency = 0.6 - alpha * 0.3 + i * 0.05
            glow.TextColor3 = Color3.fromRGB(0, 150 + alpha * 105, 200 + alpha * 55)
        end
    end)

    task.spawn(function()
        task.wait(duration)
        pulse = false
        pulseConn:Disconnect()
        Tween(baseText, 0.4, {TextColor3 = Color3.fromRGB(0, 255, 150), TextSize = 56})
        for _, g in ipairs(glowLayers) do
            Tween(g, 0.4, {TextTransparency = 1})
        end
        task.wait(0.6)
        Tween(bg, 0.5, {BackgroundTransparency = 1})
        Tween(baseText, 0.5, {TextTransparency = 1})
        task.wait(0.5)
        gui:Destroy()
    end)
end

function RayUI:PlayBootDow(scriptName, duration)
    scriptName = scriptName or "RayUI"
    duration = duration or 3

    local gui = Create("ScreenGui", {
        Name = "RayUI_Boot",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 999,
    }, GetGuiParent())

    local bg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(8, 8, 12),
        BorderSizePixel = 0,
    }, gui)

    local nameLabel = Create("TextLabel", {
        Size = UDim2.new(0, 400, 0, 50),
        Position = UDim2.new(0.5, -200, 0.5, -70),
        BackgroundTransparency = 1,
        Text = scriptName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 36,
    }, bg)

    local barBg = Create("Frame", {
        Size = UDim2.new(0, 400, 0, 10),
        Position = UDim2.new(0.5, -200, 0.5, 10),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
    }, bg)
    Corner(barBg, 5)

    local barFill = Create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 150, 255),
        BorderSizePixel = 0,
    }, barBg)
    Corner(barFill, 5)

    local percentLabel = Create("TextLabel", {
        Size = UDim2.new(0, 400, 0, 25),
        Position = UDim2.new(0.5, -200, 0.5, 30),
        BackgroundTransparency = 1,
        Text = "0%",
        TextColor3 = Color3.fromRGB(180, 180, 180),
        Font = Enum.Font.Gotham,
        TextSize = 16,
    }, bg)

    local progress = 0
    local conn
    conn = RunService.Heartbeat:Connect(function(dt)
        progress = math.min(progress + dt / duration, 1)
        barFill.Size = UDim2.new(progress, 0, 1, 0)
        percentLabel.Text = math.floor(progress * 100) .. "%"
        if progress >= 1 then
            conn:Disconnect()
            nameLabel.Text = "اكتمل التحميل ✔"
            nameLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.6)
            Tween(bg, 0.5, {BackgroundTransparency = 1})
            Tween(nameLabel, 0.5, {TextTransparency = 1})
            Tween(barBg, 0.5, {BackgroundTransparency = 1})
            Tween(barFill, 0.5, {BackgroundTransparency = 1})
            Tween(percentLabel, 0.5, {TextTransparency = 1})
            task.wait(0.5)
            gui:Destroy()
        end
    end)
end

function RayUI:PlayBootRay(scriptName, duration)
    scriptName = scriptName or "RayUI"
    duration = duration or 3

    local gui = Create("ScreenGui", {
        Name = "RayUI_Boot",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 999,
    }, GetGuiParent())

    local bg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }, gui)

    local logo = Create("Frame", {
        Size = UDim2.new(0, 120, 0, 120),
        Position = UDim2.new(0.5, -60, 0.4, -60),
        BackgroundColor3 = Color3.fromRGB(0, 150, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
    }, bg)
    Corner(logo, 60)

    local logoText = Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "R",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 64,
        TextTransparency = 1,
    }, logo)

    local nameLabel = Create("TextLabel", {
        Size = UDim2.new(0, 400, 0, 50),
        Position = UDim2.new(0.5, -200, 0.4, 80),
        BackgroundTransparency = 1,
        Text = scriptName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 36,
        TextTransparency = 1,
    }, bg)

    Tween(logo, 0.6, {BackgroundTransparency = 0})
    Tween(logoText, 0.6, {TextTransparency = 0})
    task.wait(0.5)
    Tween(nameLabel, 0.6, {TextTransparency = 0})

    task.wait(math.max(0, duration - 1.2))
    Tween(bg, 0.5, {BackgroundTransparency = 1})
    Tween(logo, 0.5, {BackgroundTransparency = 1})
    Tween(logoText, 0.5, {TextTransparency = 1})
    Tween(nameLabel, 0.5, {TextTransparency = 1})
    task.wait(0.5)
    gui:Destroy()
end

function RayUI:PlayBoot(bootType, scriptName, duration)
    if bootType == "Pro Max" then
        self:PlayBootProMax(scriptName, duration)
    elseif bootType == "Xt" then
        self:PlayBootXt(scriptName, duration)
    elseif bootType == "Dow" then
        self:PlayBootDow(scriptName, duration)
    elseif bootType == "Ray" then
        self:PlayBootRay(scriptName, duration)
    else
        warn("RayUI: Boot type غير معروف: " .. tostring(bootType))
    end
end

-- ============================================================
-- Notifications
-- ============================================================
function RayUI:Notify(title, content, duration)
    duration = duration or 4
    local parentGui = GetGuiParent()
    local notifGui = parentGui:FindFirstChild("RayUI_Notifications")
    if not notifGui then
        notifGui = Create("ScreenGui", {
            Name = "RayUI_Notifications",
            ResetOnSpawn = false,
            DisplayOrder = 9999,
        }, parentGui)
    end

    local holder = notifGui:FindFirstChild("Holder")
    if not holder then
        holder = Create("Frame", {
            Name = "Holder",
            Size = UDim2.new(0, 300, 1, -40),
            Position = UDim2.new(1, -320, 0, 20),
            BackgroundTransparency = 1,
        }, notifGui)
        Create("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }, holder)
    end

    local notif = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = self.CurrentTheme.Background,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Position = UDim2.new(1, 0, 0, 0),
    }, holder)
    Corner(notif, 8)
    Stroke(notif, self.CurrentTheme.Accent, 1, 0)

    local sideBar = Create("Frame", {
        Size = UDim2.new(0, 4, 1, 0),
        BackgroundColor3 = self.CurrentTheme.Accent,
        BorderSizePixel = 0,
    }, notif)
    Corner(sideBar, 4)

    local titleLbl = Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 24),
        Position = UDim2.new(0, 12, 0, 8),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = self.CurrentTheme.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = 1,
    }, notif)

    local contentLbl = Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 34),
        Position = UDim2.new(0, 12, 0, 32),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = self.CurrentTheme.SubText,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        TextTransparency = 1,
    }, notif)

    Tween(notif, 0.3, {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)})
    Tween(titleLbl, 0.3, {TextTransparency = 0})
    Tween(contentLbl, 0.3, {TextTransparency = 0})

    task.spawn(function()
        task.wait(duration)
        Tween(notif, 0.3, {BackgroundTransparency = 1, Position = UDim2.new(1, 0, 0, 0)})
        Tween(titleLbl, 0.3, {TextTransparency = 1})
        Tween(contentLbl, 0.3, {TextTransparency = 1})
        task.wait(0.35)
        notif:Destroy()
    end)
end

-- ============================================================
-- Key System
-- ============================================================
function RayUI:KeySystem(config)
    return task.spawn(function()
        local gui = Create("ScreenGui", {
            Name = "RayUI_Key",
            ResetOnSpawn = false,
            DisplayOrder = 10000,
        }, GetGuiParent())

        local bg = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
        }, gui)

        local box = Create("Frame", {
            Size = UDim2.new(0, 400, 0, 260),
            Position = UDim2.new(0.5, -200, 0.5, -130),
            BackgroundColor3 = self.CurrentTheme.Background,
            BorderSizePixel = 0,
        }, bg)
        Corner(box, 10)
        Stroke(box, self.CurrentTheme.Accent, 1, 0)

        Create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 40),
            Position = UDim2.new(0, 0, 0, 15),
            BackgroundTransparency = 1,
            Text = config.Title or "🔒 مطلوب مفتاح",
            TextColor3 = self.CurrentTheme.Text,
            Font = Enum.Font.GothamBold,
            TextSize = 20,
        }, box)

        Create("TextLabel", {
            Size = UDim2.new(1, -40, 0, 50),
            Position = UDim2.new(0, 20, 0, 55),
            BackgroundTransparency = 1,
            Text = config.Description or "الرجاء إدخال المفتاح للمتابعة",
            TextColor3 = self.CurrentTheme.SubText,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            TextWrapped = true,
        }, box)

        local inputBox = Create("Frame", {
            Size = UDim2.new(1, -40, 0, 40),
            Position = UDim2.new(0, 20, 0, 120),
            BackgroundColor3 = self.CurrentTheme.Input,
            BorderSizePixel = 0,
        }, box)
        Corner(inputBox, 6)
        Stroke(inputBox, self.CurrentTheme.Border, 1, 0.3)

        local textBox = Create("TextBox", {
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            PlaceholderText = "المفتاح هنا...",
            Text = "",
            TextColor3 = self.CurrentTheme.Text,
            PlaceholderColor3 = self.CurrentTheme.SubText,
            Font = Enum.Font.Gotham,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, inputBox)

        local submitBtn = Create("TextButton", {
            Size = UDim2.new(1, -40, 0, 40),
            Position = UDim2.new(0, 20, 0, 175),
            BackgroundColor3 = self.CurrentTheme.Accent,
            Text = "تأكيد",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            BorderSizePixel = 0,
        }, box)
        Corner(submitBtn, 6)

        local statusLbl = Create("TextLabel", {
            Size = UDim2.new(1, -40, 0, 25),
            Position = UDim2.new(0, 20, 0, 222),
            BackgroundTransparency = 1,
            Text = "",
            TextColor3 = Color3.fromRGB(255, 80, 80),
            Font = Enum.Font.Gotham,
            TextSize = 12,
        }, box)

        submitBtn.MouseButton1Click:Connect(function()
            if textBox.Text == config.Key then
                statusLbl.TextColor3 = Color3.fromRGB(0, 255, 100)
                statusLbl.Text = "✔ تم التحقق بنجاح"
                task.wait(0.5)
                gui:Destroy()
                if config.OnSuccess then config.OnSuccess() end
            else
                statusLbl.TextColor3 = Color3.fromRGB(255, 80, 80)
                statusLbl.Text = "✖ مفتاح غير صحيح"
            end
        end)
    end)
end

-- ============================================================
-- Config Saving
-- ============================================================
function RayUI:SetFlag(name, value)
    self._flags[name] = value
end

function RayUI:GetFlag(name)
    return self._flags[name]
end

function RayUI:SaveConfig(filename)
    filename = filename or self._configFile
    local data = HttpService:JSONEncode(self._flags)
    if writefile then
        pcall(function() writefile(filename, data) end)
    else
        warn("RayUI: writefile غير متاح")
    end
end

function RayUI:LoadConfig(filename)
    filename = filename or self._configFile
    if isfile and isfile(filename) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(filename))
        end)
        if ok and data then
            for k, v in pairs(data) do
                self._flags[k] = v
            end
        end
    end
end

function RayUI:ClearConfig(filename)
    filename = filename or self._configFile
    if delfile and isfile(filename) then
        pcall(function() delfile(filename) end)
    end
    self._flags = {}
end

-- ============================================================
-- CreateWindow
-- ============================================================
function RayUI:CreateWindow(config)
    config = config or {}

    if config.Theme and self.Themes[config.Theme] then
        self.CurrentTheme = self.Themes[config.Theme]
        self.ThemeName = config.Theme
    end

    local theme = self.CurrentTheme

    local window = {
        Tabs = {},
        ActiveTab = nil,
        Flags = {},
    }
    setmetatable(window, {__index = self})

    local size = config.Size or UDim2.new(0, 550, 0, 400)
    local pos = config.Position or UDim2.new(0.5, -275, 0.5, -200)

    local gui = Create("ScreenGui", {
        Name = "RayUI",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 100,
    }, GetGuiParent())

    local main = Create("Frame", {
        Size = size,
        Position = pos,
        BackgroundColor3 = theme.Background,
        BorderSizePixel = 0,
    }, gui)
    Corner(main, config.CornerRadius or 10)
    Stroke(main, theme.Border, 1, 0.3)

    local topbar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = theme.Topbar,
        BorderSizePixel = 0,
    }, main)
    Corner(topbar, config.CornerRadius or 10)

    Create("Frame", {
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 1, -10),
        BackgroundColor3 = theme.Topbar,
        BorderSizePixel = 0,
    }, topbar)

    local titleLbl = Create("TextLabel", {
        Size = UDim2.new(1, -120, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Title or "RayUI",
        TextColor3 = theme.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, topbar)

    local closeBtn = Create("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -38, 0, 5),
        BackgroundColor3 = Color3.fromRGB(220, 50, 50),
        Text = "✕",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        BorderSizePixel = 0,
    }, topbar)
    Corner(closeBtn, 6)

    closeBtn.MouseButton1Click:Connect(function()
        Tween(main, 0.2, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
        task.wait(0.25)
        gui:Destroy()
    end)

    local minBtn = Create("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -72, 0, 5),
        BackgroundColor3 = Color3.fromRGB(255, 180, 0),
        Text = "—",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        BorderSizePixel = 0,
    }, topbar)
    Corner(minBtn, 6)

    local minimized = false
    local normalSize = size
    local normalPos = pos
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(main, 0.2, {Size = UDim2.new(0, 550, 0, 40), Position = UDim2.new(0.5, -275, 1, -40)})
        else
            Tween(main, 0.2, {Size = normalSize, Position = normalPos})
        end
    end)

    local dragging = false
    local dragStart, startPos

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    local tabbar = Create("Frame", {
        Size = UDim2.new(0, 130, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundColor3 = theme.TabBar,
        BorderSizePixel = 0,
    }, main)

    local tabList = Create("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    }, tabbar)

    Create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, tabList)

    Create("UIPadding", {
        PaddingTop = UDim.new(0, 6),
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 6),
    }, tabList)

    local content = Create("Frame", {
        Size = UDim2.new(1, -130, 1, -40),
        Position = UDim2.new(0, 130, 0, 40),
        BackgroundTransparency = 1,
    }, main)

    window.Gui = gui
    window.Main = main
    window.Topbar = topbar
    window.TabBar = tabbar
    window.TabList = tabList
    window.Content = content
    window.Theme = theme
    window.TitleLabel = titleLbl

    function window:SetTheme(themeName)
        if not RayUI.Themes[themeName] then
            warn("RayUI: ثيم غير موجود: " .. themeName)
            return
        end
        RayUI.CurrentTheme = RayUI.Themes[themeName]
        RayUI.ThemeName = themeName
        self.Theme = RayUI.CurrentTheme
        self:ApplyTheme()
    end

    function window:ApplyTheme()
        local t = RayUI.CurrentTheme
        self.Main.BackgroundColor3 = t.Background
        self.Topbar.BackgroundColor3 = t.Topbar
        self.TabBar.BackgroundColor3 = t.TabBar
        self.TitleLabel.TextColor3 = t.Text
        for _, tab in pairs(self.Tabs) do
            if tab.Button then
                tab.Button.BackgroundColor3 = t.TabBar
                tab.Button.TextColor3 = t.Text
            end
            if tab.Button and self.ActiveTab == tab then
                tab.Button.BackgroundColor3 = t.Accent
            end
        end
    end

    function window:SetAccentColor(color)
        RayUI.CurrentTheme.Accent = color
        self:ApplyTheme()
    end

    function window:SetBackgroundColor(color)
        RayUI.CurrentTheme.Background = color
        self.Main.BackgroundColor3 = color
    end

    function window:AddTab(name, icon)
        local tab = {
            Name = name,
            Elements = {},
            Layout = "Vertical",
        }

        local btn = Create("TextButton", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = RayUI.CurrentTheme.TabBar,
            Text = name,
            TextColor3 = RayUI.CurrentTheme.Text,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            BorderSizePixel = 0,
            AutoButtonColor = false,
        }, tabList)
        Corner(btn, 6)
        tab.Button = btn

        local page = Create("ScrollingFrame", {
            Size = UDim2.new(1, -10, 1, -10),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = RayUI.CurrentTheme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
        }, content)
        tab.Page = page

        Create("UIListLayout", {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }, page)

        Create("UIPadding", {
            PaddingTop = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        }, page)

        btn.MouseButton1Click:Connect(function()
            for _, t in pairs(self.Tabs) do
                t.Page.Visible = false
                t.Button.BackgroundColor3 = RayUI.CurrentTheme.TabBar
            end
            page.Visible = true
            btn.BackgroundColor3 = RayUI.CurrentTheme.Accent
            self.ActiveTab = tab
        end)

        table.insert(self.Tabs, tab)
        if not self.ActiveTab then
            self.ActiveTab = tab
            page.Visible = true
            btn.BackgroundColor3 = RayUI.CurrentTheme.Accent
        end

        return tab
    end

    return window
end

-- ============================================================
-- عناصر الواجهة
-- ============================================================

local function MakeContainer(tab)
    local frame = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 30),
        BackgroundColor3 = RayUI.CurrentTheme.Button,
        BorderSizePixel = 0,
    }, tab.Page)
    Corner(frame, 6)
    Stroke(frame, RayUI.CurrentTheme.Border, 1, 0.5)
    return frame
end

-- Button
function RayUI:AddButton(tab, config)
    config = config or {}
    local cornerR = config.CornerRadius or 6

    local btn = Create("TextButton", {
        Size = UDim2.new(1, -10, 0, 32),
        BackgroundColor3 = RayUI.CurrentTheme.Button,
        Text = config.Name or "زر",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        BorderSizePixel = 0,
        AutoButtonColor = false,
    }, tab.Page)
    Corner(btn, cornerR)
    Stroke(btn, RayUI.CurrentTheme.Border, 1, 0.5)

    btn.MouseEnter:Connect(function()
        Tween(btn, 0.15, {BackgroundColor3 = RayUI.CurrentTheme.ButtonHover})
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, 0.15, {BackgroundColor3 = RayUI.CurrentTheme.Button})
    end)
    btn.MouseButton1Click:Connect(function()
        if config.Callback then
            local ok, err = pcall(config.Callback)
            if not ok then warn("RayUI Button Error: " .. tostring(err)) end
        end
    end)

    return { Button = btn }
end

-- Toggle
function RayUI:AddToggle(tab, config)
    config = config or {}
    local flag = config.Flag or config.Name or "toggle_" .. tostring(tick())
    local value = RayUI._flags[flag]
    if value == nil then value = config.Default or false end

    local container = MakeContainer(tab)

    Create("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Name or "خيار",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    local toggleBg = Create("Frame", {
        Size = UDim2.new(0, 36, 0, 18),
        Position = UDim2.new(1, -46, 0.5, -9),
        BackgroundColor3 = value and RayUI.CurrentTheme.ToggleOn or RayUI.CurrentTheme.ToggleOff,
        BorderSizePixel = 0,
    }, container)
    Corner(toggleBg, 9)

    local knob = Create("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, value and 20 or 2, 0.5, -7),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
    }, toggleBg)
    Corner(knob, 7)

    local clickArea = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
    }, container)

    local function setValue(v, silent)
        value = v
        RayUI._flags[flag] = v
        Tween(toggleBg, 0.15, {BackgroundColor3 = v and RayUI.CurrentTheme.ToggleOn or RayUI.CurrentTheme.ToggleOff})
        Tween(knob, 0.15, {Position = UDim2.new(0, v and 20 or 2, 0.5, -7)})
        if not silent and config.Callback then
            local ok, err = pcall(config.Callback, v)
            if not ok then warn("RayUI Toggle Error: " .. tostring(err)) end
        end
    end

    clickArea.MouseButton1Click:Connect(function()
        setValue(not value)
    end)

    return {
        Set = setValue,
        Get = function() return value end,
        Flag = flag,
    }
end

-- Slider
function RayUI:AddSlider(tab, config)
    config = config or {}
    local flag = config.Flag or config.Name or "slider_" .. tostring(tick())
    local minV = config.Min or 0
    local maxV = config.Max or 100
    local value = RayUI._flags[flag] or config.Default or minV
    local suffix = config.Suffix or ""

    local container = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 50),
        BackgroundColor3 = RayUI.CurrentTheme.Button,
        BorderSizePixel = 0,
    }, tab.Page)
    Corner(container, 6)
    Stroke(container, RayUI.CurrentTheme.Border, 1, 0.5)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 0, 22),
        Position = UDim2.new(0, 10, 0, 4),
        BackgroundTransparency = 1,
        Text = config.Name or "سلايدر",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    local valueLbl = Create("TextLabel", {
        Size = UDim2.new(0, 70, 0, 22),
        Position = UDim2.new(1, -80, 0, 4),
        BackgroundTransparency = 1,
        Text = tostring(value) .. suffix,
        TextColor3 = RayUI.CurrentTheme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, container)

    local barBg = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 6),
        Position = UDim2.new(0, 10, 0, 34),
        BackgroundColor3 = RayUI.CurrentTheme.Input,
        BorderSizePixel = 0,
    }, container)
    Corner(barBg, 3)

    local fill = Create("Frame", {
        Size = UDim2.new((value - minV) / (maxV - minV), 0, 1, 0),
        BackgroundColor3 = RayUI.CurrentTheme.Accent,
        BorderSizePixel = 0,
    }, barBg)
    Corner(fill, 3)

    local knob = Create("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new((value - minV) / (maxV - minV), -7, 0.5, -7),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
    }, barBg)
    Corner(knob, 7)
    Stroke(knob, RayUI.CurrentTheme.Accent, 2, 0)

    local dragging = false

    local function updateFromInput(inputX)
        local rel = (inputX - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X
        rel = math.clamp(rel, 0, 1)
        local newVal = minV + rel * (maxV - minV)
        if config.Round then newVal = math.floor(newVal + 0.5) end
        value = newVal
        RayUI._flags[flag] = value
        fill.Size = UDim2.new(rel, 0, 1, 0)
        knob.Position = UDim2.new(rel, -7, 0.5, -7)
        valueLbl.Text = tostring(math.floor(value * 100) / 100) .. suffix
        if config.Callback then pcall(config.Callback, value) end
    end

    barBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromInput(input.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return {
        Set = function(v)
            v = math.clamp(v, minV, maxV)
            local rel = (v - minV) / (maxV - minV)
            value = v
            RayUI._flags[flag] = v
            fill.Size = UDim2.new(rel, 0, 1, 0)
            knob.Position = UDim2.new(rel, -7, 0.5, -7)
            valueLbl.Text = tostring(v) .. suffix
        end,
        Get = function() return value end,
        Flag = flag,
    }
end

-- Textbox
function RayUI:AddTextbox(tab, config)
    config = config or {}
    local flag = config.Flag or config.Name or "textbox_" .. tostring(tick())
    local value = RayUI._flags[flag] or config.Default or ""

    local container = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 60),
        BackgroundColor3 = RayUI.CurrentTheme.Button,
        BorderSizePixel = 0,
    }, tab.Page)
    Corner(container, 6)
    Stroke(container, RayUI.CurrentTheme.Border, 1, 0.5)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 22),
        Position = UDim2.new(0, 10, 0, 4),
        BackgroundTransparency = 1,
        Text = config.Name or "نص",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    local inputBg = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 26),
        Position = UDim2.new(0, 10, 0, 28),
        BackgroundColor3 = RayUI.CurrentTheme.Input,
        BorderSizePixel = 0,
    }, container)
    Corner(inputBg, 4)
    Stroke(inputBg, RayUI.CurrentTheme.Border, 1, 0.5)

    local textBox = Create("TextBox", {
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        Text = value,
        PlaceholderText = config.Placeholder or "اكتب هنا...",
        TextColor3 = RayUI.CurrentTheme.Text,
        PlaceholderColor3 = RayUI.CurrentTheme.SubText,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    }, inputBg)

    textBox.FocusLost:Connect(function()
        value = textBox.Text
        RayUI._flags[flag] = value
        if config.Callback then pcall(config.Callback, value) end
    end)

    return {
        Set = function(v) textBox.Text = v; value = v; RayUI._flags[flag] = v end,
        Get = function() return textBox.Text end,
        Flag = flag,
    }
end

-- ColorPicker
function RayUI:AddColorPicker(tab, config)
    config = config or {}
    local flag = config.Flag or config.Name or "color_" .. tostring(tick())
    local currentColor = RayUI._flags[flag] or config.Default or Color3.fromRGB(255, 0, 0)

    local container = MakeContainer(tab)

    Create("TextLabel", {
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Name or "لون",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    local colorPreview = Create("Frame", {
        Size = UDim2.new(0, 50, 0, 20),
        Position = UDim2.new(1, -60, 0.5, -10),
        BackgroundColor3 = currentColor,
        BorderSizePixel = 0,
    }, container)
    Corner(colorPreview, 4)
    Stroke(colorPreview, RayUI.CurrentTheme.Border, 1, 0)

    local clickArea = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
    }, container)

    clickArea.MouseButton1Click:Connect(function()
        local pickerGui = Create("ScreenGui", {
            Name = "RayUI_ColorPicker",
            ResetOnSpawn = false,
            DisplayOrder = 10001,
        }, GetGuiParent())

        local pickerBg = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
        }, pickerGui)

        local picker = Create("Frame", {
            Size = UDim2.new(0, 260, 0, 300),
            Position = UDim2.new(0.5, -130, 0.5, -150),
            BackgroundColor3 = RayUI.CurrentTheme.Background,
            BorderSizePixel = 0,
        }, pickerBg)
        Corner(picker, 10)
        Stroke(picker, RayUI.CurrentTheme.Accent, 1, 0)

        local hsvFrame = Create("Frame", {
            Size = UDim2.new(1, -20, 0, 180),
            Position = UDim2.new(0, 10, 0, 10),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            BorderSizePixel = 0,
        }, picker)
        Corner(hsvFrame, 4)

        local satOverlay = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
        }, hsvFrame)
        Create("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1),
            }),
            Rotation = 0,
        }, satOverlay)

        local valOverlay = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
        }, hsvFrame)
        Create("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 0),
            }),
            Rotation = 90,
        }, valOverlay)

        local cursor = Create("Frame", {
            Size = UDim2.new(0, 10, 0, 10),
            Position = UDim2.new(0.5, -5, 0.5, -5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
        }, hsvFrame)
        Corner(cursor, 5)
        Stroke(cursor, Color3.fromRGB(0, 0, 0), 1, 0)

        local hueBg = Create("Frame", {
            Size = UDim2.new(1, -20, 0, 15),
            Position = UDim2.new(0, 10, 0, 200),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            BorderSizePixel = 0,
        }, picker)
        Corner(hueBg, 4)

        Create("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
            }),
        }, hueBg)

        local hueKnob = Create("Frame", {
            Size = UDim2.new(0, 6, 0, 15),
            Position = UDim2.new(0, -3, 0, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
        }, hueBg)
        Corner(hueKnob, 3)
        Stroke(hueKnob, Color3.fromRGB(0, 0, 0), 1, 0)

        local preview = Create("Frame", {
            Size = UDim2.new(0, 80, 0, 30),
            Position = UDim2.new(0, 10, 1, -45),
            BackgroundColor3 = currentColor,
            BorderSizePixel = 0,
        }, picker)
        Corner(preview, 4)
        Stroke(preview, RayUI.CurrentTheme.Border, 1, 0)

        local confirmBtn = Create("TextButton", {
            Size = UDim2.new(0, 140, 0, 30),
            Position = UDim2.new(1, -150, 1, -45),
            BackgroundColor3 = RayUI.CurrentTheme.Accent,
            Text = "تأكيد",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            BorderSizePixel = 0,
        }, picker)
        Corner(confirmBtn, 4)

        local pickerHue = 0
        local pickerSat = 1
        local pickerVal = 1

        local function updateColor()
            local c = Color3.fromHSV(pickerHue, pickerSat, pickerVal)
            preview.BackgroundColor3 = c
            hsvFrame.BackgroundColor3 = Color3.fromHSV(pickerHue, 1, 1)
            currentColor = c
        end
        updateColor()

        local draggingHSV = false
        hsvFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingHSV = true
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if draggingHSV and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local relX = math.clamp((input.Position.X - hsvFrame.AbsolutePosition.X) / hsvFrame.AbsoluteSize.X, 0, 1)
                local relY = math.clamp((input.Position.Y - hsvFrame.AbsolutePosition.Y) / hsvFrame.AbsoluteSize.Y, 0, 1)
                pickerSat = relX
                pickerVal = 1 - relY
                cursor.Position = UDim2.new(relX, -5, relY, -5)
                updateColor()
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingHSV = false
            end
        end)

        local draggingHue = false
        hueBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingHue = true
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if draggingHue and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local rel = math.clamp((input.Position.X - hueBg.AbsolutePosition.X) / hueBg.AbsoluteSize.X, 0, 1)
                pickerHue = rel
                hueKnob.Position = UDim2.new(rel, -3, 0, 0)
                updateColor()
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingHue = false
            end
        end)

        confirmBtn.MouseButton1Click:Connect(function()
            colorPreview.BackgroundColor3 = currentColor
            RayUI._flags[flag] = currentColor
            if config.Callback then pcall(config.Callback, currentColor) end
            pickerGui:Destroy()
        end)
    end)

    return {
        Set = function(c) colorPreview.BackgroundColor3 = c; currentColor = c; RayUI._flags[flag] = c end,
        Get = function() return currentColor end,
        Flag = flag,
    }
end

-- Dropdown
function RayUI:AddDropdown(tab, config)
    config = config or {}
    local flag = config.Flag or config.Name or "dd_" .. tostring(tick())
    local options = config.Options or {}
    local value = RayUI._flags[flag] or config.Default or nil

    local container = MakeContainer(tab)
    container.Size = UDim2.new(1, -10, 0, 32)

    Create("TextLabel", {
        Size = UDim2.new(1, -90, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Name or "اختيار",
        TextColor3 = RayUI.CurrentTheme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    local valueLbl = Create("TextLabel", {
        Size = UDim2.new(0, 70, 1, 0),
        Position = UDim2.new(1, -80, 0, 0),
        BackgroundTransparency = 1,
        Text = value and tostring(value) or "▼",
        TextColor3 = RayUI.CurrentTheme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, container)

    local clickArea = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
    }, container)

    local open = false
    local dropdown

    clickArea.MouseButton1Click:Connect(function()
        open = not open
        if dropdown then dropdown:Destroy(); dropdown = nil end
        if not open then return end

        dropdown = Create("Frame", {
            Size = UDim2.new(1, 0, 0, math.min(#options * 26, 150)),
            Position = UDim2.new(0, 0, 1, 4),
            BackgroundColor3 = RayUI.CurrentTheme.Background,
            BorderSizePixel = 0,
            ZIndex = 10,
        }, container)
        Corner(dropdown, 6)
        Stroke(dropdown, RayUI.CurrentTheme.Accent, 1, 0.5)

        local list = Create("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = RayUI.CurrentTheme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
        }, dropdown)
        Create("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder}, list)
        Create("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4)}, list)

        for _, opt in ipairs(options) do
            local optBtn = Create("TextButton", {
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = RayUI.CurrentTheme.Button,
                Text = tostring(opt),
                TextColor3 = RayUI.CurrentTheme.Text,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                BorderSizePixel = 0,
                ZIndex = 11,
            }, list)
            Corner(optBtn, 4)

            optBtn.MouseButton1Click:Connect(function()
                value = opt
                RayUI._flags[flag] = opt
                valueLbl.Text = tostring(opt)
                open = false
                if dropdown then dropdown:Destroy(); dropdown = nil end
                if config.Callback then pcall(config.Callback, opt) end
            end)
        end
    end)

    return {
        Set = function(v) value = v; valueLbl.Text = tostring(v); RayUI._flags[flag] = v end,
        Get = function() return value end,
        Flag = flag,
    }
end

-- Label
function RayUI:AddLabel(tab, config)
    config = config or {}

    local container = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 28),
        BackgroundTransparency = 1,
    }, tab.Page)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = config.Text or "نص",
        TextColor3 = config.Color or RayUI.CurrentTheme.Text,
        Font = config.Bold and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextSize = config.Size or 13,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, container)

    return { Frame = container }
end

-- Section
function RayUI:AddSection(tab, config)
    config = config or {}

    local section = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 30),
        BackgroundColor3 = RayUI.CurrentTheme.Topbar,
        BorderSizePixel = 0,
    }, tab.Page)
    Corner(section, 6)
    Stroke(section, RayUI.CurrentTheme.Accent, 1, 0.5)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = config.Name or "قسم",
        TextColor3 = RayUI.CurrentTheme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, section)

    return { Frame = section }
end

-- Paragraph
function RayUI:AddParagraph(tab, config)
    config = config or {}

    local container = Create("Frame", {
        Size = UDim2.new(1, -10, 0, 50),
        BackgroundColor3 = RayUI.CurrentTheme.Button,
        BorderSizePixel = 0,
    }, tab.Page)
    Corner(container, 6)
    Stroke(container, RayUI.CurrentTheme.Border, 1, 0.5)

    if config.Title then
        Create("TextLabel", {
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.new(0, 10, 0, 4),
            BackgroundTransparency = 1,
            Text = config.Title,
            TextColor3 = RayUI.CurrentTheme.Text,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, container)
    end

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 24),
        Position = UDim2.new(0, 10, 0, config.Title and 24 or 8),
        BackgroundTransparency = 1,
        Text = config.Text or "",
        TextColor3 = RayUI.CurrentTheme.SubText,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    }, container)

    return { Frame = container }
end

-- ============================================================
-- دوال إضافية
-- ============================================================

function RayUI:SetLayout(tab, layoutType)
    local list = tab.Page:FindFirstChildWhichIsA("UIListLayout")
    if not list then return end
    if layoutType == "Horizontal" then
        list.FillDirection = Enum.FillDirection.Horizontal
    elseif layoutType == "Grid" then
        list.FillDirection = Enum.FillDirection.Horizontal
        list.Wraps = true
    else
        list.FillDirection = Enum.FillDirection.Vertical
    end
end

function RayUI:CreateFloatingButton(window, config)
    config = config or {}
    local btn = Create("TextButton", {
        Size = UDim2.new(0, 45, 0, 45),
        Position = UDim2.new(0, 20, 0.5, -22),
        BackgroundColor3 = RayUI.CurrentTheme.Accent,
        Text = config.Icon or "R",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        BorderSizePixel = 0,
        Visible = false,
    }, window.Gui)
    Corner(btn, 22)
    Stroke(btn, Color3.fromRGB(255, 255, 255), 1, 0.5)

    btn.MouseButton1Click:Connect(function()
        window.Gui.Enabled = not window.Gui.Enabled
    end)

    return btn
end

function RayUI:Destroy(window)
    if window and window.Gui then
        window.Gui:Destroy()
    end
end

-- ============================================================
-- تصدير
-- ============================================================
return RayUI
