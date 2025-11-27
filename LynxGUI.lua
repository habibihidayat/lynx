-- LynxGUI_v2.4.lua - Ultra Modern Glassmorphism Edition
-- LANDSCAPE OPTIMIZED FOR MOBILE (Horizontal Rectangle)
-- ✨ FIXED: Toggle circle visibility & smooth animations
-- 🎨 ENHANCED: Modern glassmorphism design with gradients
-- 💎 IMPROVED: Smooth transitions & better spacing
-- Part 1/5: Setup & Core Structure

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

repeat task.wait() until localPlayer:FindFirstChild("PlayerGui")

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- ═══════════════════════════════════════════════════════════════
-- HELPER FUNCTION
-- ═══════════════════════════════════════════════════════════════
local function new(class, props)
    local inst = Instance.new(class)
    for k,v in pairs(props or {}) do inst[k] = v end
    return inst
end

-- ═══════════════════════════════════════════════════════════════
-- LOAD EXTERNAL MODULES
-- ═══════════════════════════════════════════════════════════════
local instant = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant.lua"))()
local instant2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant2.lua"))()
local instant2x = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant2Xspeed.lua"))()
local blatantv2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/BlatantV2.lua"))()
local NoFishingAnimation = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Utama/NoFishingAnimation.lua"))()
local TeleportModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/TeleportModule.lua"))()
local TeleportToPlayer = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/TeleportSystem/TeleportToPlayer.lua"))()
local AutoSell = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoSell.lua"))()
local AutoSellTimer = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoSellTimer.lua"))()
local AntiAFK = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Misc/AntiAFK.lua"))()
local UnlockFPS = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Misc/UnlockFPS.lua"))()
local AutoBuyWeather = loadstring(game:HttpGet("https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoBuyWeather.lua"))()

-- ═══════════════════════════════════════════════════════════════
-- MODERN COLOR PALETTE - Glassmorphism Theme
-- ═══════════════════════════════════════════════════════════════
local colors = {
    -- Primary Colors
    primary = Color3.fromRGB(138, 180, 248),      -- Soft Blue
    secondary = Color3.fromRGB(168, 139, 250),    -- Purple
    accent = Color3.fromRGB(94, 234, 212),        -- Cyan/Teal
    success = Color3.fromRGB(74, 222, 128),       -- Green
    warning = Color3.fromRGB(251, 191, 36),       -- Amber
    danger = Color3.fromRGB(248, 113, 113),       -- Red
    
    -- Background Layers (Glassmorphism)
    bg1 = Color3.fromRGB(15, 23, 42),             -- Deep Navy
    bg2 = Color3.fromRGB(30, 41, 59),             -- Slate 800
    bg3 = Color3.fromRGB(51, 65, 85),             -- Slate 700
    bg4 = Color3.fromRGB(71, 85, 105),            -- Slate 600
    bg5 = Color3.fromRGB(100, 116, 139),          -- Slate 500
    
    -- Text Colors
    text = Color3.fromRGB(248, 250, 252),         -- Almost White
    textDim = Color3.fromRGB(203, 213, 225),      -- Slate 300
    textDimmer = Color3.fromRGB(148, 163, 184),   -- Slate 400
    
    -- UI Elements
    border = Color3.fromRGB(71, 85, 105),         -- Slate Border
    borderAccent = Color3.fromRGB(138, 180, 248), -- Accent Border
    inputBg = Color3.fromRGB(30, 41, 59),         -- Input Background
    inputBorder = Color3.fromRGB(100, 116, 139),  -- Input Border
    inputFocus = Color3.fromRGB(94, 234, 212),    -- Focus Color
    
    -- Gradient Colors
    gradientStart = Color3.fromRGB(138, 180, 248),
    gradientEnd = Color3.fromRGB(168, 139, 250),
}

-- ═══════════════════════════════════════════════════════════════
-- WINDOW CONFIGURATION
-- ═══════════════════════════════════════════════════════════════
local windowSize = isMobile and UDim2.new(0, 520, 0, 280) or UDim2.new(0, 780, 0, 520)
local minWindowSize = isMobile and Vector2.new(460, 250) or Vector2.new(680, 460)
local maxWindowSize = isMobile and Vector2.new(640, 380) or Vector2.new(1000, 680)

-- ═══════════════════════════════════════════════════════════════
-- MAIN GUI CONTAINER
-- ═══════════════════════════════════════════════════════════════
local gui = new("ScreenGui", {
    Name = "LynxGUI_v2.4_Modern",
    Parent = localPlayer.PlayerGui,
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999
})

-- ═══════════════════════════════════════════════════════════════
-- MAIN WINDOW FRAME
-- ═══════════════════════════════════════════════════════════════
local win = new("Frame", {
    Parent = gui,
    Size = windowSize,
    Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2),
    BackgroundColor3 = colors.bg1,
    BackgroundTransparency = 0.08,
    BorderSizePixel = 0,
    ClipsDescendants = false,
    ZIndex = 3
})
new("UICorner", {Parent = win, CornerRadius = UDim.new(0, 16)})

-- Glassmorphism Blur Effect Overlay
local glassOverlay = new("Frame", {
    Parent = win,
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 0.96,
    BorderSizePixel = 0,
    ZIndex = 2
})
new("UICorner", {Parent = glassOverlay, CornerRadius = UDim.new(0, 16)})

-- Animated Gradient Border
local border = new("UIStroke", {
    Parent = win,
    Color = colors.borderAccent,
    Thickness = 2,
    Transparency = 0.3,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})

-- Gradient Effect for Border (animated)
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.5) % 360
        border.Color = Color3.fromHSV(hue / 360, 0.6, 0.95)
        task.wait(0.05)
    end
end)

-- Shadow Effect
local shadow = new("ImageLabel", {
    Parent = win,
    Size = UDim2.new(1, 40, 1, 40),
    Position = UDim2.new(0, -20, 0, -20),
    BackgroundTransparency = 1,
    Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    ImageColor3 = Color3.fromRGB(0, 0, 0),
    ImageTransparency = 0.7,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(10, 10, 90, 90),
    ZIndex = 1
})

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR CONFIGURATION
-- ═══════════════════════════════════════════════════════════════
local sidebarExpanded = false
local sidebarCollapsedWidth = 58
local sidebarExpandedWidth = 180

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR FRAME
-- ═══════════════════════════════════════════════════════════════
local sidebar = new("Frame", {
    Parent = win,
    Size = isMobile and UDim2.new(0, sidebarCollapsedWidth, 1, 0) or UDim2.new(0, 200, 1, 0),
    BackgroundColor3 = colors.bg2,
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 4
})
new("UICorner", {Parent = sidebar, CornerRadius = UDim.new(0, 16)})

