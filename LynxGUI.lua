-- LynxGUI_v2.2.lua - Ultra Minimalist Black Edition
-- LANDSCAPE OPTIMIZED FOR MOBILE (Horizontal Rectangle)

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

repeat task.wait() until localPlayer:FindFirstChild("PlayerGui")

-- Detect if mobile
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local function new(class, props)
    local inst = Instance.new(class)
    for k,v in pairs(props or {}) do inst[k] = v end
    return inst
end

-- Load modules
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

-- Minimalist Black Color Palette
local colors = {
    primary = Color3.fromRGB(200, 200, 200),       -- Light gray
    secondary = Color3.fromRGB(150, 150, 150),     -- Medium gray
    accent = Color3.fromRGB(100, 100, 100),        -- Dark gray
    success = Color3.fromRGB(120, 200, 120),       -- Green
    warning = Color3.fromRGB(200, 180, 80),        -- Amber
    danger = Color3.fromRGB(200, 100, 100),        -- Red
    
    bg1 = Color3.fromRGB(10, 10, 10),              -- Deep black
    bg2 = Color3.fromRGB(20, 20, 20),              -- Dark gray
    bg3 = Color3.fromRGB(30, 30, 30),              -- Medium dark gray
    bg4 = Color3.fromRGB(40, 40, 40),              -- Lighter gray
    
    text = Color3.fromRGB(240, 240, 240),
    textDim = Color3.fromRGB(180, 180, 180),
    textDimmer = Color3.fromRGB(120, 120, 120),
    
    border = Color3.fromRGB(60, 60, 60),
    glow = Color3.fromRGB(80, 80, 80),
}

-- LANDSCAPE Window Sizing - Horizontal Rectangle for Mobile
local windowSize = isMobile and UDim2.new(0,460,0,250) or UDim2.new(0,700,0,460)
local minWindowSize = isMobile and Vector2.new(400, 220) or Vector2.new(600, 400)
local maxWindowSize = isMobile and Vector2.new(560, 320) or Vector2.new(900, 600)

local gui = new("ScreenGui",{
    Name="LynxGUI_Minimalist",
    Parent=localPlayer.PlayerGui,
    IgnoreGuiInset=true,
    ResetOnSpawn=false,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    DisplayOrder=999
})

-- Main Window Container with Transparent Black effect
local win = new("Frame",{
    Parent=gui,
    Size=windowSize,
    Position=UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0.1,
    BorderSizePixel=0,
    ClipsDescendants=false,
    ZIndex=3
})
new("UICorner",{Parent=win,CornerRadius=UDim.new(0,8)}) -- Less rounded corners

-- Transparent overlay
local overlay = new("Frame",{
    Parent=win,
    Size=UDim2.new(1,0,1,0),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0.9,
    BorderSizePixel=0,
    ZIndex=2
})
new("UICorner",{Parent=overlay,CornerRadius=UDim.new(0,8)})

-- Simple border
local border = new("UIStroke",{
    Parent=win,
    Color=colors.border,
    Thickness=1,
    Transparency=0.3,
    ApplyStrokeMode=Enum.ApplyStrokeMode.Border
})

-- Sidebar state for mobile toggle
local sidebarExpanded = false
local sidebarCollapsedWidth = 45
local sidebarExpandedWidth = 150

-- Sidebar with minimal design
local sidebar = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(0,sidebarCollapsedWidth,1,0) or UDim2.new(0,180,1,0),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0.1,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=sidebar,CornerRadius=UDim.new(0,8)})

-- Mobile Sidebar Toggle Button
local sidebarToggle
if isMobile then
    sidebarToggle = new("TextButton",{
        Parent=win,
        Size=UDim2.new(0,24,0,40),
        Position=UDim2.new(0,sidebarCollapsedWidth-2,1,-50),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        Text="▶",
        Font=Enum.Font.GothamBold,
        TextSize=12,
        TextColor3=colors.textDim,
        ZIndex=101,
        ClipsDescendants=false
    })
    new("UICorner",{Parent=sidebarToggle,CornerRadius=UDim.new(0,6)})
end

-- Sidebar Header - Compact
local sidebarHeader = new("Frame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,0,0,50) or UDim2.new(1,0,0,90),
    BackgroundTransparency=1,
    ClipsDescendants=true,
    ZIndex=5
})

-- Logo Container - Minimal
local logoContainer = new("ImageLabel",{
    Parent=sidebarHeader,
    Size=isMobile and UDim2.new(0,26,0,26) or UDim2.new(0,50,0,50),
    Position=isMobile and UDim2.new(0.5,-13,0,8) or UDim2.new(0.5,-25,0,15),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    Image="rbxassetid://111416780887356",
    ScaleType=Enum.ScaleType.Fit,
    ImageTransparency=0,
    ZIndex=6
})
new("UICorner",{Parent=logoContainer,CornerRadius=UDim.new(0,6)})

