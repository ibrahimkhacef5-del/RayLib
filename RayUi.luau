--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                       RayUI v4.0 (Library)                       ║
    ║              10 Themes + 10 Boot Screens + Elements -G           ║
    ╚══════════════════════════════════════════════════════════════════╝
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local RayUI = {}
RayUI.__index = RayUI
RayUI.Version = "4.0"
RayUI._flags = {}

-- الثيمات (10 ثيمات)
RayUI.Themes = {
    Dark = { Background = Color3.fromRGB(30, 30, 30), Topbar = Color3.fromRGB(40, 40, 40), TabBar = Color3.fromRGB(25, 25, 25), Text = Color3.fromRGB(255, 255, 255), SubText = Color3.fromRGB(180, 180, 180), Accent = Color3.fromRGB(0, 150, 255), Button = Color3.fromRGB(50, 50, 50), ButtonHover = Color3.fromRGB(65, 65, 65), Input = Color3.fromRGB(20, 20, 20), ToggleOn = Color3.fromRGB(0, 200, 100), ToggleOff = Color3.fromRGB(70, 70, 70), Border = Color3.fromRGB(60, 60, 60) },
    VeryDark = { Background = Color3.fromRGB(12, 12, 12), Topbar = Color3.fromRGB(18, 18, 18), TabBar = Color3.fromRGB(8, 8, 8), Text = Color3.fromRGB(220, 220, 220), SubText = Color3.fromRGB(140, 140, 140), Accent = Color3.fromRGB(180, 0, 255), Button = Color3.fromRGB(25, 25, 25), ButtonHover = Color3.fromRGB(38, 38, 38), Input = Color3.fromRGB(5, 5, 5), ToggleOn = Color3.fromRGB(180, 0, 255), ToggleOff = Color3.fromRGB(40, 40, 40), Border = Color3.fromRGB(45, 45, 45) },
    Light = { Background = Color3.fromRGB(240, 240, 240), Topbar = Color3.fromRGB(220, 220, 220), TabBar = Color3.fromRGB(200, 200, 200), Text = Color3.fromRGB(20, 20, 20), SubText = Color3.fromRGB(100, 100, 100), Accent = Color3.fromRGB(0, 120, 220), Button = Color3.fromRGB(210, 210, 210), ButtonHover = Color3.fromRGB(190, 190, 190), Input = Color3.fromRGB(255, 255, 255), ToggleOn = Color3.fromRGB(0, 180, 90), ToggleOff = Color3.fromRGB(180, 180, 180), Border = Color3.fromRGB(160, 160, 160) },
    Ocean = { Background = Color3.fromRGB(10, 30, 50), Topbar = Color3.fromRGB(15, 40, 65), TabBar = Color3.fromRGB(8, 22, 38), Text = Color3.fromRGB(200, 230, 255), SubText = Color3.fromRGB(130, 180, 220), Accent = Color3.fromRGB(0, 200, 220), Button = Color3.fromRGB(25, 60, 90), ButtonHover = Color3.fromRGB(35, 80, 115), Input = Color3.fromRGB(5, 15, 25), ToggleOn = Color3.fromRGB(0, 220, 200), ToggleOff = Color3.fromRGB(40, 70, 95), Border = Color3.fromRGB(40, 90, 130) },
    Blood = { Background = Color3.fromRGB(20, 8, 8), Topbar = Color3.fromRGB(30, 10, 10), TabBar = Color3.fromRGB(15, 5, 5), Text = Color3.fromRGB(255, 220, 220), SubText = Color3.fromRGB(200, 150, 150), Accent = Color3.fromRGB(220, 20, 20), Button = Color3.fromRGB(50, 15, 15), ButtonHover = Color3.fromRGB(70, 20, 20), Input = Color3.fromRGB(10, 3, 3), ToggleOn = Color3.fromRGB(220, 30, 30), ToggleOff = Color3.fromRGB(60, 30, 30), Border = Color3.fromRGB(90, 25, 25) },
    Neon = { Background = Color3.fromRGB(15, 10, 30), Topbar = Color3.fromRGB(25, 15, 45), TabBar = Color3.fromRGB(10, 8, 22), Text = Color3.fromRGB(240, 220, 255), SubText = Color3.fromRGB(180, 150, 220), Accent = Color3.fromRGB(255, 0, 200), Button = Color3.fromRGB(40, 25, 70), ButtonHover = Color3.fromRGB(55, 35, 95), Input = Color3.fromRGB(8, 5, 18), ToggleOn = Color3.fromRGB(0, 255, 180), ToggleOff = Color3.fromRGB(50, 35, 80), Border = Color3.fromRGB(80, 50, 130) },
    Forest = { Background = Color3.fromRGB(20, 30, 20), Topbar = Color3.fromRGB(28, 40, 28), TabBar = Color3.fromRGB(15, 22, 15), Text = Color3.fromRGB(220, 255, 220), SubText = Color3.fromRGB(160, 200, 160), Accent = Color3.fromRGB(60, 200, 80), Button = Color3.fromRGB(40, 60, 40), ButtonHover = Color3.fromRGB(55, 80, 55), Input = Color3.fromRGB(10, 18, 10), ToggleOn = Color3.fromRGB(60, 200, 80), ToggleOff = Color3.fromRGB(45, 65, 45), Border = Color3.fromRGB(70, 100, 70) },
    Cyberpunk = { Background = Color3.fromRGB(10, 10, 10), Topbar = Color3.fromRGB(15, 15, 15), TabBar = Color3.fromRGB(5, 5, 5), Text = Color3.fromRGB(255, 255, 0), SubText = Color3.fromRGB(150, 150, 0), Accent = Color3.fromRGB(255, 255, 0), Button = Color3.fromRGB(20, 20, 20), ButtonHover = Color3.fromRGB(35, 35, 0), Input = Color3.fromRGB(0, 0, 0), ToggleOn = Color3.fromRGB(255, 255, 0), ToggleOff = Color3.fromRGB(40, 40, 40), Border = Color3.fromRGB(255, 255, 0) },
    Sunset = { Background = Color3.fromRGB(45, 15, 25), Topbar = Color3.fromRGB(60, 20, 35), TabBar = Color3.fromRGB(30, 10, 18), Text = Color3.fromRGB(255, 220, 200), SubText = Color3.fromRGB(220, 160, 130), Accent = Color3.fromRGB(255, 100, 50), Button = Color3.fromRGB(70, 25, 40), ButtonHover = Color3.fromRGB(90, 35, 55), Input = Color3.fromRGB(20, 5, 10), ToggleOn = Color3.fromRGB(255, 180, 80), ToggleOff = Color3.fromRGB(80, 40, 50), Border = Color3.fromRGB(255, 120, 80) },
    Mint = { Background = Color3.fromRGB(15, 40, 30), Topbar = Color3.fromRGB(20, 55, 40), TabBar = Color3.fromRGB(10, 28, 22), Text = Color3.fromRGB(200, 255, 220), SubText = Color3.fromRGB(140, 220, 170), Accent = Color3.fromRGB(0, 255, 180), Button = Color3.fromRGB(25, 70, 55), ButtonHover = Color3.fromRGB(35, 95, 75), Input = Color3.fromRGB(5, 20, 15), ToggleOn = Color3.fromRGB(0, 255, 180), ToggleOff = Color3.fromRGB(40, 80, 70), Border = Color3.fromRGB(0, 200, 150) },
    Midnight = { Background = Color3.fromRGB(5, 5, 15), Topbar = Color3.fromRGB(10, 10, 25), TabBar = Color3.fromRGB(2, 2, 8), Text = Color3.fromRGB(200, 200, 255), SubText = Color3.fromRGB(120, 120, 180), Accent = Color3.fromRGB(100, 100, 255), Button = Color3.fromRGB(15, 15, 35), ButtonHover = Color3.fromRGB(25, 25, 50), Input = Color3.fromRGB(0, 0, 5), ToggleOn = Color3.fromRGB(100, 100, 255), ToggleOff = Color3.fromRGB(30, 30, 55), Border = Color3.fromRGB(80, 80, 180) },
}
RayUI.CurrentTheme = RayUI.Themes.Neon