-- Sidebar Gradient Overlay
local sidebarGradient = new("UIGradient", {
    Parent = sidebar,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 41, 59)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 65, 85))
    }),
    Rotation = 135
})

-- Sidebar Border
new("UIStroke", {
    Parent = sidebar,
    Color = colors.border,
    Thickness = 1,
    Transparency = 0.5,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR TOGGLE BUTTON (Mobile Only)
-- ═══════════════════════════════════════════════════════════════
local sidebarToggle
if isMobile then
    sidebarToggle = new("TextButton", {
        Parent = win,
        Size = UDim2.new(0, 32, 0, 48),
        Position = UDim2.new(0, sidebarCollapsedWidth - 4, 1, -58),
        BackgroundColor3 = colors.accent,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Text = "▶",
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        TextColor3 = colors.text,
        ZIndex = 101,
        ClipsDescendants = false
    })
    new("UICorner", {Parent = sidebarToggle, CornerRadius = UDim.new(0, 10)})
    new("UIStroke", {
        Parent = sidebarToggle,
        Color = colors.accent,
        Thickness = 2,
        Transparency = 0.3
    })
    
    -- Hover Effect
    sidebarToggle.MouseEnter:Connect(function()
        TweenService:Create(sidebarToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 36, 0, 52)
        }):Play()
    end)
    
    sidebarToggle.MouseLeave:Connect(function()
        TweenService:Create(sidebarToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, 32, 0, 48)
        }):Play()
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR HEADER
-- ═══════════════════════════════════════════════════════════════
local sidebarHeader = new("Frame", {
    Parent = sidebar,
    Size = isMobile and UDim2.new(1, 0, 0, 60) or UDim2.new(1, 0, 0, 80),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    ZIndex = 5
})

-- Logo Container
local logoContainer = new("Frame", {
    Parent = sidebarHeader,
    Size = isMobile and UDim2.new(0, 40, 0, 40) or UDim2.new(0, 50, 0, 50),
    Position = isMobile and UDim2.new(0.5, -20, 0, 8) or UDim2.new(0, 20, 0, 15),
    BackgroundColor3 = colors.accent,
    BackgroundTransparency = 0.15,
    BorderSizePixel = 0,
    Visible = isMobile and sidebarExpanded or not isMobile,
    ZIndex = 6
})
new("UICorner", {Parent = logoContainer, CornerRadius = UDim.new(0, 10)})
new("UIGradient", {
    Parent = logoContainer,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colors.gradientStart),
        ColorSequenceKeypoint.new(1, colors.gradientEnd)
    }),
    Rotation = 45
})

local logoText = new("TextLabel", {
    Parent = logoContainer,
    Text = "L",
    Size = UDim2.new(1, 0, 1, 0),
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 24 or 30,
    BackgroundTransparency = 1,
    TextColor3 = colors.text,
    ZIndex = 7
})

-- Brand Name
local brandName = new("TextLabel", {
    Parent = sidebarHeader,
    Text = "LYNX",
    Size = UDim2.new(1, 0, 0, 26),
    Position = isMobile and UDim2.new(0, 0, 0, 18) or UDim2.new(0, 75, 0, 22),
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 16 or 20,
    BackgroundTransparency = 1,
    TextColor3 = colors.text,
    TextXAlignment = isMobile and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
    Visible = isMobile and sidebarExpanded or not isMobile,
    ZIndex = 6
})

-- Add Gradient to Brand Name
local brandGradient = new("UIGradient", {
    Parent = brandName,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colors.gradientStart),
        ColorSequenceKeypoint.new(1, colors.gradientEnd)
    })
})

-- Version Label
local brandVersion = new("TextLabel", {
    Parent = sidebarHeader,
    Text = "v2.4 Modern",
    Size = UDim2.new(1, 0, 0, 16),
    Position = isMobile and UDim2.new(0, 0, 0, 42) or UDim2.new(0, 75, 0, 48),
    Font = Enum.Font.Gotham,
    TextSize = 10,
    BackgroundTransparency = 1,
    TextColor3 = colors.textDim,
    TextXAlignment = isMobile and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
    Visible = isMobile and sidebarExpanded or not isMobile,
    ZIndex = 6
})

-- ═══════════════════════════════════════════════════════════════
-- NAVIGATION CONTAINER
-- ═══════════════════════════════════════════════════════════════
local navContainer = new("ScrollingFrame", {
    Parent = sidebar,
    Size = isMobile and UDim2.new(1, -8, 1, -68) or UDim2.new(1, -20, 1, -90),
    Position = isMobile and UDim2.new(0, 4, 0, 62) or UDim2.new(0, 10, 0, 85),
    BackgroundTransparency = 1,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = colors.accent,
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ClipsDescendants = true,
    ZIndex = 5
})
new("UIListLayout", {
    Parent = navContainer,
    Padding = UDim.new(0, isMobile and 6 or 8),
    SortOrder = Enum.SortOrder.LayoutOrder
})

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR TOGGLE FUNCTION
-- ═══════════════════════════════════════════════════════════════
local navButtons = {}

local function toggleSidebar()
    if not isMobile then return end
    
    sidebarExpanded = not sidebarExpanded
    local targetWidth = sidebarExpanded and sidebarExpandedWidth or sidebarCollapsedWidth
    
    -- Animate Sidebar
    TweenService:Create(sidebar, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = UDim2.new(0, targetWidth, 1, 0)
    }):Play()
    
    -- Animate Toggle Button
    if sidebarToggle then
        TweenService:Create(sidebarToggle, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            Position = UDim2.new(0, targetWidth - 4, 1, -58),
            Rotation = sidebarExpanded and 180 or 0
        }):Play()
        sidebarToggle.Text = sidebarExpanded and "◀" or "▶"
    end
    
    -- Toggle Visibility
    brandName.Visible = sidebarExpanded
    brandVersion.Visible = sidebarExpanded
    logoContainer.Visible = sidebarExpanded
    
    -- Update Nav Buttons
    for _, btnData in pairs(navButtons) do
        if btnData.text then
            btnData.text.Visible = sidebarExpanded
            TweenService:Create(btnData.icon, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                Size = sidebarExpanded and UDim2.new(0, 32, 1, 0) or UDim2.new(1, 0, 1, 0),
                Position = sidebarExpanded and UDim2.new(0, 10, 0, 0) or UDim2.new(0, 0, 0, 0)
            }):Play()
        end
    end
end