local brandName = new("TextLabel",{
    Parent=sidebarHeader,
    Text="LYNX",
    Size=UDim2.new(1,0,0,18),
    Position=isMobile and UDim2.new(0,0,0,38) or UDim2.new(0,0,0,68),
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 12 or 16,
    BackgroundTransparency=1,
    TextColor3=colors.text,
    Visible=isMobile and sidebarExpanded or not isMobile,
    ZIndex=6
})

local brandVersion = new("TextLabel",{
    Parent=sidebarHeader,
    Text="v2.2",
    Size=UDim2.new(1,0,0,12),
    Position=UDim2.new(0,0,0,90),
    Font=Enum.Font.Gotham,
    TextSize=9,
    BackgroundTransparency=1,
    TextColor3=colors.textDim,
    Visible=not isMobile,
    ZIndex=6
})

-- Navigation Container
local navContainer = new("ScrollingFrame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,-4,1,-55) or UDim2.new(1,-16,1,-105),
    Position=isMobile and UDim2.new(0,2,0,52) or UDim2.new(0,8,0,95),
    BackgroundTransparency=1,
    ScrollBarThickness=2,
    ScrollBarImageColor3=colors.primary,
    BorderSizePixel=0,
    CanvasSize=UDim2.new(0,0,0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ClipsDescendants=true,
    ZIndex=5
})
new("UIListLayout",{
    Parent=navContainer,
    Padding=UDim.new(0,isMobile and 3 or 6),
    SortOrder=Enum.SortOrder.LayoutOrder
})

-- Content Area
local contentBg = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(1,-53,1,-10) or UDim2.new(1,-190,1,-12),
    Position=isMobile and UDim2.new(0,49,0,6) or UDim2.new(0,185,0,8),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0.15,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=contentBg,CornerRadius=UDim.new(0,8)})

-- Function to toggle sidebar on mobile
local function toggleSidebar()
    if not isMobile then return end
    
    sidebarExpanded = not sidebarExpanded
    local targetWidth = sidebarExpanded and sidebarExpandedWidth or sidebarCollapsedWidth
    
    TweenService:Create(sidebar,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
        Size=UDim2.new(0,targetWidth,1,0)
    }):Play()
    
    TweenService:Create(contentBg,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
        Size=UDim2.new(1,-(targetWidth+6),1,-10),
        Position=UDim2.new(0,targetWidth+4,0,6)
    }):Play()
    
    if sidebarToggle then
        TweenService:Create(sidebarToggle,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
            Position=UDim2.new(0,targetWidth-2,1,-50)
        }):Play()
        sidebarToggle.Text = sidebarExpanded and "◀" or "▶"
    end
    
    brandName.Visible = sidebarExpanded
    
    for _, btnData in pairs(navButtons) do
        if btnData.text then
            btnData.text.Visible = sidebarExpanded
            btnData.icon.Size = sidebarExpanded and UDim2.new(0,28,1,0) or UDim2.new(1,0,1,0)
            btnData.icon.Position = sidebarExpanded and UDim2.new(0,6,0,0) or UDim2.new(0,0,0,0)
        end
    end
end

if sidebarToggle then
    sidebarToggle.MouseButton1Click:Connect(toggleSidebar)
end

-- Top bar with controls - Minimal
local topBar = new("Frame",{
    Parent=contentBg,
    Size=UDim2.new(1,0,0,isMobile and 28 or 42),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    ZIndex=5
})
new("UICorner",{Parent=topBar,CornerRadius=UDim.new(0,8)})

-- Simple drag handle
local dragHandle = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,20,0,2) or UDim2.new(0,35,0,3),
    Position=isMobile and UDim2.new(0.5,-10,0,4) or UDim2.new(0.5,-17.5,0,6),
    BackgroundColor3=colors.primary,
    BackgroundTransparency=0.3,
    BorderSizePixel=0,
    ZIndex=6
})
new("UICorner",{Parent=dragHandle,CornerRadius=UDim.new(1,0)})

local pageTitle = new("TextLabel",{
    Parent=topBar,
    Text="Dashboard",
    Size=UDim2.new(1,-50,1,0),
    Position=UDim2.new(0,isMobile and 6 or 12,0,0),
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 9 or 14,
    BackgroundTransparency=1,
    TextColor3=colors.text,
    TextXAlignment=Enum.TextXAlignment.Left,
    ZIndex=6
})