local function Create(className, props, parent)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do obj[k] = v end
    if parent then obj.Parent = parent end
    return obj
end
local function Tween(obj, time, goal, style, dir)
    local info = TweenInfo.new(time or 0.2, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out)
    local t = TweenService:Create(obj, info, goal); t:Play(); return t
end
local function Corner(parent, radius) return Create("UICorner", { CornerRadius = UDim.new(0, radius or 6) }, parent) end
local function Stroke(parent, color, thickness, transparency) return Create("UIStroke", { Color = color or Color3.fromRGB(60, 60, 60), Thickness = thickness or 1, Transparency = transparency or 0.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, parent) end

local function GetGuiParent()
    local ok, result = pcall(function()
        if CoreGui:FindFirstChild("RayUI") then CoreGui.RayUI:Destroy() end
        return CoreGui
    end)
    if ok then return result end
    return LocalPlayer:FindFirstChild("PlayerGui") or CoreGui
end

-- Boot Screens (شاشتان فقط للاختصار، يمكنك إضافة البقية لاحقاً)
function RayUI:PlayBootMatrix(scriptName, duration)
    scriptName = scriptName or "RayUI"; duration = duration or 3
    local gui = Create("ScreenGui", { Name = "RayUI_Boot", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 999 }, GetGuiParent())
    local bg = Create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0 }, gui)
    local nameLabel = Create("TextLabel", { Size = UDim2.new(0, 600, 0, 80), Position = UDim2.new(0.5, -300, 0.5, -40), BackgroundTransparency = 1, Text = scriptName, TextColor3 = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Code, TextSize = 48, TextTransparency = 1 }, bg)
    local columns = {}
    for i = 1, 30 do
        local col = Create("TextLabel", { Size = UDim2.new(0, 20, 0, math.random(100, 300)), Position = UDim2.new((i / 30), 0, -1, 0), BackgroundTransparency = 1, Text = string.rep("0\n1\n0\n1\n0\n1\n0\n1\n", 10), TextColor3 = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Code, TextSize = 14, TextTransparency = 0.5 }, bg)
        table.insert(columns, col)
    end
    local colConn = RunService.Heartbeat:Connect(function(dt)
        for _, col in ipairs(columns) do
            col.Position = UDim2.new(col.Position.X.Scale, 0, col.Position.Y.Scale + (dt * 0.5), 0)
            if col.Position.Y.Scale > 1 then col.Position = UDim2.new(col.Position.X.Scale, 0, -0.5, 0) end
        end
    end)
    Tween(nameLabel, 1, {TextTransparency = 0})
    task.wait(duration); colConn:Disconnect()
    Tween(nameLabel, 0.5, {TextTransparency = 1}); for _, c in ipairs(columns) do Tween(c, 0.5, {TextTransparency = 1}) end
    task.wait(0.6); Tween(bg, 0.5, {BackgroundTransparency = 1}); task.wait(0.5); gui:Destroy()