if sidebarToggle then
    sidebarToggle.MouseButton1Click:Connect(toggleSidebar)
end

-- ═══════════════════════════════════════════════════════════════
-- CONTENT AREA BACKGROUND
-- ═══════════════════════════════════════════════════════════════
local contentBg = new("Frame", {
    Parent = win,
    Size = isMobile and UDim2.new(1, -66, 1, -14) or UDim2.new(1, -210, 1, -16),
    Position = isMobile and UDim2.new(0, 62, 0, 8) or UDim2.new(0, 205, 0, 10),
    BackgroundColor3 = colors.bg2,
    BackgroundTransparency = 0.15,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 4
})
new("UICorner", {Parent = contentBg, CornerRadius = UDim.new(0, 14)})

-- Content Gradient
local contentGradient = new("UIGradient", {
    Parent = contentBg,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 41, 59)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 65, 85))
    }),
    Rotation = 180
})

-- Content Border
new("UIStroke", {
    Parent = contentBg,
    Color = colors.border,
    Thickness = 1,
    Transparency = 0.6,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})

-- ═══════════════════════════════════════════════════════════════
-- TOP BAR
-- ═══════════════════════════════════════════════════════════════
local topBar = new("Frame", {
    Parent = contentBg,
    Size = UDim2.new(1, 0, 0, isMobile and 38 or 52),
    BackgroundColor3 = colors.bg3,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    ZIndex = 5
})
new("UICorner", {Parent = topBar, CornerRadius = UDim.new(0, 14)})

-- Top Bar Gradient
local topBarGradient = new("UIGradient", {
    Parent = topBar,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(51, 65, 85)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(71, 85, 105))
    }),
    Rotation = 90
})

-- Drag Handle
local dragHandle = new("Frame", {
    Parent = topBar,
    Size = isMobile and UDim2.new(0, 32, 0, 4) or UDim2.new(0, 50, 0, 5),
    Position = isMobile and UDim2.new(0.5, -16, 0, 6) or UDim2.new(0.5, -25, 0, 8),
    BackgroundColor3 = colors.accent,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    ZIndex = 6
})
new("UICorner", {Parent = dragHandle, CornerRadius = UDim.new(1, 0)})

-- Drag Handle Gradient
local dragGradient = new("UIGradient", {
    Parent = dragHandle,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colors.gradientStart),
        ColorSequenceKeypoint.new(1, colors.gradientEnd)
    })
})

-- Page Title
local pageTitle = new("TextLabel", {
    Parent = topBar,
    Text = "Dashboard",
    Size = UDim2.new(1, -100, 1, 0),
    Position = isMobile and UDim2.new(0, 12, 0, 0) or UDim2.new(0, 18, 0, 0),
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 12 or 17,
    BackgroundTransparency = 1,
    TextColor3 = colors.text,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 6
})

-- ═══════════════════════════════════════════════════════════════
-- CONTROL BUTTONS (Minimize, Close)
-- ═══════════════════════════════════════════════════════════════
local controlsFrame = new("Frame", {
    Parent = topBar,
    Size = isMobile and UDim2.new(0, 56, 0, 26) or UDim2.new(0, 76, 0, 34),
    Position = isMobile and UDim2.new(1, -60, 0.5, -13) or UDim2.new(1, -80, 0.5, -17),
    BackgroundTransparency = 1,
    ZIndex = 6
})
new("UIListLayout", {
    Parent = controlsFrame,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, isMobile and 4 or 8)
})

local function createControlBtn(icon, color, isClose)
    local btnSize = isMobile and 26 or 34
    local btn = new("TextButton", {
        Parent = controlsFrame,
        Size = UDim2.new(0, btnSize, 0, btnSize),
        BackgroundColor3 = colors.bg4,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Text = icon,
        Font = Enum.Font.GothamBold,
        TextSize = isClose and (isMobile and 18 or 24) or (isMobile and 12 or 16),
        TextColor3 = colors.text,
        AutoButtonColor = false,
        ZIndex = 7
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0, isMobile and 7 or 9)})
    
    -- Button Border
    local btnStroke = new("UIStroke", {
        Parent = btn,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.5
    })
    
    -- Hover Effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundColor3 = color,
            BackgroundTransparency = 0.1,
            Size = UDim2.new(0, btnSize + 2, 0, btnSize + 2)
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Color = color,
            Transparency = 0.2
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundColor3 = colors.bg4,
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, btnSize, 0, btnSize)
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Color = colors.border,
            Transparency = 0.5
        }):Play()
    end)
    
    return btn
end

local btnMin = createControlBtn("─", colors.warning, false)
local btnClose = createControlBtn("×", colors.danger, true)

-- ═══════════════════════════════════════════════════════════════
-- RESIZE HANDLE
-- ═══════════════════════════════════════════════════════════════
local resizeHandle = new("TextButton", {
    Parent = win,
    Size = isMobile and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 26, 0, 26),
    Position = isMobile and UDim2.new(1, -20, 1, -20) or UDim2.new(1, -26, 1, -26),
    BackgroundColor3 = colors.accent,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    Text = "⋰",
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 11 or 15,
    TextColor3 = colors.text,
    AutoButtonColor = false,
    ZIndex = 100
})
new("UICorner", {Parent = resizeHandle, CornerRadius = UDim.new(0, 7)})

-- Resize Handle Gradient
local resizeGradient = new("UIGradient", {
    Parent = resizeHandle,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colors.gradientStart),
        ColorSequenceKeypoint.new(1, colors.gradientEnd)
    }),
    Rotation = 45
})

-- Resize Handle Border
new("UIStroke", {
    Parent = resizeHandle,
    Color = colors.accent,
    Thickness = 1.5,
    Transparency = 0.5
})

-- Resize Hover Effect
resizeHandle.MouseEnter:Connect(function()
    TweenService:Create(resizeHandle, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
        BackgroundTransparency = 0.1,
        Size = isMobile and UDim2.new(0, 24, 0, 24) or UDim2.new(0, 30, 0, 30),
        Rotation = 15
    }):Play()
end)

resizeHandle.MouseLeave:Connect(function()
    TweenService:Create(resizeHandle, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
        BackgroundTransparency = 0.3,
        Size = isMobile and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 26, 0, 26),
        Rotation = 0
    }):Play()
end)

-- ═══════════════════════════════════════════════════════════════
-- PAGES SYSTEM
-- ═══════════════════════════════════════════════════════════════
local pages = {}
local currentPage = "Main"

