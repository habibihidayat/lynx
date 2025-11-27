-- LynxGUI_v2.4.lua - Ultra Smooth Black Edition (ENHANCED)
-- OPTIMIZED FOR BOTH MOBILE & PC
-- FIXED: Smooth toggle animations with visible circle
-- FIXED: Enhanced window open/close animations
-- FIXED: Better mobile responsiveness

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

repeat task.wait() until localPlayer:FindFirstChild("PlayerGui")

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local function new(class, props)
    local inst = Instance.new(class)
    for k,v in pairs(props or {}) do inst[k] = v end
    return inst
end

-- Your existing modules
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

-- Enhanced responsive sizing
local windowSize = isMobile and UDim2.new(0,480,0,260) or UDim2.new(0,720,0,480)
local minWindowSize = isMobile and Vector2.new(420, 230) or Vector2.new(620, 420)
local maxWindowSize = isMobile and Vector2.new(580, 340) or Vector2.new(920, 620)

local gui = new("ScreenGui",{
    Name="LynxGUI_v2.4",
    Parent=localPlayer.PlayerGui,
    IgnoreGuiInset=true,
    ResetOnSpawn=false,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    DisplayOrder=999
})

-- Enhanced window with better animations
local win = new("Frame",{
    Parent=gui,
    Size=UDim2.new(0,0,0,0),
    Position=UDim2.new(0.5,0,0.5,0),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0.05,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=3,
    Visible=false
})
new("UICorner",{Parent=win,CornerRadius=UDim.new(0,12)})

local overlay = new("Frame",{
    Parent=win,
    Size=UDim2.new(1,0,1,0),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0.92,
    BorderSizePixel=0,
    ZIndex=2
})
new("UICorner",{Parent=overlay,CornerRadius=UDim.new(0,12)})

local border = new("UIStroke",{
    Parent=win,
    Color=colors.border,
    Thickness=1.8,
    Transparency=0.15,
    ApplyStrokeMode=Enum.ApplyStrokeMode.Border
})

local sidebarExpanded = false
local sidebarCollapsedWidth = isMobile and 48 or 60
local sidebarExpandedWidth = isMobile and 160 : 200

local sidebar = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(0,sidebarCollapsedWidth,1,0) or UDim2.new(0,sidebarCollapsedWidth,1,0),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0.05,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=sidebar,CornerRadius=UDim.new(0,12)})

-- Enhanced sidebar toggle with better animation
local sidebarToggle = new("TextButton",{
    Parent=win,
    Size=isMobile and UDim2.new(0,28,0,46) or UDim2.new(0,32,0,50),
    Position=isMobile and UDim2.new(0,sidebarCollapsedWidth-4,1,-58) or UDim2.new(0,sidebarCollapsedWidth-4,1,-62),
    BackgroundColor3=colors.bg4,
    BackgroundTransparency=0.1,
    BorderSizePixel=0,
    Text="▶",
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 12 : 14,
    TextColor3=colors.textDim,
    ZIndex=101,
    ClipsDescendants=false
})
new("UICorner",{Parent=sidebarToggle,CornerRadius=UDim.new(0,8)})
new("UIStroke",{Parent=sidebarToggle,Color=colors.border,Thickness=1,Transparency=0.4})

local sidebarHeader = new("Frame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,0,0,58) or UDim2.new(1,0,0,74),
    BackgroundTransparency=1,
    ClipsDescendants=true,
    ZIndex=5
})

local brandName = new("TextLabel",{
    Parent=sidebarHeader,
    Text="LYNX",
    Size=UDim2.new(1,0,0,26),
    Position=isMobile and UDim2.new(0,0,0,18) or UDim2.new(0,0,0,24),
    Font=Enum.Font.GothamBlack,
    TextSize=isMobile and 16 : 20,
    BackgroundTransparency=1,
    TextColor3=colors.accent,
    Visible=not isMobile,
    ZIndex=6
})