end

function RayUI:PlayBootPulse(scriptName, duration)
    scriptName = scriptName or "RayUI"; duration = duration or 3
    local gui = Create("ScreenGui", { Name = "RayUI_Boot", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 999 }, GetGuiParent())
    local bg = Create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(10, 5, 20), BorderSizePixel = 0 }, gui)
    local nameLabel = Create("TextLabel", { Size = UDim2.new(0, 400, 0, 40), Position = UDim2.new(0.5, -200, 0.5, 40), BackgroundTransparency = 1, Text = scriptName, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 32 }, bg)
    local rings = {}
    for i = 1, 3 do
        local ring = Create("Frame", { Size = UDim2.new(0, 100, 0, 100), Position = UDim2.new(0.5, -50, 0.5, -80), BackgroundTransparency = 1, BorderSizePixel = 0 }, bg)
        Corner(ring, 50); Stroke(ring, Color3.fromRGB(200, 100, 255), 2, 0); table.insert(rings, ring)
    end
    local t = 0
    local conn = RunService.Heartbeat:Connect(function(dt)
        t = t + dt
        for i, ring in ipairs(rings) do
            local phase = (t * 1.5 + (i * 0.3)) % 1
            ring.Size = UDim2.new(0, 100 + phase * 200, 0, 100 + phase * 200)
            ring.Position = UDim2.new(0.5, -(50 + phase * 100), 0.5, -(80 + phase * 100))
            ring.UIStroke.Transparency = phase
        end
    end)
    task.wait(duration); conn:Disconnect()
    Tween(nameLabel, 0.5, {TextTransparency = 1}); for _, r in ipairs(rings) do Tween(r, 0.5, {BackgroundTransparency = 1}) end
    task.wait(0.6); Tween(bg, 0.5, {BackgroundTransparency = 1}); task.wait(0.5); gui:Destroy()