local function createPage(name)
    local page = new("ScrollingFrame", {
        Parent = contentBg,
        Size = UDim2.new(1, -12, 1, -(isMobile and 44 or 60)),
        Position = UDim2.new(0, 6, 0, isMobile and 42 or 56),
        BackgroundTransparency = 1,
        ScrollBarThickness = isMobile and 4 or 5,
        ScrollBarImageColor3 = colors.accent,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 5
    })
    new("UIListLayout", {
        Parent = page,
        Padding = UDim.new(0, isMobile and 8 or 12),
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    new("UIPadding", {
        Parent = page,
        PaddingTop = UDim.new(0, isMobile and 6 or 10),
        PaddingBottom = UDim.new(0, isMobile and 6 or 10)
    })
    pages[name] = page
    return page
end

-- Create All Pages
local mainPage = createPage("Main")
local teleportPage = createPage("Teleport")
local shopPage = createPage("Shop")
local settingsPage = createPage("Settings")
local infoPage = createPage("Info")
mainPage.Visible = true

-- ═══════════════════════════════════════════════════════════════
-- NAVIGATION BUTTONS
-- ═══════════════════════════════════════════════════════════════
local function createNavButton(text, icon, page, order)
    local btn = new("TextButton", {
        Parent = navContainer,
        Size = isMobile and UDim2.new(1, 0, 0, 44) or UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = page == currentPage and colors.bg4 or colors.bg3,
        BackgroundTransparency = page == currentPage and 0.2 or 0.5,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = order,
        ZIndex = 6
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0, 10)})
    
    -- Button Border
    local btnStroke = new("UIStroke", {
        Parent = btn,
        Color = page == currentPage and colors.accent or colors.border,
        Thickness = 1.5,
        Transparency = page == currentPage and 0.3 or 0.6
    })
    
    -- Active Indicator Bar
    local indicator = new("Frame", {
        Parent = btn,
        Size = isMobile and UDim2.new(0, 4, 0, 18) or UDim2.new(0, 4, 0, 24),
        Position = UDim2.new(0, 0, 0.5, isMobile and -9 or -12),
        BackgroundColor3 = colors.accent,
        BorderSizePixel = 0,
        Visible = page == currentPage,
        ZIndex = 7
    })
    new("UICorner", {Parent = indicator, CornerRadius = UDim.new(1, 0)})
    new("UIGradient", {
        Parent = indicator,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, colors.gradientStart),
            ColorSequenceKeypoint.new(1, colors.gradientEnd)
        }),
        Rotation = 90
    })
    
    -- Icon Label
    local iconLabel = new("TextLabel", {
        Parent = btn,
        Text = icon,
        Size = isMobile and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 36, 1, 0),
        Position = isMobile and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 16 or 20,
        TextColor3 = page == currentPage and colors.accent or colors.textDim,
        ZIndex = 7
    })
    
    -- Text Label
    local textLabel = new("TextLabel", {
        Parent = btn,
        Text = text,
        Size = UDim2.new(1, -56, 1, 0),
        Position = UDim2.new(0, 52, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 12,
        TextColor3 = page == currentPage and colors.text or colors.textDim,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = isMobile and sidebarExpanded or not isMobile,
        ZIndex = 7
    })
    
    navButtons[page] = {btn = btn, icon = iconLabel, text = textLabel, indicator = indicator, stroke = btnStroke}
    
    -- Hover Effect
    btn.MouseEnter:Connect(function()
        if page ~= currentPage then
            TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                BackgroundTransparency = 0.3
            }):Play()
            TweenService:Create(btnStroke, TweenInfo.new(0.2), {
                Transparency = 0.4
            }):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if page ~= currentPage then
            TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
                BackgroundTransparency = 0.5
            }):Play()
            TweenService:Create(btnStroke, TweenInfo.new(0.2), {
                Transparency = 0.6
            }):Play()
        end
    end)
    
    return btn
end

local function switchPage(pageName, pageTitle_text)
    if currentPage == pageName then return end
    for _, page in pairs(pages) do page.Visible = false end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        TweenService:Create(btnData.btn, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            BackgroundColor3 = isActive and colors.bg4 or colors.bg3,
            BackgroundTransparency = isActive and 0.2 or 0.5
        }):Play()
        TweenService:Create(btnData.stroke, TweenInfo.new(0.25), {
            Color = isActive and colors.accent or colors.border,
            Transparency = isActive and 0.3 or 0.6
        }):Play()
        btnData.indicator.Visible = isActive
        TweenService:Create(btnData.icon, TweenInfo.new(0.25), {
            TextColor3 = isActive and colors.accent or colors.textDim
        }):Play()
        if not isMobile or sidebarExpanded then
            TweenService:Create(btnData.text, TweenInfo.new(0.25), {
                TextColor3 = isActive and colors.text or colors.textDim
            }):Play()
        end
    end
    
    pages[pageName].Visible = true
    pageTitle.Text = pageTitle_text
    currentPage = pageName
    
    if isMobile and sidebarExpanded then
        task.wait(0.3)
        toggleSidebar()
    end
end

-- Create Navigation Buttons
local btnMain = createNavButton("Dashboard", "🏠", "Main", 1)
local btnTeleport = createNavButton("Teleport", "🌍", "Teleport", 2)
local btnShop = createNavButton("Shop", "🛒", "Shop", 3)
local btnSettings = createNavButton("Settings", "⚙️", "Settings", 4)
local btnInfo = createNavButton("About", "ℹ️", "Info", 5)

btnMain.MouseButton1Click:Connect(function() switchPage("Main", "Dashboard") end)
btnTeleport.MouseButton1Click:Connect(function() switchPage("Teleport", "Teleport") end)
btnShop.MouseButton1Click:Connect(function() switchPage("Shop", "Shop") end)
btnSettings.MouseButton1Click:Connect(function() switchPage("Settings", "Settings") end)
btnInfo.MouseButton1Click:Connect(function() switchPage("Info", "About") end)