local brandVersion = new("TextLabel",{
    Parent=sidebarHeader,
    Text="v2.4",
    Size=UDim2.new(1,0,0,16),
    Position=isMobile and UDim2.new(0,0,0,42) or UDim2.new(0,0,0,50),
    Font=Enum.Font.GothamMedium,
    TextSize=10,
    BackgroundTransparency=1,
    TextColor3=colors.textDim,
    Visible=not isMobile,
    ZIndex=6
})

local navContainer = new("ScrollingFrame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,-6,1,-62) or UDim2.new(1,-18,1,-84),
    Position=isMobile and UDim2.new(0,3,0,60) or UDim2.new(0,9,0,76),
    BackgroundTransparency=1,
    ScrollBarThickness=3,
    ScrollBarImageColor3=colors.accent,
    BorderSizePixel=0,
    CanvasSize=UDim2.new(0,0,0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ClipsDescendants=true,
    ZIndex=5
})
new("UIListLayout",{
    Parent=navContainer,
    Padding=UDim.new(0,isMobile and 5 : 8),
    SortOrder=Enum.SortOrder.LayoutOrder
})

local contentBg = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(1,-56,1,-12) or UDim2.new(1,-200,1,-14),
    Position=isMobile and UDim2.new(0,52,0,7) or UDim2.new(0,195,0,9),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0.08,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=contentBg,CornerRadius=UDim.new(0,10)})

local pages = {}
local currentPage = "Main"
local navButtons = {}

-- Enhanced sidebar toggle with smooth animation
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

-- Enhanced top bar with better visuals
local topBar = new("Frame",{
    Parent=contentBg,
    Size=UDim2.new(1,0,0,isMobile and 34 : 48),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0.12,
    BorderSizePixel=0,
    ZIndex=5
})
new("UICorner",{Parent=topBar,CornerRadius=UDim.new(0,10)})

local dragHandle = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,26,0,3) or UDim2.new(0,42,0,4),
    Position=isMobile and UDim2.new(0.5,-13,0,6) or UDim2.new(0.5,-21,0,8),
    BackgroundColor3=colors.primary,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    ZIndex=6
})
new("UICorner",{Parent=dragHandle,CornerRadius=UDim.new(1,0)})

local pageTitle = new("TextLabel",{
    Parent=topBar,
    Text="Dashboard",
    Size=UDim2.new(1,-55,1,0),
    Position=UDim2.new(0,isMobile and 10 : 16,0,0),
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 11 : 16,
    BackgroundTransparency=1,
    TextColor3=colors.text,
    TextXAlignment=Enum.TextXAlignment.Left,
    ZIndex=6
})

local controlsFrame = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,46,0,24) or UDim2.new(0,70,0,32),
    Position=isMobile and UDim2.new(1,-50,0.5,-12) or UDim2.new(1,-74,0.5,-16),
    BackgroundTransparency=1,
    ZIndex=6
})
new("UIListLayout",{
    Parent=controlsFrame,
    FillDirection=Enum.FillDirection.Horizontal,
    Padding=UDim.new(0,isMobile and 4 : 7)
})

local function createControlBtn(icon, color)
    local btnSize = isMobile and 24 : 32
    local btn = new("TextButton",{
        Parent=controlsFrame,
        Size=UDim2.new(0,btnSize,0,btnSize),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        Text=icon,
        Font=Enum.Font.GothamBold,
        TextSize=(icon == "×" and (isMobile and 16 : 22)) or (isMobile and 12 : 16),
        TextColor3=colors.textDim,
        AutoButtonColor=false,
        ZIndex=7
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,isMobile and 6 : 8)})
    new("UIStroke",{Parent=btn,Color=colors.border,Thickness=1,Transparency=0.5})
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{
            BackgroundColor3=color,
            BackgroundTransparency=0.05,
            TextColor3=colors.text,
            Size = UDim2.new(0,btnSize+2,0,btnSize+2)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.1,
            TextColor3=colors.textDim,
            Size = UDim2.new(0,btnSize,0,btnSize)
        }):Play()
    end)
    return btn
end

local btnMin = createControlBtn("─", colors.warning)
local btnClose = createControlBtn("×", colors.danger)

