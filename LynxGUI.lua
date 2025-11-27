-- LynxGUI_v2.4.lua - Fixed & Stable Edition
-- OPTIMIZED FOR BOTH MOBILE & PC

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

repeat task.wait() until localPlayer:FindFirstChild("PlayerGui")

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Safe instance creation function
local function new(class, props)
    local success, result = pcall(function()
        local inst = Instance.new(class)
        if props then
            for k, v in pairs(props) do
                if k ~= "Parent" then
                    inst[k] = v
                end
            end
            if props.Parent then
                inst.Parent = props.Parent
            end
        end
        return inst
    end)
    return success and result or nil
end

-- Safe module loading dengan fallback
local function safeLoadModule(name, url, fallback)
    local success, module = pcall(function()
        local content = game:HttpGet(url, true)
        return loadstring(content)()
    end)
    
    if success and module then
        print("✓ " .. name .. " loaded successfully")
        return module
    else
        warn("✗ Failed to load " .. name .. ", using fallback")
        if fallback then
            return fallback
        else
            -- Return dummy module dengan fungsi kosong
            return {
                Start = function() print(name .. " - Fallback Start") end,
                Stop = function() print(name .. " - Fallback Stop") end,
                Settings = {},
                TeleportTo = function() print("Teleport fallback") end,
                SellOnce = function() print("Sell fallback") end,
                SetInterval = function() end,
                SetSelected = function() end,
                SetCap = function() end,
                Locations = {},
                AllWeathers = {"Clear", "Rain", "Snow"}
            }
        end
    end
end

-- Colors dengan fallback
local colors = {
    primary = Color3.fromRGB(180, 180, 180),
    secondary = Color3.fromRGB(140, 140, 140),
    accent = Color3.fromRGB(100, 200, 150),
    success = Color3.fromRGB(100, 200, 120),
    warning = Color3.fromRGB(220, 180, 70),
    danger = Color3.fromRGB(220, 90, 90),
    
    bg1 = Color3.fromRGB(8, 8, 8),
    bg2 = Color3.fromRGB(16, 16, 16),
    bg3 = Color3.fromRGB(26, 26, 26),
    bg4 = Color3.fromRGB(38, 38, 38),
    bg5 = Color3.fromRGB(50, 50, 50),
    
    text = Color3.fromRGB(245, 245, 245),
    textDim = Color3.fromRGB(170, 170, 170),
    textDimmer = Color3.fromRGB(110, 110, 110),
    
    border = Color3.fromRGB(55, 55, 55),
    inputBg = Color3.fromRGB(20, 20, 20),
    inputBorder = Color3.fromRGB(70, 70, 70),
    inputFocus = Color3.fromRGB(100, 180, 140),
}