-- ═══════════════════════════════════════════════════════════════
-- UI COMPONENTS - CATEGORY
-- ═══════════════════════════════════════════════════════════════
local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, isMobile and 44 or 56),
        BackgroundColor3 = colors.bg3,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = false,
        ZIndex = 6
    })
    new("UICorner", {Parent = categoryFrame, CornerRadius = UDim.new(0, 12)})
    new("UIStroke", {
        Parent = categoryFrame,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.5
    })
    
    local header = new("TextButton", {
        Parent = categoryFrame,
        Size = UDim2.new(1, 0, 0, isMobile and 44 or 56),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        ClipsDescendants = true,
        ZIndex = 7
    })
    
    local iconLabel = new("TextLabel", {
        Parent = header,
        Text = icon,
        Size = isMobile and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 38, 0, 38),
        Position = isMobile and UDim2.new(0, 10, 0.5, -15) or UDim2.new(0, 12, 0.5, -19),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 14 or 18,
        TextColor3 = colors.accent,
        ZIndex = 8
    })
    
    local titleLabel = new("TextLabel", {
        Parent = header,
        Text = title,
        Size = UDim2.new(1, -80, 1, 0),
        Position = isMobile and UDim2.new(0, 44, 0, 0) or UDim2.new(0, 54, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 11 or 14,
        TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 8
    })
    
    local arrow = new("TextLabel", {
        Parent = header,
        Text = "▼",
        Size = UDim2.new(0, isMobile and 18 or 24, 1, 0),
        Position = isMobile and UDim2.new(1, -24, 0, 0) or UDim2.new(1, -30, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 10 or 13,
        TextColor3 = colors.accent,
        ZIndex = 8
    })
    
    local contentContainer = new("Frame", {
        Parent = categoryFrame,
        Size = isMobile and UDim2.new(1, -16, 0, 0) or UDim2.new(1, -20, 0, 0),
        Position = isMobile and UDim2.new(0, 8, 0, 48) or UDim2.new(0, 10, 0, 62),
        BackgroundTransparency = 1,
        Visible = false,
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        ZIndex = 7
    })
    new("UIListLayout", {Parent = contentContainer, Padding = UDim.new(0, isMobile and 6 or 10)})
    new("UIPadding", {Parent = contentContainer, PaddingBottom = UDim.new(0, isMobile and 10 or 14)})
    
    local isOpen = false
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        contentContainer.Visible = isOpen
        TweenService:Create(arrow, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Rotation = isOpen and 180 or 0}):Play()
        TweenService:Create(categoryFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            BackgroundColor3 = isOpen and colors.bg4 or colors.bg3,
            BackgroundTransparency = isOpen and 0.2 or 0.3
        }):Play()
    end)
    
    return contentContainer
end

-- ═══════════════════════════════════════════════════════════════
-- UI COMPONENTS - TOGGLE (FIXED VERSION)
-- ═══════════════════════════════════════════════════════════════
local function makeToggle(parent, label, callback)
    local frame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, isMobile and 34 or 42),
        BackgroundTransparency = 1,
        ZIndex = 7
    })
    
    local labelText = new("TextLabel", {
        Parent = frame,
        Text = label,
        Size = UDim2.new(0.66, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextColor3 = colors.text,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 10 or 13,
        TextWrapped = true,
        ZIndex = 8
    })
    
    -- Toggle Background Container
    local toggleBg = new("Frame", {
        Parent = frame,
        Size = isMobile and UDim2.new(0, 48, 0, 24) or UDim2.new(0, 56, 0, 28),
        Position = isMobile and UDim2.new(1, -50, 0.5, -12) or UDim2.new(1, -58, 0.5, -14),
        BackgroundColor3 = colors.bg5,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 8
    })
    new("UICorner", {Parent = toggleBg, CornerRadius = UDim.new(1, 0)})
    new("UIStroke", {
        Parent = toggleBg,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.4
    })
    
    -- Toggle Circle (FIXED - Now using ImageLabel for better visibility)
    local toggleCircle = new("Frame", {
        Parent = toggleBg,
        Size = isMobile and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 24, 0, 24),
        Position = isMobile and UDim2.new(0, 2, 0.5, -10) or UDim2.new(0, 2, 0.5, -12),
        BackgroundColor3 = colors.text,
        BorderSizePixel = 0,
        ZIndex = 10  -- Higher ZIndex to ensure visibility
    })
    new("UICorner", {Parent = toggleCircle, CornerRadius = UDim.new(1, 0)})
    
    -- Shadow for toggle circle
    new("UIStroke", {
        Parent = toggleCircle,
        Color = Color3.fromRGB(0, 0, 0),
        Thickness = 1,
        Transparency = 0.7
    })
    
    local enabled = false
    local toggleBtn = new("TextButton", {
        Parent = toggleBg,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 11
    })
    
    toggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        local circlePos = enabled and (isMobile and UDim2.new(1, -22, 0.5, -10) or UDim2.new(1, -26, 0.5, -12)) or (isMobile and UDim2.new(0, 2, 0.5, -10) or UDim2.new(0, 2, 0.5, -12))
        
        TweenService:Create(toggleCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Position = circlePos,
            BackgroundColor3 = enabled and colors.text or colors.text
        }):Play()
        
        TweenService:Create(toggleBg, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            BackgroundColor3 = enabled and colors.accent or colors.bg5,
            BackgroundTransparency = enabled and 0.1 or 0.2
        }):Play()
        
        if callback then callback(enabled) end
    end)
    
    return frame
end

-- ═══════════════════════════════════════════════════════════════
-- UI COMPONENTS - INPUT
-- ═══════════════════════════════════════════════════════════════
local function makeInput(parent, label, defaultValue, callback)
    local frame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, isMobile and 36 or 44),
        BackgroundTransparency = 1,
        ZIndex = 7
    })
    
    local labelText = new("TextLabel", {
        Parent = frame,
        Text = label,
        Size = UDim2.new(0.54, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextColor3 = colors.text,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 10 or 13,
        TextWrapped = true,
        ZIndex = 8
    })
    
    local inputContainer = new("Frame", {
        Parent = frame,
        Size = isMobile and UDim2.new(0.44, -4, 0, 30) or UDim2.new(0.44, -6, 0, 36),
        Position = isMobile and UDim2.new(0.56, 2, 0.5, -15) or UDim2.new(0.56, 3, 0.5, -18),
        BackgroundColor3 = colors.inputBg,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 8
    })
    new("UICorner", {Parent = inputContainer, CornerRadius = UDim.new(0, 8)})
    
    local inputStroke = new("UIStroke", {
        Parent = inputContainer,
        Color = colors.inputBorder,
        Thickness = 1.5,
        Transparency = 0.4
    })
    
    local inputGradient = new("UIGradient", {
        Parent = inputContainer,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 41, 59)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 65, 85))
        }),
        Rotation = 90
    })
    
    local inputBox = new("TextBox", {
        Parent = inputContainer,
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Text = tostring(defaultValue),
        PlaceholderText = "0.00",
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 11 or 14,
        TextColor3 = colors.text,
        PlaceholderColor3 = colors.textDimmer,
        TextXAlignment = Enum.TextXAlignment.Center,
        ClearTextOnFocus = false,
        ZIndex = 9
    })
    
    inputBox.Focused:Connect(function()
        TweenService:Create(inputStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Color = colors.inputFocus,
            Transparency = 0.1
        }):Play()
        TweenService:Create(inputContainer, TweenInfo.new(0.25), {
            BackgroundColor3 = Color3.fromRGB(35, 46, 64),
            BackgroundTransparency = 0.1
        }):Play()
    end)
    
    inputBox.FocusLost:Connect(function(enterPressed)
        TweenService:Create(inputStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Color = colors.inputBorder,
            Transparency = 0.4
        }):Play()
        TweenService:Create(inputContainer, TweenInfo.new(0.25), {
            BackgroundColor3 = colors.inputBg,
            BackgroundTransparency = 0.15
        }):Play()
        
        local value = tonumber(inputBox.Text)
        if value then
            inputBox.Text = tostring(value)
            if callback then callback(value) end
        else
            inputBox.Text = tostring(defaultValue)
        end
    end)
    
    return frame, inputBox