local resizeHandle = new("TextButton",{
    Parent=win,
    Size=isMobile and UDim2.new(0,18,0,18) or UDim2.new(0,24,0,24),
    Position=isMobile and UDim2.new(1,-18,1,-18) or UDim2.new(1,-24,1,-24),
    BackgroundColor3=colors.bg5,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    Text="⋰",
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 10 : 14,
    TextColor3=colors.textDim,
    AutoButtonColor=false,
    ZIndex=100
})
new("UICorner",{Parent=resizeHandle,CornerRadius=UDim.new(0,6)})
new("UIStroke",{Parent=resizeHandle,Color=colors.border,Thickness=1,Transparency=0.4})

local function createPage(name)
    local page = new("ScrollingFrame",{
        Parent=contentBg,
        Size=UDim2.new(1,-10,1,-(isMobile and 40 : 56)),
        Position=UDim2.new(0,5,0,isMobile and 38 : 52),
        BackgroundTransparency=1,
        ScrollBarThickness=isMobile and 4 : 5,
        ScrollBarImageColor3=colors.accent,
        BorderSizePixel=0,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
        ClipsDescendants=true,
        ZIndex=5
    })
    new("UIListLayout",{
        Parent=page,
        Padding=UDim.new(0,isMobile and 7 : 11),
        SortOrder=Enum.SortOrder.LayoutOrder
    })
    new("UIPadding",{
        Parent=page,
        PaddingTop=UDim.new(0,isMobile and 5 : 9),
        PaddingBottom=UDim.new(0,isMobile and 5 : 9)
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

-- Enhanced navigation buttons
local function createNavButton(text, icon, page, order)
    local btn = new("TextButton",{
        Parent=navContainer,
        Size=isMobile and UDim2.new(1,0,0,40) or UDim2.new(1,0,0,50),
        BackgroundColor3=page == currentPage and colors.bg4 : Color3.fromRGB(0,0,0),
        BackgroundTransparency=page == currentPage and 0.12 : 1,
        BorderSizePixel=0,
        Text="",
        AutoButtonColor=false,
        LayoutOrder=order,
        ZIndex=6
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,9)})
    
    local indicator = new("Frame",{
        Parent=btn,
        Size=isMobile and UDim2.new(0,4,0,16) or UDim2.new(0,5,0,22),
        Position=UDim2.new(0,0,0.5,isMobile and -8 : -11),
        BackgroundColor3=colors.accent,
        BorderSizePixel=0,
        Visible=page == currentPage,
        ZIndex=7
    })
    new("UICorner",{Parent=indicator,CornerRadius=UDim.new(1,0)})
    
    local iconLabel = new("TextLabel",{
        Parent=btn,
        Text=icon,
        Size=isMobile and UDim2.new(1,0,1,0) or UDim2.new(0,34,1,0),
        Position=isMobile and UDim2.new(0,0,0,0) or UDim2.new(0,12,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 15 : 19,
        TextColor3=page == currentPage and colors.accent : colors.textDim,
        ZIndex=7
    })
    
    local textLabel = new("TextLabel",{
        Parent=btn,
        Text=text,
        Size=UDim2.new(1,-55,1,0),
        Position=UDim2.new(0,50,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamSemibold,
        TextSize=12,
        TextColor3=page == currentPage and colors.text : colors.textDim,
        TextXAlignment=Enum.TextXAlignment.Left,
        Visible=not isMobile,
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
        TweenService:Create(btnData.btn,TweenInfo.new(0.2),{
            BackgroundColor3=isActive and colors.bg4 : Color3.fromRGB(0,0,0),
            BackgroundTransparency=isActive and 0.12 : 1
        }):Play()
        btnData.indicator.Visible = isActive
        TweenService:Create(btnData.icon,TweenInfo.new(0.2),{
            TextColor3=isActive and colors.accent : colors.textDim
        }):Play()
        if not isMobile then
            TweenService:Create(btnData.text,TweenInfo.new(0.2),{
                TextColor3=isActive and colors.text : colors.textDim
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

-- Enhanced category system
local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 40 : 54),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=false,
        ZIndex=6
    })
    new("UICorner",{Parent=categoryFrame,CornerRadius=UDim.new(0,9)})
    new("UIStroke",{Parent=categoryFrame,Color=colors.border,Thickness=1,Transparency=0.3})
    
    local header = new("TextButton",{
        Parent=categoryFrame,
        Size=UDim2.new(1,0,0,isMobile and 40 : 54),
        BackgroundTransparency=1,
        Text="",
        AutoButtonColor=false,
        ClipsDescendants=true,
        ZIndex=7
    })
    
    local iconLabel = new("TextLabel",{
        Parent=header,
        Text=icon,
        Size=isMobile and UDim2.new(0,28,0,28) or UDim2.new(0,36,0,36),
        Position=isMobile and UDim2.new(0,10,0.5,-14) or UDim2.new(0,12,0.5,-18),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 13 : 17,
        TextColor3=colors.accent,
        ZIndex=8
    })
    
    local titleLabel = new("TextLabel",{
        Parent=header,
        Text=title,
        Size=UDim2.new(1,-75,1,0),
        Position=isMobile and UDim2.new(0,40,0,0) or UDim2.new(0,50,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 11 : 14,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=8
    })
    
    local arrow = new("TextLabel",{
        Parent=header,
        Text="▼",
        Size=UDim2.new(0,isMobile and 18 : 22,1,0),
        Position=isMobile and UDim2.new(1,-22,0,0) or UDim2.new(1,-28,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 10 : 13,
        TextColor3=colors.accent,
        ZIndex=8
    })
    
    local contentContainer = new("Frame",{
        Parent=categoryFrame,
        Size=isMobile and UDim2.new(1,-16,0,0) or UDim2.new(1,-20,0,0),
        Position=isMobile and UDim2.new(0,8,0,44) or UDim2.new(0,10,0,58),
        BackgroundTransparency=1,
        Visible=false,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,
        ZIndex=7
    })
    new("UIListLayout",{Parent=contentContainer,Padding=UDim.new(0,isMobile and 6 : 9)})
    new("UIPadding",{Parent=contentContainer,PaddingBottom=UDim.new(0,isMobile and 9 : 13)})
    
    local isOpen = false
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        contentContainer.Visible = isOpen
        TweenService:Create(arrow,TweenInfo.new(0.3,Enum.EasingStyle.Quart),{Rotation=isOpen and 180 : 0}):Play()
        TweenService:Create(categoryFrame,TweenInfo.new(0.25),{
            BackgroundColor3=isOpen and colors.bg4 : colors.bg3
        }):Play()
    end)
    
    return contentContainer
end

-- FIXED: Enhanced toggle with proper circle visibility and smooth animation
local function makeToggle(parent, label, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 32 : 40),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local labelText = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(0.68,0,1,0),
        TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 10 : 13,
        TextWrapped=true,
        ZIndex=8
    })
    
    local toggleBg = new("Frame",{
        Parent=frame,
        Size=isMobile and UDim2.new(0,44,0,24) or UDim2.new(0,52,0,28),
        Position=isMobile and UDim2.new(1,-46,0.5,-12) or UDim2.new(1,-54,0.5,-14),
        BackgroundColor3=colors.bg5,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=toggleBg,CornerRadius=UDim.new(1,0)})
    new("UIStroke",{Parent=toggleBg,Color=colors.border,Thickness=1.5,Transparency=0.4})
    
    local toggleCircle = new("Frame",{
        Parent=toggleBg,
        Size=isMobile and UDim2.new(0,18,0,18) or UDim2.new(0,22,0,22),
        Position=isMobile and UDim2.new(0,3,0.5,-9) or UDim2.new(0,3,0.5,-11),
        BackgroundColor3=colors.textDim,
        BorderSizePixel=0,
        ZIndex=9
    })
    new("UICorner",{Parent=toggleCircle,CornerRadius=UDim.new(1,0)})
    new("UIStroke",{Parent=toggleCircle,Color=colors.border,Thickness=1,Transparency=0.2})
    
    local enabled = false
    local toggleBtn = new("TextButton",{
        Parent=toggleBg,
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text="",
        ZIndex=10
    })
    
    toggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        local circlePos = enabled and (isMobile and UDim2.new(1,-21,0.5,-9) or UDim2.new(1,-25,0.5,-11)) or (isMobile and UDim2.new(0,3,0.5,-9) or UDim2.new(0,3,0.5,-11))
        
        TweenService:Create(toggleCircle,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{
            Position=circlePos,
            BackgroundColor3=enabled and colors.text : colors.textDim
        }):Play()
        
        TweenService:Create(toggleBg,TweenInfo.new(0.25),{
            BackgroundColor3=enabled and colors.accent : colors.bg5
        }):Play()
        
        if callback then callback(enabled) end
    end)
    
    return frame
end

local function makeInput(parent, label, defaultValue, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 34 : 42),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local labelText = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(0.55,0,1,0),
        Position=UDim2.new(0,0,0,0),
        TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 10 : 13,
        TextWrapped=true,
        ZIndex=8
    })
    
    local inputContainer = new("Frame",{
        Parent=frame,
        Size=isMobile and UDim2.new(0.42,-4,0,28) or UDim2.new(0.42,-6,0,34),
        Position=isMobile and UDim2.new(0.58,2,0.5,-14) or UDim2.new(0.58,3,0.5,-17),
        BackgroundColor3=colors.inputBg,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=inputContainer,CornerRadius=UDim.new(0,7)})
    local inputStroke = new("UIStroke",{
        Parent=inputContainer,
        Color=colors.inputBorder,
        Thickness=1.8,
        Transparency=0.25
    })
    
    local inputBox = new("TextBox",{
        Parent=inputContainer,
        Size=UDim2.new(1,-18,1,0),
        Position=UDim2.new(0,9,0,0),
        BackgroundTransparency=1,
        Text=tostring(defaultValue),
        PlaceholderText="0.00",
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 11 : 14,
        TextColor3=colors.text,
        PlaceholderColor3=colors.textDimmer,
        TextXAlignment=Enum.TextXAlignment.Center,
        ClearTextOnFocus=false,
        ZIndex=9
    })
    
    inputBox.Focused:Connect(function()
        TweenService:Create(inputStroke,TweenInfo.new(0.2),{Color=colors.inputFocus,Transparency=0}):Play()
        TweenService:Create(inputContainer,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(25,25,25)}):Play()
    end)
    
    inputBox.FocusLost:Connect(function(enterPressed)
        TweenService:Create(inputStroke,TweenInfo.new(0.2),{Color=colors.inputBorder,Transparency=0.25}):Play()
        TweenService:Create(inputContainer,TweenInfo.new(0.2),{BackgroundColor3=colors.inputBg}):Play()
        
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

local function makeButton(parent, label, callback)
    local btn = new("TextButton",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 32 : 40),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.15,
        BorderSizePixel=0,
        Text=label,
        Font=Enum.Font.GothamSemibold,
        TextSize=isMobile and 10 : 13,
        TextColor3=colors.text,
        AutoButtonColor=false,
        ZIndex=8
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,7)})
    new("UIStroke",{Parent=btn,Color=colors.border,Thickness=1,Transparency=0.5})
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{
            BackgroundColor3=colors.accent,
            BackgroundTransparency=0.1,
            Size = UDim2.new(1,2,0,isMobile and 34 : 42)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.15,
            Size = UDim2.new(1,0,0,isMobile and 32 : 40)
        }):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return btn