-- Safe module loading
print("Loading modules...")
local instant = safeLoadModule("Instant", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant.lua")
local instant2 = safeLoadModule("Instant2", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant2.lua")
local instant2x = safeLoadModule("Instant2X", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Instant2Xspeed.lua")
local blatantv2 = safeLoadModule("BlatantV2", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/BlatantV2.lua")
local NoFishingAnimation = safeLoadModule("NoFishingAnimation", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Utama/NoFishingAnimation.lua")
local TeleportModule = safeLoadModule("TeleportModule", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/TeleportModule.lua")
local TeleportToPlayer = safeLoadModule("TeleportToPlayer", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/TeleportSystem/TeleportToPlayer.lua")
local AutoSell = safeLoadModule("AutoSell", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoSell.lua")
local AutoSellTimer = safeLoadModule("AutoSellTimer", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoSellTimer.lua")
local AntiAFK = safeLoadModule("AntiAFK", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Misc/AntiAFK.lua")
local UnlockFPS = safeLoadModule("UnlockFPS", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/Misc/UnlockFPS.lua")
local AutoBuyWeather = safeLoadModule("AutoBuyWeather", "https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/FungsiKeaby/ShopFeatures/AutoBuyWeather.lua")

print("All modules loaded, creating GUI...")

-- Responsive sizing
local windowSize = isMobile and UDim2.new(0,480,0,260) or UDim2.new(0,720,0,480)
local minWindowSize = isMobile and Vector2.new(420, 230) or Vector2.new(620, 420)
local maxWindowSize = isMobile and Vector2.new(580, 340) or Vector2.new(920, 620)

-- Create main GUI dengan safety check
local gui = new("ScreenGui", {
    Name = "LynxGUI_v2.4",
    Parent = localPlayer.PlayerGui,
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999
})

if not gui then
    warn("Failed to create ScreenGui!")
    return
end

-- Main window
local win = new("Frame", {
    Parent = gui,
    Size = UDim2.new(0,0,0,0),
    Position = UDim2.new(0.5,0,0.5,0),
    BackgroundColor3 = colors.bg1,
    BackgroundTransparency = 0.05,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 3,
    Visible = false
})

if not win then
    warn("Failed to create main window!")
    return
end

new("UICorner", {Parent = win, CornerRadius = UDim.new(0,12)})

-- Overlay
local overlay = new("Frame", {
    Parent = win,
    Size = UDim2.new(1,0,1,0),
    BackgroundColor3 = colors.bg1,
    BackgroundTransparency = 0.92,
    BorderSizePixel = 0,
    ZIndex = 2
})
new("UICorner", {Parent = overlay, CornerRadius = UDim.new(0,12)})

-- Border
local border = new("UIStroke", {
    Parent = win,
    Color = colors.border,
    Thickness = 1.8,
    Transparency = 0.15,
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})

-- Sidebar setup
local sidebarExpanded = false
local sidebarCollapsedWidth = isMobile and 48 or 60
local sidebarExpandedWidth = isMobile and 160 or 200

local sidebar = new("Frame", {
    Parent = win,
    Size = isMobile and UDim2.new(0,sidebarCollapsedWidth,1,0) or UDim2.new(0,sidebarCollapsedWidth,1,0),
    BackgroundColor3 = colors.bg2,
    BackgroundTransparency = 0.05,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 4
})
new("UICorner", {Parent = sidebar, CornerRadius = UDim.new(0,12)})

-- Sidebar toggle
local sidebarToggle = new("TextButton", {
    Parent = win,
    Size = isMobile and UDim2.new(0,28,0,46) or UDim2.new(0,32,0,50),
    Position = isMobile and UDim2.new(0,sidebarCollapsedWidth-4,1,-58) or UDim2.new(0,sidebarCollapsedWidth-4,1,-62),
    BackgroundColor3 = colors.bg4,
    BackgroundTransparency = 0.1,
    BorderSizePixel = 0,
    Text = "▶",
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 12 or 14,
    TextColor3 = colors.textDim,
    ZIndex = 101,
    ClipsDescendants = false
})
new("UICorner", {Parent = sidebarToggle, CornerRadius = UDim.new(0,8)})
new("UIStroke", {Parent = sidebarToggle, Color = colors.border, Thickness = 1, Transparency = 0.4})

-- Sidebar header
local sidebarHeader = new("Frame", {
    Parent = sidebar,
    Size = isMobile and UDim2.new(1,0,0,58) or UDim2.new(1,0,0,74),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    ZIndex = 5
})

local brandName = new("TextLabel", {
    Parent = sidebarHeader,
    Text = "LYNX",
    Size = UDim2.new(1,0,0,26),
    Position = isMobile and UDim2.new(0,0,0,18) or UDim2.new(0,0,0,24),
    Font = Enum.Font.GothamBlack,
    TextSize = isMobile and 16 or 20,
    BackgroundTransparency = 1,
    TextColor3 = colors.accent,
    Visible = not isMobile,
    ZIndex = 6
})

local brandVersion = new("TextLabel", {
    Parent = sidebarHeader,
    Text = "v2.4",
    Size = UDim2.new(1,0,0,16),
    Position = isMobile and UDim2.new(0,0,0,42) or UDim2.new(0,0,0,50),
    Font = Enum.Font.GothamMedium,
    TextSize = 10,
    BackgroundTransparency = 1,
    TextColor3 = colors.textDim,
    Visible = not isMobile,
    ZIndex = 6
})

-- Navigation container
local navContainer = new("ScrollingFrame", {
    Parent = sidebar,
    Size = isMobile and UDim2.new(1,-6,1,-62) or UDim2.new(1,-18,1,-84),
    Position = isMobile and UDim2.new(0,3,0,60) or UDim2.new(0,9,0,76),
    BackgroundTransparency = 1,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = colors.accent,
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0,0,0,0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ClipsDescendants = true,
    ZIndex = 5
})
new("UIListLayout", {
    Parent = navContainer,
    Padding = UDim.new(0,isMobile and 5 or 8),
    SortOrder = Enum.SortOrder.LayoutOrder
})

-- Content background
local contentBg = new("Frame", {
    Parent = win,
    Size = isMobile and UDim2.new(1,-56,1,-12) or UDim2.new(1,-200,1,-14),
    Position = isMobile and UDim2.new(0,52,0,7) or UDim2.new(0,195,0,9),
    BackgroundColor3 = colors.bg2,
    BackgroundTransparency = 0.08,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 4
})
new("UICorner", {Parent = contentBg, CornerRadius = UDim.new(0,10)})

-- Initialize pages and navigation
local pages = {}
local currentPage = "Main"
local navButtons = {}

-- Enhanced sidebar toggle function
local function toggleSidebar()
    if not isMobile then return end
    
    sidebarExpanded = not sidebarExpanded
    local targetWidth = sidebarExpanded and sidebarExpandedWidth or sidebarCollapsedWidth
    
    local sidebarTween = TweenService:Create(sidebar, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, targetWidth, 1, 0)
    })
    
    local contentTween = TweenService:Create(contentBg, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, -(targetWidth + 8), 1, -12),
        Position = UDim2.new(0, targetWidth + 6, 0, 7)
    })
    
    local toggleTween = TweenService:Create(sidebarToggle, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, targetWidth - 4, 1, -58)
    })
    
    sidebarTween:Play()
    contentTween:Play()
    toggleTween:Play()
    
    sidebarToggle.Text = sidebarExpanded and "◀" or "▶"
    
    brandName.Visible = sidebarExpanded
    brandVersion.Visible = sidebarExpanded
    
    for _, btnData in pairs(navButtons) do
        if btnData.text then
            btnData.text.Visible = sidebarExpanded
            btnData.icon.Size = sidebarExpanded and UDim2.new(0,32,1,0) or UDim2.new(1,0,1,0)
            btnData.icon.Position = sidebarExpanded and UDim2.new(0,10,0,0) or UDim2.new(0,0,0,0)
        end
    end
end

sidebarToggle.MouseButton1Click:Connect(toggleSidebar)

-- Top bar
local topBar = new("Frame", {
    Parent = contentBg,
    Size = UDim2.new(1,0,0,isMobile and 34 or 48),
    BackgroundColor3 = colors.bg3,
    BackgroundTransparency = 0.12,
    BorderSizePixel = 0,
    ZIndex = 5
})
new("UICorner", {Parent = topBar, CornerRadius = UDim.new(0,10)})

local dragHandle = new("Frame", {
    Parent = topBar,
    Size = isMobile and UDim2.new(0,26,0,3) or UDim2.new(0,42,0,4),
    Position = isMobile and UDim2.new(0.5,-13,0,6) or UDim2.new(0.5,-21,0,8),
    BackgroundColor3 = colors.primary,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    ZIndex = 6
})
new("UICorner", {Parent = dragHandle, CornerRadius = UDim.new(1,0)})

local pageTitle = new("TextLabel", {
    Parent = topBar,
    Text = "Dashboard",
    Size = UDim2.new(1,-55,1,0),
    Position = UDim2.new(0,isMobile and 10 or 16,0,0),
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 11 or 16,
    BackgroundTransparency = 1,
    TextColor3 = colors.text,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 6
})

local controlsFrame = new("Frame", {
    Parent = topBar,
    Size = isMobile and UDim2.new(0,46,0,24) or UDim2.new(0,70,0,32),
    Position = isMobile and UDim2.new(1,-50,0.5,-12) or UDim2.new(1,-74,0.5,-16),
    BackgroundTransparency = 1,
    ZIndex = 6
})
new("UIListLayout", {
    Parent = controlsFrame,
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0,isMobile and 4 or 7)
})

local function createControlBtn(icon, color)
    local btnSize = isMobile and 24 or 32
    local btn = new("TextButton", {
        Parent = controlsFrame,
        Size = UDim2.new(0,btnSize,0,btnSize),
        BackgroundColor3 = colors.bg4,
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Text = icon,
        Font = Enum.Font.GothamBold,
        TextSize = (icon == "×" and (isMobile and 16 or 22)) or (isMobile and 12 or 16),
        TextColor3 = colors.textDim,
        AutoButtonColor = false,
        ZIndex = 7
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0,isMobile and 6 or 8)})
    new("UIStroke", {Parent = btn, Color = colors.border, Thickness = 1, Transparency = 0.5})
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = color,
            BackgroundTransparency = 0.05,
            TextColor3 = colors.text
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = colors.bg4,
            BackgroundTransparency = 0.1,
            TextColor3 = colors.textDim
        }):Play()
    end)
    return btn