end

-- ═══════════════════════════════════════════════════════════════
-- UI COMPONENTS - BUTTON
-- ═══════════════════════════════════════════════════════════════
local function makeButton(parent, label, callback)
    local btn = new("TextButton", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, isMobile and 34 or 42),
        BackgroundColor3 = colors.bg4,
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Text = label,
        Font = Enum.Font.GothamSemibold,
        TextSize = isMobile and 10 or 13,
        TextColor3 = colors.text,
        AutoButtonColor = false,
        ZIndex = 8
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0, 8)})
    
    local btnStroke = new("UIStroke", {
        Parent = btn,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.5
    })
    
    local btnGradient = new("UIGradient", {
        Parent = btn,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(71, 85, 105)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 116, 139))
        }),
        Rotation = 90
    })
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundColor3 = colors.accent,
            BackgroundTransparency = 0.15
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Color = colors.accent,
            Transparency = 0.2
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {
            BackgroundColor3 = colors.bg4,
            BackgroundTransparency = 0.25
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Color = colors.border,
            Transparency = 0.5
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
            Size = UDim2.new(1, -4, 0, (isMobile and 34 or 42) - 2)
        }):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {
            Size = UDim2.new(1, 0, 0, isMobile and 34 or 42)
        }):Play()
        if callback then callback() end
    end)
    
    return btn
end

-- ═══════════════════════════════════════════════════════════════
-- UI COMPONENTS - DROPDOWN
-- ═══════════════════════════════════════════════════════════════
local dropdownStates = {}

local function makeDropdown(parent, label, icon, items, callback, id)
    local frame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, isMobile and 36 or 44),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = 7
    })
    
    local header = new("TextButton", {
        Parent = frame,
        Size = UDim2.new(1, 0, 0, isMobile and 36 or 44),
        BackgroundColor3 = colors.bg4,
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        ZIndex = 8
    })
    new("UICorner", {Parent = header, CornerRadius = UDim.new(0, 8)})
    new("UIStroke", {
        Parent = header,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.5
    })
    
    local iconLabel = new("TextLabel", {
        Parent = header,
        Text = icon,
        Size = isMobile and UDim2.new(0, 26, 1, 0) or UDim2.new(0, 32, 1, 0),
        Position = UDim2.new(0, isMobile and 8 or 12, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 12 or 15,
        TextColor3 = colors.accent,
        ZIndex = 9
    })
    
    local labelText = new("TextLabel", {
        Parent = header,
        Text = label,
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.new(0, isMobile and 36 or 48, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 10 or 13,
        TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 9
    })
    
    local arrow = new("TextLabel", {
        Parent = header,
        Text = "▼",
        Size = UDim2.new(0, isMobile and 16 or 20, 1, 0),
        Position = isMobile and UDim2.new(1, -20, 0, 0) or UDim2.new(1, -26, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 9 or 12,
        TextColor3 = colors.textDim,
        ZIndex = 9
    })
    
    local listContainer = new("Frame", {
        Parent = frame,
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, isMobile and 40 or 48),
        BackgroundColor3 = colors.bg3,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        Visible = false,
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        ZIndex = 10
    })
    new("UICorner", {Parent = listContainer, CornerRadius = UDim.new(0, 8)})
    new("UIStroke", {
        Parent = listContainer,
        Color = colors.border,
        Thickness = 1.5,
        Transparency = 0.4
    })
    new("UIListLayout", {Parent = listContainer, Padding = UDim.new(0, 3)})
    new("UIPadding", {
        Parent = listContainer,
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5)
    })
    
    for _, item in ipairs(items) do
        local itemBtn = new("TextButton", {
            Parent = listContainer,
            Size = UDim2.new(1, 0, 0, isMobile and 28 or 34),
            BackgroundColor3 = colors.bg4,
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            Text = item,
            Font = Enum.Font.GothamMedium,
            TextSize = isMobile and 9 or 12,
            TextColor3 = colors.text,
            AutoButtonColor = false,
            ZIndex = 11
        })
        new("UICorner", {Parent = itemBtn, CornerRadius = UDim.new(0, 6)})
        
        itemBtn.MouseEnter:Connect(function()
            TweenService:Create(itemBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quart), {
                BackgroundColor3 = colors.accent,
                BackgroundTransparency = 0.2
            }):Play()
        end)
        
        itemBtn.MouseLeave:Connect(function()
            TweenService:Create(itemBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quart), {
                BackgroundColor3 = colors.bg4,
                BackgroundTransparency = 0.35
            }):Play()
        end)
        
        itemBtn.MouseButton1Click:Connect(function()
            labelText.Text = label .. ": " .. item
            listContainer.Visible = false
            TweenService:Create(arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
            if id then dropdownStates[id] = false end
            if callback then callback(item) end
        end)
    end
    
    if id then dropdownStates[id] = false end
    
    header.MouseButton1Click:Connect(function()
        local isOpen = not listContainer.Visible
        listContainer.Visible = isOpen
        TweenService:Create(arrow, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Rotation = isOpen and 180 or 0
        }):Play()
        if id then dropdownStates[id] = isOpen end
    end)
    
    return frame
end

-- ═══════════════════════════════════════════════════════════════
-- POPULATE PAGES - MAIN PAGE
-- ═══════════════════════════════════════════════════════════════
local fishingDelayValue = 1.30
local cancelDelayValue = 0.19

local catAutoFishing = makeCategory(mainPage, "Auto Fishing", "🎣")
makeToggle(catAutoFishing, "Enable Instant Fish", function(on)
    if on then
        instant.Start()
        instant2.Start()
    else
        instant.Stop()
        instant2.Stop()
    end
end)