end

function RayUI:PlayBoot(bootType, scriptName, duration)
    if bootType == "Matrix" then self:PlayBootMatrix(scriptName, duration)
    elseif bootType == "Pulse" then self:PlayBootPulse(scriptName, duration)
    else self:PlayBootMatrix(scriptName, duration) end
end

-- Notifications
function RayUI:Notify(title, content, duration)
    duration = duration or 4
    local parentGui = GetGuiParent()
    local notifGui = parentGui:FindFirstChild("RayUI_Notifications")
    if not notifGui then notifGui = Create("ScreenGui", { Name = "RayUI_Notifications", ResetOnSpawn = false, DisplayOrder = 9999 }, parentGui) end
    local holder = notifGui:FindFirstChild("Holder")
    if not holder then holder = Create("Frame", { Name = "Holder", Size = UDim2.new(0, 300, 1, -40), Position = UDim2.new(1, -320, 0, 20), BackgroundTransparency = 1 }, notifGui); Create("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top }, holder) end
    local notif = Create("Frame", { Size = UDim2.new(1, 0, 0, 70), BackgroundColor3 = self.CurrentTheme.Background, BorderSizePixel = 0, BackgroundTransparency = 1, Position = UDim2.new(1, 0, 0, 0) }, holder); Corner(notif, 8); Stroke(notif, self.CurrentTheme.Accent, 1, 0)
    local sideBar = Create("Frame", { Size = UDim2.new(0, 4, 1, 0), BackgroundColor3 = self.CurrentTheme.Accent, BorderSizePixel = 0 }, notif); Corner(sideBar, 4)
    local titleLbl = Create("TextLabel", { Size = UDim2.new(1, -20, 0, 24), Position = UDim2.new(0, 12, 0, 8), BackgroundTransparency = 1, Text = title, TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, TextTransparency = 1 }, notif)
    local contentLbl = Create("TextLabel", { Size = UDim2.new(1, -20, 0, 34), Position = UDim2.new(0, 12, 0, 32), BackgroundTransparency = 1, Text = content, TextColor3 = self.CurrentTheme.SubText, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, TextTransparency = 1 }, notif)
    Tween(notif, 0.3, {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)}); Tween(titleLbl, 0.3, {TextTransparency = 0}); Tween(contentLbl, 0.3, {TextTransparency = 0})
    task.spawn(function() task.wait(duration); Tween(notif, 0.3, {BackgroundTransparency = 1, Position = UDim2.new(1, 0, 0, 0)}); Tween(titleLbl, 0.3, {TextTransparency = 1}); Tween(contentLbl, 0.3, {TextTransparency = 1}); task.wait(0.35); notif:Destroy() end)
end