end

local btnMin = createControlBtn("─", colors.warning)
local btnClose = createControlBtn("×", colors.danger)

local resizeHandle = new("TextButton", {
    Parent = win,
    Size = isMobile and UDim2.new(0,18,0,18) or UDim2.new(0,24,0,24),
    Position = isMobile and UDim2.new(1,-18,1,-18) or UDim2.new(1,-24,1,-24),
    BackgroundColor3 = colors.bg5,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    Text = "⋰",
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 10 or 14,
    TextColor3 = colors.textDim,
    AutoButtonColor = false,
    ZIndex = 100
})
new("UICorner", {Parent = resizeHandle, CornerRadius = UDim.new(0,6)})
new("UIStroke", {Parent = resizeHandle, Color = colors.border, Thickness = 1, Transparency = 0.4})

-- Page creation function
local function createPage(name)
    local page = new("ScrollingFrame", {
        Parent = contentBg,
        Size = UDim2.new(1,-10,1,-(isMobile and 40 or 56)),
        Position = UDim2.new(0,5,0,isMobile and 38 or 52),
        BackgroundTransparency = 1,
        ScrollBarThickness = isMobile and 4 or 5,
        ScrollBarImageColor3 = colors.accent,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0,0,0,0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 5
    })
    new("UIListLayout", {
        Parent = page,
        Padding = UDim.new(0,isMobile and 7 or 11),
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    new("UIPadding", {
        Parent = page,
        PaddingTop = UDim.new(0,isMobile and 5 or 9),
        PaddingBottom = UDim.new(0,isMobile and 5 or 9)
    })
    pages[name] = page
    return page
end

-- Create pages
local mainPage = createPage("Main")
local teleportPage = createPage("Teleport")
local shopPage = createPage("Shop")
local settingsPage = createPage("Settings")
local infoPage = createPage("Info")
mainPage.Visible = true

-- Navigation button creation
local function createNavButton(text, icon, page, order)
    local btn = new("TextButton", {
        Parent = navContainer,
        Size = isMobile and UDim2.new(1,0,0,40) or UDim2.new(1,0,0,50),
        BackgroundColor3 = page == currentPage and colors.bg4 or Color3.fromRGB(0,0,0),
        BackgroundTransparency = page == currentPage and 0.12 or 1,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = order,
        ZIndex = 6
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0,9)})
    
    local indicator = new("Frame", {
        Parent = btn,
        Size = isMobile and UDim2.new(0,4,0,16) or UDim2.new(0,5,0,22),
        Position = UDim2.new(0,0,0.5,isMobile and -8 or -11),
        BackgroundColor3 = colors.accent,
        BorderSizePixel = 0,
        Visible = page == currentPage,
        ZIndex = 7
    })
    new("UICorner", {Parent = indicator, CornerRadius = UDim.new(1,0)})
    
    local iconLabel = new("TextLabel", {
        Parent = btn,
        Text = icon,
        Size = isMobile and UDim2.new(1,0,1,0) or UDim2.new(0,34,1,0),
        Position = isMobile and UDim2.new(0,0,0,0) or UDim2.new(0,12,0,0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 15 or 19,
        TextColor3 = page == currentPage and colors.accent or colors.textDim,
        ZIndex = 7
    })
    
    local textLabel = new("TextLabel", {
        Parent = btn,
        Text = text,
        Size = UDim2.new(1,-55,1,0),
        Position = UDim2.new(0,50,0,0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 12,
        TextColor3 = page == currentPage and colors.text or colors.textDim,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = not isMobile,
        ZIndex = 7
    })
    
    navButtons[page] = {btn = btn, icon = iconLabel, text = textLabel, indicator = indicator}
    
    return btn
end

-- Page switching function
local function switchPage(pageName, pageTitle_text)
    if currentPage == pageName then return end
    for _, page in pairs(pages) do 
        if page then
            page.Visible = false 
        end
    end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        TweenService:Create(btnData.btn, TweenInfo.new(0.2), {
            BackgroundColor3 = isActive and colors.bg4 or Color3.fromRGB(0,0,0),
            BackgroundTransparency = isActive and 0.12 or 1
        }):Play()
        if btnData.indicator then
            btnData.indicator.Visible = isActive
        end
        TweenService:Create(btnData.icon, TweenInfo.new(0.2), {
            TextColor3 = isActive and colors.accent or colors.textDim
        }):Play()
        if not isMobile and btnData.text then
            TweenService:Create(btnData.text, TweenInfo.new(0.2), {
                TextColor3 = isActive and colors.text or colors.textDim
            }):Play()
        end
    end
    
    if pages[pageName] then
        pages[pageName].Visible = true
    end
    pageTitle.Text = pageTitle_text
    currentPage = pageName
    
    if isMobile and sidebarExpanded then
        task.wait(0.3)
        toggleSidebar()
    end
end

-- Create navigation buttons
local btnMain = createNavButton("Dashboard", "🏠", "Main", 1)
local btnTeleport = createNavButton("Teleport", "🌍", "Teleport", 2)
local btnShop = createNavButton("Shop", "🛒", "Shop", 3)
local btnSettings = createNavButton("Settings", "⚙️", "Settings", 4)
local btnInfo = createNavButton("About", "ℹ️", "Info", 5)

-- Connect navigation buttons
if btnMain then btnMain.MouseButton1Click:Connect(function() switchPage("Main", "Dashboard") end) end
if btnTeleport then btnTeleport.MouseButton1Click:Connect(function() switchPage("Teleport", "Teleport") end) end
if btnShop then btnShop.MouseButton1Click:Connect(function() switchPage("Shop", "Shop") end) end
if btnSettings then btnSettings.MouseButton1Click:Connect(function() switchPage("Settings", "Settings") end) end
if btnInfo then btnInfo.MouseButton1Click:Connect(function() switchPage("Info", "About") end) end

-- Basic UI element creators (simplified untuk menghindari error)
local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1,0,0,isMobile and 40 or 54),
        BackgroundColor3 = colors.bg3,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = false,
        ZIndex = 6
    })
    
    if categoryFrame then
        new("UICorner", {Parent = categoryFrame, CornerRadius = UDim.new(0,9)})
        
        local header = new("TextButton", {
            Parent = categoryFrame,
            Size = UDim2.new(1,0,0,isMobile and 40 or 54),
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 7
        })
        
        local iconLabel = new("TextLabel", {
            Parent = header,
            Text = icon,
            Size = isMobile and UDim2.new(0,28,0,28) or UDim2.new(0,36,0,36),
            Position = isMobile and UDim2.new(0,10,0.5,-14) or UDim2.new(0,12,0.5,-18),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = isMobile and 13 or 17,
            TextColor3 = colors.accent,
            ZIndex = 8
        })
        
        local titleLabel = new("TextLabel", {
            Parent = header,
            Text = title,
            Size = UDim2.new(1,-75,1,0),
            Position = isMobile and UDim2.new(0,40,0,0) or UDim2.new(0,50,0,0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = isMobile and 11 or 14,
            TextColor3 = colors.text,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 8
        })
        
        local contentContainer = new("Frame", {
            Parent = categoryFrame,
            Size = isMobile and UDim2.new(1,-16,0,0) or UDim2.new(1,-20,0,0),
            Position = isMobile and UDim2.new(0,8,0,44) or UDim2.new(0,10,0,58),
            BackgroundTransparency = 1,
            Visible = false,
            AutomaticSize = Enum.AutomaticSize.Y,
            ClipsDescendants = true,
            ZIndex = 7
        })
        
        if contentContainer then
            new("UIListLayout", {Parent = contentContainer, Padding = UDim.new(0,isMobile and 6 or 9)})
            new("UIPadding", {Parent = contentContainer, PaddingBottom = UDim.new(0,isMobile and 9 or 13)})
        end
        
        header.MouseButton1Click:Connect(function()
            contentContainer.Visible = not contentContainer.Visible
        end)
        
        return contentContainer
    end
    return nil
end

-- FIXED toggle function dengan safety checks
local function makeToggle(parent, label, callback)
    local frame = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1,0,0,isMobile and 32 or 40),
        BackgroundTransparency = 1,
        ZIndex = 7
    })
    
    if not frame then return nil end
    
    local labelText = new("TextLabel", {
        Parent = frame,
        Text = label,
        Size = UDim2.new(0.68,0,1,0),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextColor3 = colors.text,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 10 or 13,
        TextWrapped = true,
        ZIndex = 8
    })
    
    local toggleBg = new("Frame", {
        Parent = frame,
        Size = isMobile and UDim2.new(0,44,0,24) or UDim2.new(0,52,0,28),
        Position = isMobile and UDim2.new(1,-46,0.5,-12) or UDim2.new(1,-54,0.5,-14),
        BackgroundColor3 = colors.bg5,
        BorderSizePixel = 0,
        ZIndex = 8
    })
    
    if toggleBg then
        new("UICorner", {Parent = toggleBg, CornerRadius = UDim.new(1,0)})
        
        local toggleCircle = new("Frame", {
            Parent = toggleBg,
            Size = isMobile and UDim2.new(0,18,0,18) or UDim2.new(0,22,0,22),
            Position = isMobile and UDim2.new(0,3,0.5,-9) or UDim2.new(0,3,0.5,-11),
            BackgroundColor3 = colors.textDim,
            BorderSizePixel = 0,
            ZIndex = 9
        })
        
        if toggleCircle then
            new("UICorner", {Parent = toggleCircle, CornerRadius = UDim.new(1,0)})
            
            local enabled = false
            local toggleBtn = new("TextButton", {
                Parent = toggleBg,
                Size = UDim2.new(1,0,1,0),
                BackgroundTransparency = 1,
                Text = "",
                ZIndex = 10
            })
            
            toggleBtn.MouseButton1Click:Connect(function()
                enabled = not enabled
                local circlePos = enabled and (isMobile and UDim2.new(1,-21,0.5,-9) or UDim2.new(1,-25,0.5,-11)) or (isMobile and UDim2.new(0,3,0.5,-9) or UDim2.new(0,3,0.5,-11))
                
                TweenService:Create(toggleCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
                    Position = circlePos,
                    BackgroundColor3 = enabled and colors.text or colors.textDim
                }):Play()
                
                TweenService:Create(toggleBg, TweenInfo.new(0.25), {
                    BackgroundColor3 = enabled and colors.accent or colors.bg5
                }):Play()
                
                if callback then 
                    pcall(callback, enabled) 
                end
            end)
        end
    end
    
    return frame