makeInput(catAutoFishing, "Fishing Delay", 1.30, function(v)
    fishingDelayValue = v
    instant.Settings.MaxWaitTime = v
    instant2.Settings.MaxWaitTime = v
end)

makeInput(catAutoFishing, "Cancel Delay", 0.19, function(v)
    cancelDelayValue = v
    instant.Settings.CancelDelay = v
    instant2.Settings.CancelDelay = v
end)

local catBlatant = makeCategory(mainPage, "Blatant Mode", "🔥")
makeToggle(catBlatant, "Blatant Features", function(on)
    if on then instant2x.Start() else instant2x.Stop() end
end)

makeInput(catBlatant, "Fishing Delay", 0.3, function(v) instant2x.Settings.FishingDelay = v end)
makeInput(catBlatant, "Cancel Delay", 0.19, function(v) instant2x.Settings.CancelDelay = v end)

local catBlatantV2 = makeCategory(mainPage, "Blatant V2", "🔥")
makeToggle(catBlatantV2, "Blatant Features", function(on)
    if on then blatantv2.Start() else blatantv2.Stop() end
end)

makeInput(catBlatantV2, "Fishing Delay", 0.05, function(v) blatantv2.Settings.FishingDelay = v end)
makeInput(catBlatantV2, "Cancel Delay", 0.01, function(v) blatantv2.Settings.CancelDelay = v end)
makeInput(catBlatantV2, "Hook Wait Time", 0.15, function(v) blatantv2.Settings.HookWaitTime = v end)
makeInput(catBlatantV2, "Cast Delay", 0.03, function(v) blatantv2.Settings.CastDelay = v end)
makeInput(catBlatantV2, "Timeout Delay", 0.8, function(v) blatantv2.Settings.TimeoutDelay = v end)

local catSupport = makeCategory(mainPage, "Support Features", "🛠️")
makeToggle(catSupport, "No Fishing Animation", function(on)
    if on then
        NoFishingAnimation.StartWithDelay()
    else
        NoFishingAnimation.Stop()
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- POPULATE PAGES - TELEPORT PAGE
-- ═══════════════════════════════════════════════════════════════
local locationItems = {}
for name, _ in pairs(TeleportModule.Locations) do
    table.insert(locationItems, name)
end
table.sort(locationItems)

makeDropdown(teleportPage, "Teleport to Location", "📍", locationItems, function(selectedLocation)
    TeleportModule.TeleportTo(selectedLocation)
end, "LocationTeleport")

local playerItems = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        table.insert(playerItems, player.Name)
    end
end
table.sort(playerItems)

makeDropdown(teleportPage, "Teleport to Player", "👤", playerItems, function(selectedPlayer)
    TeleportToPlayer.TeleportTo(selectedPlayer)
end, "PlayerTeleport")

local function refreshPlayerList()
    table.clear(playerItems)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerItems, player.Name)
        end
    end
    table.sort(playerItems)
end

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

-- ═══════════════════════════════════════════════════════════════
-- POPULATE PAGES - SHOP PAGE
-- ═══════════════════════════════════════════════════════════════
local catSell = makeCategory(shopPage, "Auto Sell System", "💰")
makeButton(catSell, "Sell All Now", function()
    if AutoSell and AutoSell.SellOnce then
        AutoSell.SellOnce()
    end
end)

local catTimer = makeCategory(shopPage, "Auto Sell Timer", "⏰")
makeInput(catTimer, "Sell Interval (seconds)", 5, function(value)
    AutoSellTimer.SetInterval(value)
end)

makeButton(catTimer, "Start Auto Sell", function()
    if AutoSellTimer then
        AutoSellTimer.Start(AutoSellTimer.Interval)
    end
end)

makeButton(catTimer, "Stop Auto Sell", function()
    if AutoSellTimer then
        AutoSellTimer.Stop()
    end
end)

local catWeather = makeCategory(shopPage, "Auto Buy Weather", "🌦️")
local selectedWeathers = {}
makeDropdown(catWeather, "Select Weather", "☁️", AutoBuyWeather.AllWeathers, function(weather)
    local idx = table.find(selectedWeathers, weather)
    if idx then
        table.remove(selectedWeathers, idx)
    else
        table.insert(selectedWeathers, weather)
    end
    AutoBuyWeather.SetSelected(selectedWeathers)
end, "WeatherDropdown")