-- Control buttons - Minimal
local controlsFrame = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,40,0,20) or UDim2.new(0,60,0,28),
    Position=isMobile and UDim2.new(1,-44,0.5,-10) or UDim2.new(1,-64,0.5,-14),
    BackgroundTransparency=1,
    ZIndex=6
})
new("UIListLayout",{
    Parent=controlsFrame,
    FillDirection=Enum.FillDirection.Horizontal,
    Padding=UDim.new(0,isMobile and 2 or 5)
})

local function createControlBtn(icon, color)
    local btnSize = isMobile and 20 or 28
    local btn = new("TextButton",{
        Parent=controlsFrame,
        Size=UDim2.new(0,btnSize,0,btnSize),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        Text=icon,
        Font=Enum.Font.GothamBold,
        TextSize=(icon == "×" and (isMobile and 12 or 18)) or (isMobile and 9 or 14),
        TextColor3=colors.textDim,
        AutoButtonColor=false,
        ZIndex=7
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,isMobile and 4 or 6)})
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.15),{
            BackgroundColor3=color,
            BackgroundTransparency=0.1,
            TextColor3=colors.text
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.15),{
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.2,
            TextColor3=colors.textDim
        }):Play()
    end)
    return btn
end

local btnMin = createControlBtn("─", colors.warning)
local btnClose = createControlBtn("×", colors.danger)

-- Simple resize handle
local resizeHandle = new("TextButton",{
    Parent=win,
    Size=isMobile and UDim2.new(0,14,0,14) or UDim2.new(0,20,0,20),
    Position=isMobile and UDim2.new(1,-14,1,-14) or UDim2.new(1,-20,1,-20),
    BackgroundColor3=colors.bg4,
    BackgroundTransparency=0.3,
    BorderSizePixel=0,
    Text="⋰",
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 8 or 12,
    TextColor3=colors.textDim,
    AutoButtonColor=false,
    ZIndex=100
})
new("UICorner",{Parent=resizeHandle,CornerRadius=UDim.new(0,4)})

-- Pages
local pages = {}
local currentPage = "Main"
local navButtons = {}

local function createPage(name)
    local page = new("ScrollingFrame",{
        Parent=contentBg,
        Size=UDim2.new(1,-8,1,-(isMobile and 34 or 50)),
        Position=UDim2.new(0,4,0,isMobile and 32 or 46),
        BackgroundTransparency=1,
        ScrollBarThickness=isMobile and 2 or 3,
        ScrollBarImageColor3=colors.primary,
        BorderSizePixel=0,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
        ClipsDescendants=true,
        ZIndex=5
    })
    new("UIListLayout",{
        Parent=page,
        Padding=UDim.new(0,isMobile and 5 or 8),
        SortOrder=Enum.SortOrder.LayoutOrder
    })
    new("UIPadding",{
        Parent=page,
        PaddingTop=UDim.new(0,isMobile and 3 or 6),
        PaddingBottom=UDim.new(0,isMobile and 3 or 6)
    })
    pages[name] = page
    return page
end

local mainPage = createPage("Main")
local teleportPage = createPage("Teleport")
local shopPage = createPage("Shop")
local settingsPage = createPage("Settings")
local infoPage = createPage("Info")
mainPage.Visible = true