-- ═══════════════════════════════════════════
-- ✅ دالة إنشاء النافذة (CreateWindow) - التي كانت مفقودة!
-- ═══════════════════════════════════════════
function RayUI:CreateWindow(config)
    config = config or {}
    if config.Theme and self.Themes[config.Theme] then self.CurrentTheme = self.Themes[config.Theme] end
    local theme = self.CurrentTheme
    local window = { Tabs = {}, ActiveTab = nil }; setmetatable(window, {__index = self})
    local size = config.Size or UDim2.new(0, 550, 0, 400); local pos = config.Position or UDim2.new(0.5, -275, 0.5, -200)
    local gui = Create("ScreenGui", { Name = config.Name or "RayUI", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 100 }, GetGuiParent())
    local main = Create("Frame", { Size = size, Position = pos, BackgroundColor3 = theme.Background, BorderSizePixel = 0 }, gui); Corner(main, config.CornerRadius or 10); Stroke(main, theme.Border, 1, 0.3)
    local topbar = Create("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = theme.Topbar, BorderSizePixel = 0 }, main); Corner(topbar, config.CornerRadius or 10)
    Create("Frame", { Size = UDim2.new(1, 0, 0, 10), Position = UDim2.new(0, 0, 1, -10), BackgroundColor3 = theme.Topbar, BorderSizePixel = 0 }, topbar)
    local titleLbl = Create("TextLabel", { Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 15, 0, 0), BackgroundTransparency = 1, Text = config.Title or "RayUI", TextColor3 = theme.Text, Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left }, topbar)
    local closeBtn = Create("TextButton", { Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -38, 0, 5), BackgroundColor3 = Color3.fromRGB(220, 50, 50), Text = "✕", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 14, BorderSizePixel = 0 }, topbar); Corner(closeBtn, 6)
    closeBtn.MouseButton1Click:Connect(function() Tween(main, 0.2, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}); task.wait(0.25); gui:Destroy() end)
    local tabbar = Create("Frame", { Size = UDim2.new(0, 130, 1, -40), Position = UDim2.new(0, 0, 0, 40), BackgroundColor3 = theme.TabBar, BorderSizePixel = 0 }, main)
    local tabList = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y }, tabbar)
    Create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, tabList); Create("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }, tabList)
    local content = Create("Frame", { Size = UDim2.new(1, -130, 1, -40), Position = UDim2.new(0, 130, 0, 40), BackgroundTransparency = 1 }, main)
    window.Gui, window.Main, window.Topbar, window.TabBar, window.TabList, window.Content = gui, main, topbar, tabbar, tabList, content

    function window:SetTheme(themeName) if self.Themes[themeName] then self.CurrentTheme = self.Themes[themeName]; self.Main.BackgroundColor3 = self.CurrentTheme.Background; self.Topbar.BackgroundColor3 = self.CurrentTheme.Topbar; self.TabBar.BackgroundColor3 = self.CurrentTheme.TabBar; end end
    function window:AddTab(name)
        local tab = { Name = name }
        local btn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = self.CurrentTheme.TabBar, Text = name, TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, BorderSizePixel = 0, AutoButtonColor = false }, tabList); Corner(btn, 6); tab.Button = btn
        local page = Create("ScrollingFrame", { Size = UDim2.new(1, -10, 1, -10), Position = UDim2.new(0, 5, 0, 5), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false }, content); tab.Page = page
        Create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, page); Create("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }, page)
        btn.MouseButton1Click:Connect(function() for _, t in pairs(self.Tabs) do t.Page.Visible = false; t.Button.BackgroundColor3 = self.CurrentTheme.TabBar end; page.Visible = true; btn.BackgroundColor3 = self.CurrentTheme.Accent; self.ActiveTab = tab end)
        table.insert(self.Tabs, tab); if not self.ActiveTab then self.ActiveTab = tab; page.Visible = true; btn.BackgroundColor3 = self.CurrentTheme.Accent end
        return tab
    end
    return window
end

-- ═══════════════════════════════════════════
-- ✅ عناصر الواجهة (AddButton, AddToggle, AddSlider, AddDropdown, AddSection, AddParagraph)
-- ═══════════════════════════════════════════
function RayUI:AddButton(tab, config) local btn = Create("TextButton", { Size = UDim2.new(1, -10, 0, 32), BackgroundColor3 = self.CurrentTheme.Button, Text = config.Name or "زر", TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, BorderSizePixel = 0, AutoButtonColor = false }, tab.Page); Corner(btn, 6); Stroke(btn, self.CurrentTheme.Border, 1, 0.5); btn.MouseButton1Click:Connect(function() if config.Callback then pcall(config.Callback) end end) end
function RayUI:AddToggle(tab, config) local flag = config.Flag or config.Name or "t_"..tick(); local value = self._flags[flag] or config.Default or false; local container = Create("Frame", { Size = UDim2.new(1, -10, 0, 30), BackgroundColor3 = self.CurrentTheme.Button, BorderSizePixel = 0 }, tab.Page); Corner(container, 6); Stroke(container, self.CurrentTheme.Border, 1, 0.5); Create("TextLabel", { Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = config.Name or "خيار", TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left }, container); local toggleBg = Create("Frame", { Size = UDim2.new(0, 36, 0, 18), Position = UDim2.new(1, -46, 0.5, -9), BackgroundColor3 = value and self.CurrentTheme.ToggleOn or self.CurrentTheme.ToggleOff, BorderSizePixel = 0 }, container); Corner(toggleBg, 9); local knob = Create("Frame", { Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(0, value and 20 or 2, 0.5, -7), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0 }, toggleBg); Corner(knob, 7); local clickArea = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "" }, container); local function setValue(v) value = v; self._flags[flag] = v; Tween(toggleBg, 0.15, {BackgroundColor3 = v and self.CurrentTheme.ToggleOn or self.CurrentTheme.ToggleOff}); Tween(knob, 0.15, {Position = UDim2.new(0, v and 20 or 2, 0.5, -7)}); if config.Callback then pcall(config.Callback, v) end end; clickArea.MouseButton1Click:Connect(function() setValue(not value) end) end
function RayUI:AddSlider(tab, config) local flag = config.Flag or config.Name or "s_"..tick(); local minV, maxV = config.Min or 0, config.Max or 100; local value = self._flags[flag] or config.Default or minV; local container = Create("Frame", { Size = UDim2.new(1, -10, 0, 50), BackgroundColor3 = self.CurrentTheme.Button, BorderSizePixel = 0 }, tab.Page); Corner(container, 6); Stroke(container, self.CurrentTheme.Border, 1, 0.5); Create("TextLabel", { Size = UDim2.new(1, -80, 0, 22), Position = UDim2.new(0, 10, 0, 4), BackgroundTransparency = 1, Text = config.Name or "سلايدر", TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left }, container); local valueLbl = Create("TextLabel", { Size = UDim2.new(0, 70, 0, 22), Position = UDim2.new(1, -80, 0, 4), BackgroundTransparency = 1, Text = tostring(value)..(config.Suffix or ""), TextColor3 = self.CurrentTheme.Accent, Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Right }, container); local barBg = Create("Frame", { Size = UDim2.new(1, -20, 0, 6), Position = UDim2.new(0, 10, 0, 34), BackgroundColor3 = self.CurrentTheme.Input, BorderSizePixel = 0 }, container); Corner(barBg, 3); local fill = Create("Frame", { Size = UDim2.new((value - minV) / (maxV - minV), 0, 1, 0), BackgroundColor3 = self.CurrentTheme.Accent, BorderSizePixel = 0 }, barBg); Corner(fill, 3); local knob = Create("Frame", { Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new((value - minV) / (maxV - minV), -7, 0.5, -7), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0 }, barBg); Corner(knob, 7); local dragging = false; local function update(inputX) local rel = math.clamp((inputX - barBg.AbsolutePosition.X) / barBg.AbsoluteSize.X, 0, 1); local newVal = minV + rel * (maxV - minV); if config.Round then newVal = math.floor(newVal + 0.5) end; value = newVal; fill.Size = UDim2.new(rel, 0, 1, 0); knob.Position = UDim2.new(rel, -7, 0.5, -7); valueLbl.Text = tostring(math.floor(value * 100) / 100)..(config.Suffix or ""); if config.Callback then pcall(config.Callback, value) end end; barBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; update(i.Position.X) end end); UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then update(i.Position.X) end end); UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end) end
function RayUI:AddDropdown(tab, config) local flag = config.Flag or config.Name or "dd_"..tick(); local options = config.Options or {}; local value = self._flags[flag] or config.Default or nil; local container = Create("Frame", { Size = UDim2.new(1, -10, 0, 32), BackgroundColor3 = self.CurrentTheme.Button, BorderSizePixel = 0 }, tab.Page); Corner(container, 6); Stroke(container, self.CurrentTheme.Border, 1, 0.5); Create("TextLabel", { Size = UDim2.new(1, -90, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = config.Name or "اختيار", TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left }, container); local valueLbl = Create("TextLabel", { Size = UDim2.new(0, 70, 1, 0), Position = UDim2.new(1, -80, 0, 0), BackgroundTransparency = 1, Text = value and tostring(value) or "▼", TextColor3 = self.CurrentTheme.Accent, Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right }, container); local clickArea = Create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "" }, container); local open = false; local dropdown; clickArea.MouseButton1Click:Connect(function() open = not open; if dropdown then dropdown:Destroy(); dropdown = nil end; if not open then return end; dropdown = Create("Frame", { Size = UDim2.new(1, 0, 0, math.min(#options * 26, 150)), Position = UDim2.new(0, 0, 1, 4), BackgroundColor3 = self.CurrentTheme.Background, BorderSizePixel = 0, ZIndex = 10 }, container); Corner(dropdown, 6); Stroke(dropdown, self.CurrentTheme.Accent, 1, 0.5); local list = Create("ScrollingFrame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y }, dropdown); Create("UIListLayout", {Padding = UDim.new(0, 2)}, list); for _, opt in ipairs(options) do local optBtn = Create("TextButton", { Size = UDim2.new(1, 0, 0, 24), BackgroundColor3 = self.CurrentTheme.Button, Text = tostring(opt), TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.Gotham, TextSize = 12, BorderSizePixel = 0, ZIndex = 11 }, list); Corner(optBtn, 4); optBtn.MouseButton1Click:Connect(function() value = opt; valueLbl.Text = tostring(opt); open = false; if dropdown then dropdown:Destroy() end; if config.Callback then pcall(config.Callback, opt) end end) end end) end
function RayUI:AddParagraph(tab, config) local container = Create("Frame", { Size = UDim2.new(1, -10, 0, 50), BackgroundColor3 = self.CurrentTheme.Button, BorderSizePixel = 0 }, tab.Page); Corner(container, 6); Stroke(container, self.CurrentTheme.Border, 1, 0.5); if config.Title then Create("TextLabel", { Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 10, 0, 4), BackgroundTransparency = 1, Text = config.Title, TextColor3 = self.CurrentTheme.Text, Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left }, container) end; Create("TextLabel", { Size = UDim2.new(1, -20, 0, 24), Position = UDim2.new(0, 10, 0, config.Title and 24 or 8), BackgroundTransparency = 1, Text = config.Text or "", TextColor3 = self.CurrentTheme.SubText, Font = Enum.Font.Gotham, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true }, container) end
function RayUI:AddSection(tab, config) local section = Create("Frame", { Size = UDim2.new(1, -10, 0, 30), BackgroundColor3 = self.CurrentTheme.Topbar, BorderSizePixel = 0 }, tab.Page); Corner(section, 6); Stroke(section, self.CurrentTheme.Accent, 1, 0.5); Create("TextLabel", { Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = config.Name or "قسم", TextColor3 = self.CurrentTheme.Accent, Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left }, section) end
function RayUI:CreateFloatingButton(window, config) local btn = Create("TextButton", { Size = UDim2.new(0, 45, 0, 45), Position = config.Position or UDim2.new(0, 20, 0.5, -22), BackgroundColor3 = config.Color or self.CurrentTheme.Accent, Text = config.Icon or "R", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 20, BorderSizePixel = 0 }, window.Gui); Corner(btn, 22); Stroke(btn, Color3.fromRGB(255, 255, 255), 1, 0.5); local isHidden = false; btn.MouseButton1Click:Connect(function() isHidden = not isHidden; window.Main.Visible = not isHidden end) end

return RayUI