end

-- Create basic content untuk testing
local catTest = makeCategory(mainPage, "Test Features", "🔧")
if catTest then
    makeToggle(catTest, "Test Toggle", function(on)
        print("Test Toggle:", on)
    end)
end

-- Window management
local minimized = false

local function openWindow()
    win.Visible = true
    local sizeTween = TweenService:Create(win, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = windowSize,
        Position = UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2)
    })
    sizeTween:Play()
end

btnMin.MouseButton1Click:Connect(function()
    if not minimized then
        local targetPos = UDim2.new(0.5,0,0.5,0)
        TweenService:Create(win, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0,0,0,0),
            Position = targetPos
        }):Play()
        task.wait(0.35)
        win.Visible = false
        minimized = true
    else
        openWindow()
        minimized = false
    end
end)

btnClose.MouseButton1Click:Connect(function()
    TweenService:Create(win, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0,0,0,0),
        Position = UDim2.new(0.5,0,0.5,0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.4)
    gui:Destroy()
end)

-- Dragging functionality
local dragging, dragStart, startPos = false, nil, nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, win.Position
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
        win.Position = newPos
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end
end)

-- Resizing functionality
local resizing, resizeStart, startSize = false, nil, nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing, resizeStart, startSize = true, input.Position, win.Size
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
        
        win.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        resizing = false 
    end
end)

-- Initialize window
task.spawn(function()
    task.wait(0.5)
    openWindow()
end)

print("⚫ Lynx GUI v2.4 Fixed Edition loaded successfully!")
print("🎯 Stable version with error handling")
print("📱 Mobile & PC Optimized")
print("🔧 Safe module loading with fallbacks")
print("💎 Created by Lynx Team")