-- Minimal Nav Button
local function createNavButton(text, icon, page, order)
    local btn = new("TextButton",{
        Parent=navContainer,
        Size=isMobile and UDim2.new(1,0,0,34) or UDim2.new(1,0,0,42),
        BackgroundColor3=page == currentPage and colors.bg3 or Color3.fromRGB(0,0,0),
        BackgroundTransparency=page == currentPage and 0.2 or 1,
        BorderSizePixel=0,
        Text="",
        AutoButtonColor=false,
        LayoutOrder=order,
        ZIndex=6
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,6)})
    
    local indicator = new("Frame",{
        Parent=btn,
        Size=isMobile and UDim2.new(0,2,0,12) or UDim2.new(0,3,0,18),
        Position=UDim2.new(0,0,0.5,isMobile and -6 or -9),
        BackgroundColor3=colors.primary,
        BorderSizePixel=0,
        Visible=page == currentPage,
        ZIndex=7
    })
    new("UICorner",{Parent=indicator,CornerRadius=UDim.new(1,0)})
    
    local iconLabel = new("TextLabel",{
        Parent=btn,
        Text=icon,
        Size=isMobile and UDim2.new(1,0,1,0) or UDim2.new(0,28,1,0),
        Position=isMobile and UDim2.new(0,0,0,0) or UDim2.new(0,8,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 12 or 16,
        TextColor3=page == currentPage and colors.primary or colors.textDim,
        ZIndex=7
    })
    
    local textLabel = new("TextLabel",{
        Parent=btn,
        Text=text,
        Size=UDim2.new(1,-46,1,0),
        Position=UDim2.new(0,42,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamSemibold,
        TextSize=10,
        TextColor3=page == currentPage and colors.text or colors.textDim,
        TextXAlignment=Enum.TextXAlignment.Left,
        Visible=isMobile and sidebarExpanded or not isMobile,
        ZIndex=7
    })
    
    navButtons[page] = {btn=btn, icon=iconLabel, text=textLabel, indicator=indicator}
    
    return btn
end

local function switchPage(pageName, pageTitle_text)
    if currentPage == pageName then return end
    for _, page in pairs(pages) do page.Visible = false end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        TweenService:Create(btnData.btn,TweenInfo.new(0.15),{
            BackgroundColor3=isActive and colors.bg3 or Color3.fromRGB(0,0,0),
            BackgroundTransparency=isActive and 0.2 or 1
        }):Play()
        btnData.indicator.Visible = isActive
        TweenService:Create(btnData.icon,TweenInfo.new(0.15),{
            TextColor3=isActive and colors.primary or colors.textDim
        }):Play()
        if not isMobile or sidebarExpanded then
            TweenService:Create(btnData.text,TweenInfo.new(0.15),{
                TextColor3=isActive and colors.text or colors.textDim
            }):Play()
        end
    end
    
    pages[pageName].Visible = true
    pageTitle.Text = pageTitle_text
    currentPage = pageName
    
    if isMobile and sidebarExpanded then
        task.wait(0.2)
        toggleSidebar()
    end
end

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

-- Modern Category - Minimal
local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 34 or 46),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.3,
        BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=false,
        ZIndex=6
    })
    new("UICorner",{Parent=categoryFrame,CornerRadius=UDim.new(0,6)})
    
    local header = new("TextButton",{
        Parent=categoryFrame,
        Size=UDim2.new(1,0,0,isMobile and 34 or 46),
        BackgroundTransparency=1,
        Text="",
        AutoButtonColor=false,
        ClipsDescendants=true,
        ZIndex=7
    })
    new("UICorner",{Parent=header,CornerRadius=UDim.new(0,6)})
    
    local iconLabel = new("TextLabel",{
        Parent=header,
        Text=icon,
        Size=isMobile and UDim2.new(0,22,0,22) or UDim2.new(0,30,0,30),
        Position=isMobile and UDim2.new(0,6,0.5,-11) or UDim2.new(0,8,0.5,-15),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 10 or 14,
        TextColor3=colors.primary,
        ZIndex=8
    })
    
    local titleLabel = new("TextLabel",{
        Parent=header,
        Text=title,
        Size=UDim2.new(1,-60,1,0),
        Position=isMobile and UDim2.new(0,30,0,0) or UDim2.new(0,42,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8.5 or 12,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=8
    })
    
    local arrow = new("TextLabel",{
        Parent=header,
        Text="▼",
        Size=UDim2.new(0,isMobile and 14 or 18,1,0),
        Position=isMobile and UDim2.new(1,-16,0,0) or UDim2.new(1,-22,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8 or 11,
        TextColor3=colors.primary,
        ZIndex=8
    })
    
    local contentContainer = new("Frame",{
        Parent=categoryFrame,
        Size=isMobile and UDim2.new(1,-12,0,0) or UDim2.new(1,-16,0,0),
        Position=isMobile and UDim2.new(0,6,0,38) or UDim2.new(0,8,0,52),
        BackgroundTransparency=1,
        Visible=false,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,
        ZIndex=7
    })
    new("UIListLayout",{Parent=contentContainer,Padding=UDim.new(0,isMobile and 4 or 6)})
    new("UIPadding",{Parent=contentContainer,PaddingBottom=UDim.new(0,isMobile and 6 or 8)})
    
    local isOpen = false
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        contentContainer.Visible = isOpen
        TweenService:Create(arrow,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Rotation=isOpen and 180 or 0}):Play()
        TweenService:Create(categoryFrame,TweenInfo.new(0.2),{
            BackgroundColor3=isOpen and colors.bg4 or colors.bg3
        }):Play()
    end)
    
    return contentContainer
end