end

-- Your existing content creation code continues here...
-- [The rest of your content creation code remains the same as before]

-- Enhanced window open animation
local function openWindow()
    win.Visible = true
    win.Size = UDim2.new(0,0,0,0)
    win.Position = UDim2.new(0.5,0,0.5,0)
    
    local sizeTween = TweenService:Create(win, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0), {
        Size = windowSize,
        Position = UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2)
    })
    
    sizeTween:Play()
end

-- Enhanced minimize/close animations
local minimized = false
local icon
local savedIconPos = UDim2.new(0,20,0,120)
local logoAssetId = "rbxassetid://111416780887356"

local function createMinimizedIcon()
    if icon then return end
    local iconSize = isMobile and 46 : 60
    icon = new("ImageLabel",{
        Parent=gui,
        Size=UDim2.new(0,iconSize,0,iconSize),
        Position=savedIconPos,
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.05,
        BorderSizePixel=0,
        Image=logoAssetId,
        ScaleType=Enum.ScaleType.Fit,
        ZIndex=100
    })
    new("UICorner",{Parent=icon,CornerRadius=UDim.new(0,10)})
    new("UIStroke",{Parent=icon,Color=colors.accent,Thickness=2,Transparency=0.2})
    
    local logoFallback = new("TextLabel",{
        Parent=icon,
        Text="L",
        Size=UDim2.new(1,0,1,0),
        Font=Enum.Font.GothamBlack,
        TextSize=isMobile and 26 : 34,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Visible=icon.Image == "",
        ZIndex=101
    })
    
    logoFallback.Visible = (icon.Image == "")
    
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
            TweenService:Create(icon,TweenInfo.new(0.08),{Position=newPos}):Play()
        end
    end)
    
    icon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                savedIconPos = icon.Position
                if not dragMoved then
                    openWindow()
                    if icon then 
                        TweenService:Create(icon, TweenInfo.new(0.2), {Size = UDim2.new(0,0,0,0)}):Play()
                        task.wait(0.2)
                        icon:Destroy() 
                        icon = nil 
                    end
                    minimized = false
                end
            end
        end
    end)