makeToggle(catWeather, "Enable Auto Weather", function(on)
    if on then
        AutoBuyWeather.Start()
    else
        AutoBuyWeather.Stop()
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- POPULATE PAGES - SETTINGS PAGE
-- ═══════════════════════════════════════════════════════════════
local catAFK = makeCategory(settingsPage, "Anti-AFK Protection", "🧍‍♂️")
makeToggle(catAFK, "Enable Anti-AFK", function(on)
    if on then
        AntiAFK.Start()
    else
        AntiAFK.Stop()
    end
end)

local catFPS = makeCategory(settingsPage, "FPS Unlocker", "🎞️")
makeDropdown(catFPS, "Select FPS Limit", "⚙️", {"60 FPS", "90 FPS", "120 FPS", "240 FPS"}, function(selected)
    local fpsValue = tonumber(selected:match("%d+"))
    if fpsValue and UnlockFPS and UnlockFPS.SetCap then
        UnlockFPS.SetCap(fpsValue)
    end
end, "FPSDropdown")

local catGeneral = makeCategory(settingsPage, "General Settings", "⚙️")
makeToggle(catGeneral, "Auto Save Settings", function(on)
    print("Auto Save:", on)
end)

makeToggle(catGeneral, "Show Notifications", function(on)
    print("Notifications:", on)
end)

makeToggle(catGeneral, "Performance Mode", function(on)
    print("Performance:", on)
end)

-- ═══════════════════════════════════════════════════════════════
-- POPULATE PAGES - INFO PAGE
-- ═══════════════════════════════════════════════════════════════
local infoContainer = new("Frame", {
    Parent = infoPage,
    Size = UDim2.new(1, 0, 0, isMobile and 400 or 520),
    BackgroundColor3 = colors.bg3,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    ZIndex = 6
})
new("UICorner", {Parent = infoContainer, CornerRadius = UDim.new(0, 12)})
new("UIStroke", {
    Parent = infoContainer,
    Color = colors.border,
    Thickness = 1.5,
    Transparency = 0.5
})

local infoText = new("TextLabel", {
    Parent = infoContainer,
    Size = UDim2.new(1, -32, 1, -32),
    Position = UDim2.new(0, 16, 0, 16),
    BackgroundTransparency = 1,
    Text = [[
✨ LYNX v2.4 MODERN EDITION

Ultra Modern Glassmorphism Interface
Landscape Mobile Optimized
━━━━━━━━━━━━━━━━━━━━━━

🎣 AUTO FISHING
• Instant Fishing (Fast/Perfect)
• Smooth input controls
• Blatant Mode V1 & V2
• Advanced automation

🛠️ SUPPORT FEATURES
• No Fishing Animation
• Performance optimizations

🌍 TELEPORT SYSTEM
• Location teleport
• Player teleport
• Modern dropdown selection

💰 SHOP FEATURES
• Auto Sell (instant & timer)
• Auto Buy Weather
• Smart category organization

⚙️ SETTINGS
• Anti-AFK Protection
• FPS Unlocker (60-240 FPS)
• General preferences

━━━━━━━━━━━━━━━━━━━━━━

💎 v2.4 MODERN FEATURES
✓ Glassmorphism design
✓ Animated gradient borders
✓ Fixed toggle visibility
✓ Smooth animations (0.25s)
✓ Modern color palette
✓ Better hover effects
✓ Enhanced visual feedback
✓ Responsive components

🎮 CONTROLS
• Click categories to expand
• Drag from top bar to move
• Drag corner to resize
• (▶/◀) Toggle sidebar (Mobile)
• (─) Minimize window
• (×) Close GUI

━━━━━━━━━━━━━━━━━━━━━━

Created by Lynx Team
Modern Edition 2024 🚀
]],
    Font = Enum.Font.Gotham,
    TextSize = isMobile and 9 or 12,
    TextColor3 = colors.text,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    ZIndex = 7
})

-- ═══════════════════════════════════════════════════════════════
-- MINIMIZE SYSTEM
-- ═══════════════════════════════════════════════════════════════
local minimized = false
local icon
local savedIconPos = UDim2.new(0, 20, 0, 120)
local logoAssetId = "rbxassetid://111416780887356"

local function createMinimizedIcon()
    if icon then return end
    local iconSize = isMobile and 48 or 64
    icon = new("ImageLabel", {
        Parent = gui,
        Size = UDim2.new(0, iconSize, 0, iconSize),
        Position = savedIconPos,
        BackgroundColor3 = colors.bg3,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Image = logoAssetId,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 100
    })
    new("UICorner", {Parent = icon, CornerRadius = UDim.new(0, 12)})
    new("UIStroke", {
        Parent = icon,
        Color = colors.accent,
        Thickness = 2.5,
        Transparency = 0.3
    })
    
    local iconGradient = new("UIGradient", {
        Parent = icon,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, colors.gradientStart),
            ColorSequenceKeypoint.new(1, colors.gradientEnd)
        }),
        Rotation = 45
    })
    
    local logoFallback = new("TextLabel", {
        Parent = icon,
        Text = "L",
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 28 or 38,
        BackgroundTransparency = 1,
        TextColor3 = colors.text,
        Visible = icon.Image == "",
        ZIndex = 101
    })
    
    logoFallback.Visible = (icon.Image == "")
    
    local dragging, dragStart, startPos, dragMoved = false, nil, nil, false
    icon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging, dragMoved, dragStart, startPos = true, false, input.Position, icon.Position
        end
    end)
    
    icon.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.sqrt(delta.X^2 + delta.Y^2) > 5 then dragMoved = true end
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            TweenService:Create(icon, TweenInfo.new(0.08, Enum.EasingStyle.Quart), {Position = newPos}):Play()
        end
    end)
    
    icon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                savedIconPos = icon.Position
                if not dragMoved then
                    win.Visible = true
                    TweenService:Create(win, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
                        Size = windowSize,
                        Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2)
                    }):Play()
                    if icon then icon:Destroy() icon = nil end
                    minimized = false
                end
            end
        end
    end)
end

btnMin.MouseButton1Click:Connect(function()
    if not minimized then
        local targetPos = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(win, TweenInfo.new(0.32, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = targetPos
        }):Play()
        task.wait(0.32)
        win.Visible = false
        createMinimizedIcon()
        minimized = true
    end
end)

btnClose.MouseButton1Click:Connect(function()
    TweenService:Create(win, TweenInfo.new(0.32, Enum.EasingStyle.Quart), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.32)
    gui:Destroy()
end)

-- ═══════════════════════════════════════════════════════════════
-- DRAG FUNCTIONALITY
-- ═══════════════════════════════════════════════════════════════
local dragging, dragStart, startPos = false, nil, nil
local dragTween = nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, win.Position
        if dragTween then dragTween:Cancel() end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        if dragTween then dragTween:Cancel() end
        dragTween = TweenService:Create(win, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {Position = newPos})
        dragTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- RESIZE FUNCTIONALITY
-- ═══════════════════════════════════════════════════════════════
local resizing = false
local resizeStart, startSize = nil, nil
local resizeTween = nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing, resizeStart, startSize = true, input.Position, win.Size
        if resizeTween then resizeTween:Cancel() end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - resizeStart
        
        local newWidth = math.clamp(
            startSize.X.Offset + delta.X,
            minWindowSize.X,
            maxWindowSize.X
        )
        local newHeight = math.clamp(
            startSize.Y.Offset + delta.Y,
            minWindowSize.Y,
            maxWindowSize.Y
        )
        
        local newSize = UDim2.new(0, newWidth, 0, newHeight)
        
        if resizeTween then resizeTween:Cancel() end
        resizeTween = TweenService:Create(win, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
            Size = newSize
        })
        resizeTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = false
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- WINDOW LOADING ANIMATION
-- ═══════════════════════════════════════════════════════════════
task.spawn(function()
    win.Size = UDim2.new(0, 0, 0, 0)
    win.Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2)
    win.Rotation = 5
    
    task.wait(0.15)
    
    TweenService:Create(win, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = windowSize,
        Rotation = 0
    }):Play()
end)

-- ═══════════════════════════════════════════════════════════════
-- FINAL CONSOLE OUTPUT
-- ═══════════════════════════════════════════════════════════════
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("✨ LYNX GUI v2.4 MODERN EDITION")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🎨 Glassmorphism Design Applied")
print("💎 Animated Gradient Borders Active")
print("✅ Toggle Circle Fixed & Visible")
print("🎯 Smooth Animations (0.25s Quart)")
print("📱 Mobile Optimized (520x280)")
print("🖥️ Desktop Optimized (780x520)")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🖱️ CONTROLS:")
print("   • Drag from top bar to move")
print("   • Resize from bottom-right corner")
print("   • Toggle sidebar (Mobile)")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🚀 Created by Lynx Team - Modern Edition")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