-- Modern Toggle - Minimal
local function makeToggle(parent, label, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 26 or 34),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local labelText = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(0.7,0,1,0),
        TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 7.5 or 11,
        TextWrapped=true,
        ZIndex=8
    })
    
    local toggleBg = new("Frame",{
        Parent=frame,
        Size=isMobile and UDim2.new(0,36,0,18) or UDim2.new(0,44,0,22),
        Position=isMobile and UDim2.new(1,-38,0.5,-9) or UDim2.new(1,-46,0.5,-11),
        BackgroundColor3=colors.bg4,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=toggleBg,CornerRadius=UDim.new(1,0)})
    
    local toggleCircle = new("Frame",{
        Parent=toggleBg,
        Size=isMobile and UDim2.new(0,14,0,14) or UDim2.new(0,18,0,18),
        Position=UDim2.new(0,2,0.5,isMobile and -7 or -9),
        BackgroundColor3=colors.textDim,
        BorderSizePixel=0,
        ZIndex=9
    })
    new("UICorner",{Parent=toggleCircle,CornerRadius=UDim.new(1,0)})
    
    local btn = new("TextButton",{
        Parent=toggleBg,
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text="",
        ZIndex=10
    })
    
    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        TweenService:Create(toggleBg,TweenInfo.new(0.2),{BackgroundColor3=on and colors.primary or colors.bg4}):Play()
        local movePos = isMobile and (on and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7)) or (on and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9))
        TweenService:Create(toggleCircle,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
            Position=movePos,
            BackgroundColor3=on and colors.text or colors.textDim
        }):Play()
        callback(on)
    end)
end

-- Input Field for Delay (Replacing Slider)
local function makeInput(parent, label, defaultValue, onChange)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 40 or 48),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local lbl = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(0.6,0,0,isMobile and 14 or 18),
        BackgroundTransparency=1,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 7.5 or 11,
        ZIndex=8
    })
    
    local inputContainer = new("Frame",{
        Parent=frame,
        Size=UDim2.new(0.35,0,0,isMobile and 22 or 26),
        Position=UDim2.new(1,-UDim2.new(0.35,0).X.Offset,0,isMobile and 16 or 20),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=inputContainer,CornerRadius=UDim.new(0,4)})
    
    local inputBox = new("TextBox",{
        Parent=inputContainer,
        Size=UDim2.new(1,-8,1,0),
        Position=UDim2.new(0,4,0,0),
        BackgroundTransparency=1,
        Text=tostring(defaultValue),
        Font=Enum.Font.Gotham,
        TextSize=isMobile and 9 or 12,
        TextColor3=colors.text,
        PlaceholderColor3=colors.textDimmer,
        ClearTextOnFocus=false,
        ZIndex=9
    })
    
    local function validateAndSet(value)
        local num = tonumber(value)
        if num then
            onChange(num)
            inputBox.Text = tostring(num)
        else
            inputBox.Text = tostring(defaultValue)
        end
    end
    
    inputBox.FocusLost:Connect(function()
        validateAndSet(inputBox.Text)
    end)
    
    return frame
end