end

btnMin.MouseButton1Click:Connect(function()
    if not minimized then
        local targetPos = UDim2.new(0.5,0,0.5,0)
        TweenService:Create(win,TweenInfo.new(0.35,Enum.EasingStyle.Back, Enum.EasingDirection.In),{
            Size=UDim2.new(0,0,0,0),
            Position=targetPos
        }):Play()
        task.wait(0.35)
        win.Visible = false
        createMinimizedIcon()
        minimized = true
    end
end)

btnClose.MouseButton1Click:Connect(function()
    TweenService:Create(win,TweenInfo.new(0.4,Enum.EasingStyle.Back, Enum.EasingDirection.In),{
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(0.5,0,0.5,0),
        BackgroundTransparency=1
    }):Play()
    task.wait(0.4)
    gui:Destroy()
end)

-- Enhanced dragging with smooth physics
local dragging,dragStart,startPos = false,nil,nil
local dragTween = nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputService.TouchEnabled then
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
        dragTween = TweenService:Create(win,TweenInfo.new(0.08,Enum.EasingStyle.Linear),{Position=newPos})
        dragTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end
end)

-- Enhanced resizing
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
        resizeTween = TweenService:Create(win,TweenInfo.new(0.08,Enum.EasingStyle.Linear),{
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

-- Enhanced resize handle hover effects
resizeHandle.MouseEnter:Connect(function()
    TweenService:Create(resizeHandle,TweenInfo.new(0.2),{
        BackgroundTransparency=0,
        BackgroundColor3=colors.accent,
        TextColor3=colors.text
    }):Play()
end)

resizeHandle.MouseLeave:Connect(function()
    if not resizing then
        TweenService:Create(resizeHandle,TweenInfo.new(0.2),{
            BackgroundTransparency=0.2,
            BackgroundColor3=colors.bg5,
            TextColor3=colors.textDim
        }):Play()
    end
end)

-- Initialize window with enhanced animation
task.spawn(function()
    task.wait(0.1)
    openWindow()
end)

print("⚫ Lynx GUI v2.4 Smooth Edition loaded!")
print("🎯 ENHANCED ANIMATIONS - Smooth transitions")
print("🔄 FIXED: Toggle circle visibility and animation")
print("📱 Mobile & PC Optimized")
print("🎨 Enhanced visual design")
print("💎 Created by Lynx Team")