-- Modern Dropdown - Minimal
local function makeDropdown(parent, title, icon, items, onSelect, uniqueId)
    local dropdownFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 38 or 46),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,
        ZIndex=7,
        Name=uniqueId or "Dropdown"
    })
    new("UICorner",{Parent=dropdownFrame,CornerRadius=UDim.new(0,6)})
    
    local header = new("TextButton",{
        Parent=dropdownFrame,
        Size=UDim2.new(1,-12,0,isMobile and 34 or 42),
        Position=UDim2.new(0,6,0,2),
        BackgroundTransparency=1,
        Text="",
        AutoButtonColor=false,
        ZIndex=8
    })
    
    local iconLabel = new("TextLabel",{
        Parent=header,
        Text=icon,
        Size=UDim2.new(0,isMobile and 22 or 26,1,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 11 or 14,
        TextColor3=colors.primary,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=9
    })
    
    local titleLabel = new("TextLabel",{
        Parent=header,
        Text=title,
        Size=UDim2.new(1,-70,0,isMobile and 12 or 16),
        Position=UDim2.new(0,isMobile and 24 or 30,0,isMobile and 3 or 4),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8 or 11,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=9
    })
    
    local statusLabel = new("TextLabel",{
        Parent=header,
        Text="Select...",
        Size=UDim2.new(1,-70,0,isMobile and 10 or 12),
        Position=UDim2.new(0,isMobile and 24 or 30,0,isMobile and 16 or 20),
        BackgroundTransparency=1,
        Font=Enum.Font.Gotham,
        TextSize=isMobile and 7 or 9,
        TextColor3=colors.textDimmer,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=9
    })
    
    local arrow = new("TextLabel",{
        Parent=header,
        Text="▼",
        Size=UDim2.new(0,isMobile and 18 or 22,1,0),
        Position=UDim2.new(1,isMobile and -18 or -22,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8 or 10,
        TextColor3=colors.primary,
        ZIndex=9
    })
    
    local listContainer = new("ScrollingFrame",{
        Parent=dropdownFrame,
        Size=UDim2.new(1,-12,0,0),
        Position=UDim2.new(0,6,0,isMobile and 40 or 50),
        BackgroundTransparency=1,
        Visible=false,
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        CanvasSize=UDim2.new(0,0,0,0),
        ScrollBarThickness=2,
        ScrollBarImageColor3=colors.primary,
        BorderSizePixel=0,
        ClipsDescendants=true,
        ZIndex=10
    })
    new("UIListLayout",{Parent=listContainer,Padding=UDim.new(0,isMobile and 3 or 5)})
    new("UIPadding",{Parent=listContainer,PaddingBottom=UDim.new(0,isMobile and 6 or 8)})
    
    local isOpen = false
    local selectedItem = nil
    
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        listContainer.Visible = isOpen
        
        TweenService:Create(arrow,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Rotation=isOpen and 180 or 0}):Play()
        TweenService:Create(dropdownFrame,TweenInfo.new(0.2),{
            BackgroundColor3=isOpen and colors.bg3 or colors.bg4
        }):Play()
        
        if isOpen and #items > 6 then
            listContainer.Size = UDim2.new(1,-12,0,isMobile and 140 or 180)
        else
            listContainer.Size = UDim2.new(1,-12,0,math.min(#items * (isMobile and 28 or 34), isMobile and 160 or 200))
        end
    end)
    
    for _, itemName in ipairs(items) do
        local itemBtn = new("TextButton",{
            Parent=listContainer,
            Size=UDim2.new(1,0,0,isMobile and 26 or 32),
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.3,
            BorderSizePixel=0,
            Text="",
            AutoButtonColor=false,
            ZIndex=11
        })
        new("UICorner",{Parent=itemBtn,CornerRadius=UDim.new(0,4)})
        
        local btnLabel = new("TextLabel",{
            Parent=itemBtn,
            Text=itemName,
            Size=UDim2.new(1,-8,1,0),
            Position=UDim2.new(0,4,0,0),
            BackgroundTransparency=1,
            Font=Enum.Font.GothamMedium,
            TextSize=isMobile and 7.5 or 10,
            TextColor3=colors.textDim,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd,
            ZIndex=12
        })
        
        itemBtn.MouseEnter:Connect(function()
            if selectedItem ~= itemName then
                TweenService:Create(itemBtn,TweenInfo.new(0.15),{
                    BackgroundColor3=colors.primary,
                    BackgroundTransparency=0.2
                }):Play()
                TweenService:Create(btnLabel,TweenInfo.new(0.15),{TextColor3=colors.text}):Play()
            end
        end)
        
        itemBtn.MouseLeave:Connect(function()
            if selectedItem ~= itemName then
                TweenService:Create(itemBtn,TweenInfo.new(0.15),{
                    BackgroundColor3=colors.bg4,
                    BackgroundTransparency=0.3
                }):Play()
                TweenService:Create(btnLabel,TweenInfo.new(0.15),{TextColor3=colors.textDim}):Play()
            end
        end)
        
        itemBtn.MouseButton1Click:Connect(function()
            selectedItem = itemName
            statusLabel.Text = "✓ " .. itemName
            statusLabel.TextColor3 = colors.success
            onSelect(itemName)
            
            task.wait(0.1)
            isOpen = false
            listContainer.Visible = false
            TweenService:Create(arrow,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Rotation=0}):Play()
            TweenService:Create(dropdownFrame,TweenInfo.new(0.2),{
                BackgroundColor3=colors.bg4
            }):Play()
        end)
    end
    
    return dropdownFrame
end

-- Modern Button - Minimal
local function makeButton(parent, label, callback)
    local btnFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 32 or 38),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=btnFrame,CornerRadius=UDim.new(0,6)})
    
    local button = new("TextButton",{
        Parent=btnFrame,
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text=label,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 9 or 12,
        TextColor3=colors.text,
        AutoButtonColor=false,
        ZIndex=9
    })
    
    button.MouseEnter:Connect(function()
        TweenService:Create(btnFrame,TweenInfo.new(0.15),{
            BackgroundColor3=colors.primary,
            BackgroundTransparency=0
        }):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(btnFrame,TweenInfo.new(0.15),{
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.1
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        TweenService:Create(btnFrame,TweenInfo.new(0.1),{Size=UDim2.new(0.98,0,0,isMobile and 30 or 36)}):Play()
        task.wait(0.1)
        TweenService:Create(btnFrame,TweenInfo.new(0.1),{Size=UDim2.new(1,0,0,isMobile and 32 or 38)}):Play()
        pcall(callback)
    end)
    
    return btnFrame
end

-- ==== MAIN PAGE ====
local catAutoFishing = makeCategory(mainPage, "Auto Fishing", "🎣")

local currentInstantMode = "None"
local fishingDelayValue = 1.30
local cancelDelayValue = 0.19

makeDropdown(catAutoFishing, "Instant Fishing Mode", "⚡", {"Fast", "Perfect"}, function(mode)
    currentInstantMode = mode
    instant.Stop()
    instant2.Stop()
    
    if mode == "Fast" then
        instant.Settings.MaxWaitTime = fishingDelayValue
        instant.Settings.CancelDelay = cancelDelayValue
        instant.Start()
    elseif mode == "Perfect" then
        instant2.Settings.MaxWaitTime = fishingDelayValue
        instant2.Settings.CancelDelay = cancelDelayValue
        instant2.Start()
    end
end, "InstantFishingMode")

makeToggle(catAutoFishing, "Enable Instant Fishing", function(on)
    if on then
        if currentInstantMode == "Fast" then
            instant.Start()
        elseif currentInstantMode == "Perfect" then
            instant2.Start()
        end
    else
        instant.Stop()
        instant2.Stop()
    end
end)

-- Replace sliders with input fields
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
makeToggle(catBlatant,"Blatant Features",function(on) if on then instant2x.Start() else instant2x.Stop() end end)

-- Replace sliders with input fields for Blatant Mode
makeInput(catBlatant,"Fishing Delay",0.3,function(v) instant2x.Settings.FishingDelay=v end)
makeInput(catBlatant,"Cancel Delay",0.19,function(v) instant2x.Settings.CancelDelay=v end)

local catBlatantV2 = makeCategory(mainPage, "Blatant V2", "🔥")
makeToggle(catBlatantV2,"Blatant Features",function(on) if on then blatantv2.Start() else blatantv2.Stop() end end)

-- Replace sliders with input fields for Blatant V2
makeInput(catBlatantV2,"Fishing Delay",0.05,function(v) blatantv2.Settings.FishingDelay=v end)
makeInput(catBlatantV2,"Cancel Delay",0.01,function(v) blatantv2.Settings.CancelDelay=v end)
makeInput(catBlatantV2,"Hook Wait Time",0.15,function(v) blatantv2.Settings.HookWaitTime=v end)
makeInput(catBlatantV2,"Cast Delay",0.03,function(v) blatantv2.Settings.CastDelay=v end)
makeInput(catBlatantV2,"Timeout Delay",0.8,function(v) blatantv2.Settings.TimeoutDelay=v end)

local catSupport = makeCategory(mainPage, "Support Features", "🛠️")
makeToggle(catSupport, "No Fishing Animation", function(on)
    if on then
        NoFishingAnimation.StartWithDelay()
    else
        NoFishingAnimation.Stop()
    end
end)

-- ==== TELEPORT PAGE ====
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

-- ==== SHOP PAGE ====
local catSell = makeCategory(shopPage, "Auto Sell System", "💰")
makeButton(catSell, "Sell All Now", function()
    if AutoSell and AutoSell.SellOnce then
        AutoSell.SellOnce()
    end
end)

local catTimer = makeCategory(shopPage, "Auto Sell Timer", "⏰")

-- Replace slider with input for timer
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

-- ==== SETTINGS PAGE ====
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

-- ==== INFO PAGE ====
local infoContainer = new("Frame",{
    Parent=infoPage,
    Size=UDim2.new(1,0,0,isMobile and 340 or 450),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    ZIndex=6
})
new("UICorner",{Parent=infoContainer,CornerRadius=UDim.new(0,8)})

local infoText = new("TextLabel",{
    Parent=infoContainer,
    Size=UDim2.new(1,-24,1,-24),
    Position=UDim2.new(0,12,0,12),
    BackgroundTransparency=1,
    Text=[[
⚫ LYNX v2.2 MINIMALIST

Ultra Compact Black Interface
Landscape Mobile Optimized

━━━━━━━━━━━━━━━━━━━━━━

🎣 AUTO FISHING
• Instant Fishing (Fast/Perfect)
• Input-based delay controls
• Blatant Mode support
• Advanced automation

🛠️ SUPPORT FEATURES
• No Fishing Animation
• Performance optimizations

🌍 TELEPORT SYSTEM
• Location teleport
• Player teleport
• Smart dropdown selection

💰 SHOP FEATURES
• Auto Sell (instant & timer)
• Auto Buy Weather
• Smart category organization

⚙️ SETTINGS
• Anti-AFK Protection
• FPS Unlocker (60-240 FPS)
• General preferences

━━━━━━━━━━━━━━━━━━━━━━

💡 MINIMALIST DESIGN
✓ Black transparent theme
✓ Input fields for precise delays
✓ Less rounded corners
✓ Compact layout
✓ Collapsible sidebar (Mobile)
✓ Clean, minimal interface

🎮 CONTROLS
• Click categories to expand
• Drag from top bar to move
• Drag corner to resize
• (▶/◀) Toggle sidebar (Mobile)
• (─) Minimize window
• (×) Close GUI

━━━━━━━━━━━━━━━━━━━━━━

Created by Lynx Team
Minimalist Edition 2024
    ]],
    Font=Enum.Font.Gotham,
    TextSize=isMobile and 7.5 or 10,
    TextColor3=colors.text,
    TextWrapped=true,
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Top,
    ZIndex=7
})

-- Minimized Icon - Minimal
local minimized = false
local icon
local savedIconPos = UDim2.new(0,15,0,100)

local function createMinimizedIcon()
    if icon then return end
    local iconSize = isMobile and 36 or 50
    icon = new("ImageLabel",{
        Parent=gui,
        Size=UDim2.new(0,iconSize,0,iconSize),
        Position=savedIconPos,
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        Image="rbxassetid://111416780887356",
        ScaleType=Enum.ScaleType.Fit,
        ZIndex=100
    })
    new("UICorner",{Parent=icon,CornerRadius=UDim.new(0,6)})
    
    local logoK = new("TextLabel",{
        Parent=icon,
        Text="L",
        Size=UDim2.new(1,0,1,0),
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 20 or 28,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Visible=icon.Image == "",
        ZIndex=101
    })
    
    icon.Image = logoContainer.Image
    logoK.Visible = (icon.Image == "")
    
    local dragging,dragStart,startPos,dragMoved = false,nil,nil,false
    icon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging,dragMoved,dragStart,startPos = true,false,input.Position,icon.Position
        end
    end)
    
    icon.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.sqrt(delta.X^2 + delta.Y^2) > 5 then dragMoved = true end
            local newPos = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
            TweenService:Create(icon,TweenInfo.new(0.05),{Position=newPos}):Play()
        end
    end)
    
    icon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                savedIconPos = icon.Position
                if not dragMoved then
                    win.Visible = true
                    TweenService:Create(win,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{
                        Size=windowSize,
                        Position=UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2)
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
        local targetPos = UDim2.new(0.5,0,0.5,0)
        TweenService:Create(win,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{
            Size=UDim2.new(0,0,0,0),
            Position=targetPos
        }):Play()
        task.wait(0.25)
        win.Visible = false
        createMinimizedIcon()
        minimized = true
    end
end)

btnClose.MouseButton1Click:Connect(function()
    TweenService:Create(win,TweenInfo.new(0.25,Enum.EasingStyle.Quad),{
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(0.5,0,0.5,0)
    }):Play()
    task.wait(0.25)
    gui:Destroy()
end)

-- DRAGGING SYSTEM
local dragging,dragStart,startPos = false,nil,nil
local dragTween = nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging,dragStart,startPos = true,input.Position,win.Position
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
        dragTween = TweenService:Create(win,TweenInfo.new(0.05,Enum.EasingStyle.Linear),{Position=newPos})
        dragTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end
end)

-- RESIZING SYSTEM
local resizing = false
local resizeStart,startSize = nil,nil
local resizeTween = nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing,resizeStart,startSize = true,input.Position,win.Size
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
        
        local newSize = UDim2.new(0,newWidth,0,newHeight)
        
        if resizeTween then resizeTween:Cancel() end
        resizeTween = TweenService:Create(win,TweenInfo.new(0.05,Enum.EasingStyle.Linear),{
            Size=newSize
        })
        resizeTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        resizing = false 
    end
end)

-- Opening Animation
task.spawn(function()
    win.Size = UDim2.new(0,0,0,0)
    win.Position = UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2)
    
    task.wait(0.1)
    
    TweenService:Create(win,TweenInfo.new(0.4,Enum.EasingStyle.Quad),{
        Size=windowSize
    }):Play()
end)

-- Hover effect for resize handle
resizeHandle.MouseEnter:Connect(function()
    TweenService:Create(resizeHandle,TweenInfo.new(0.15),{
        BackgroundTransparency=0.1
    }):Play()
end)

resizeHandle.MouseLeave:Connect(function()
    if not resizing then
        TweenService:Create(resizeHandle,TweenInfo.new(0.15),{
            BackgroundTransparency=0.3
        }):Play()
    end
end)

print("⚫ Lynx GUI v2.2 Minimalist loaded!")
print("🎯 LANDSCAPE MODE - Horizontal Rectangle")
print("📱 Mobile Optimized (460x250)")
print("⚫ Black Transparent Theme")
print("⌨️ Input-based delay controls")
print("🖱️ Drag from top | Resize from corner")
print("💎 Created by Lynx Team")
