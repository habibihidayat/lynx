-- LynxGUI_v2.4.lua - Ultra Optimized Black Edition
-- PERFORMANCE OPTIMIZED | SMOOTH ANIMATIONS | FIXED TOGGLE
-- Landscape optimized untuk Mobile & PC
-- Dioptimasi untuk Xeno dan executor lainnya

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
    toggleWhite = Color3.fromRGB(255, 255, 255)
}

local windowSize = isMobile and UDim2.new(0,480,0,260) or UDim2.new(0,720,0,480)
local minWindowSize = isMobile and Vector2.new(420, 230) or Vector2.new(620, 420)
local maxWindowSize = isMobile and Vector2.new(580, 340) or Vector2.new(920, 620)

local activeTweens = {}
local function playTween(obj, tweenInfo, properties, key)
    if key and activeTweens[key] then
        activeTweens[key]:Cancel()
    end
    local tween = TweenService:Create(obj, tweenInfo, properties)
    if key then activeTweens[key] = tween end
    tween:Play()
    return tween
end

local gui = new("ScreenGui",{
    Name="LynxGUI_v2.4_Optimized",
    Parent=localPlayer.PlayerGui,
    IgnoreGuiInset=true,
    ResetOnSpawn=false,
    ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    DisplayOrder=999
})

local win = new("Frame",{
    Parent=gui,
    Size=windowSize,
    Position=UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0,
    BorderSizePixel=0,
    ClipsDescendants=false,
    ZIndex=3
})
new("UICorner",{Parent=win,CornerRadius=UDim.new(0,10)})

local border = new("UIStroke",{
    Parent=win,
    Color=colors.border,
    Thickness=1.5,
    Transparency=0.2,
    ApplyStrokeMode=Enum.ApplyStrokeMode.Border
})

local sidebarExpanded = false
local sidebarCollapsedWidth = 48
local sidebarExpandedWidth = 160

local sidebar = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(0,sidebarCollapsedWidth,1,0) or UDim2.new(0,190,1,0),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=sidebar,CornerRadius=UDim.new(0,10)})

local sidebarToggle
if isMobile then
    sidebarToggle = new("TextButton",{
        Parent=win,
        Size=UDim2.new(0,26,0,44),
        Position=UDim2.new(0,sidebarCollapsedWidth-3,1,-54),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        Text="▶",
        Font=Enum.Font.GothamBold,
        TextSize=13,
        TextColor3=colors.textDim,
        ZIndex=101,
        ClipsDescendants=false
    })
    new("UICorner",{Parent=sidebarToggle,CornerRadius=UDim.new(0,8)})
end

local sidebarHeader = new("Frame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,0,0,55) or UDim2.new(1,0,0,70),
    BackgroundTransparency=1,
    ClipsDescendants=true,
    ZIndex=5
})

local brandName = new("TextLabel",{
    Parent=sidebarHeader,
    Text="LYNX",
    Size=UDim2.new(1,0,0,24),
    Position=isMobile and UDim2.new(0,0,0,16) or UDim2.new(0,0,0,22),
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 14 or 18,
    BackgroundTransparency=1,
    TextColor3=colors.text,
    Visible=isMobile and sidebarExpanded or not isMobile,
    ZIndex=6
})

local brandVersion = new("TextLabel",{
    Parent=sidebarHeader,
    Text="v2.4 ⚡",
    Size=UDim2.new(1,0,0,14),
    Position=isMobile and UDim2.new(0,0,0,38) or UDim2.new(0,0,0,46),
    Font=Enum.Font.Gotham,
    TextSize=10,
    BackgroundTransparency=1,
    TextColor3=colors.accent,
    Visible=isMobile and sidebarExpanded or not isMobile,
    ZIndex=6
})

local navContainer = new("ScrollingFrame",{
    Parent=sidebar,
    Size=isMobile and UDim2.new(1,-6,1,-60) or UDim2.new(1,-18,1,-80),
    Position=isMobile and UDim2.new(0,3,0,56) or UDim2.new(0,9,0,72),
    BackgroundTransparency=1,
    ScrollBarThickness=2,
    ScrollBarImageColor3=colors.primary,
    BorderSizePixel=0,
    CanvasSize=UDim2.new(0,0,0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ClipsDescendants=true,
    ScrollingEnabled=true,
    ElasticBehavior=Enum.ElasticBehavior.WhenScrollable,
    ZIndex=5
})
new("UIListLayout",{
    Parent=navContainer,
    Padding=UDim.new(0,isMobile and 4 or 7),
    SortOrder=Enum.SortOrder.LayoutOrder
})

local contentBg = new("Frame",{
    Parent=win,
    Size=isMobile and UDim2.new(1,-56,1,-12) or UDim2.new(1,-200,1,-14),
    Position=isMobile and UDim2.new(0,52,0,7) or UDim2.new(0,195,0,9),
    BackgroundColor3=colors.bg2,
    BackgroundTransparency=0,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=contentBg,CornerRadius=UDim.new(0,10)})

local pages = {}
local currentPage = "Main"
local navButtons = {}

local lastSidebarToggle = 0
local debounceTime = 0.3

local function toggleSidebar()
    if not isMobile then return end
    
    local now = tick()
    if now - lastSidebarToggle < debounceTime then return end
    lastSidebarToggle = now
    
    sidebarExpanded = not sidebarExpanded
    local targetWidth = sidebarExpanded and sidebarExpandedWidth or sidebarCollapsedWidth
    
    playTween(sidebar, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size=UDim2.new(0,targetWidth,1,0)
    }, "sidebar")
    
    playTween(contentBg, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size=UDim2.new(1,-(targetWidth+8),1,-12),
        Position=UDim2.new(0,targetWidth+6,0,7)
    }, "contentBg")
    
    if sidebarToggle then
        playTween(sidebarToggle, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position=UDim2.new(0,targetWidth-3,1,-54)
        }, "sidebarToggle")
        sidebarToggle.Text = sidebarExpanded and "◀" or "▶"
    end
    
    brandName.Visible = sidebarExpanded
    brandVersion.Visible = sidebarExpanded
    
    for _, btnData in pairs(navButtons) do
        if btnData.text then
            btnData.text.Visible = sidebarExpanded
            btnData.icon.Size = sidebarExpanded and UDim2.new(0,30,1,0) or UDim2.new(1,0,1,0)
            btnData.icon.Position = sidebarExpanded and UDim2.new(0,8,0,0) or UDim2.new(0,0,0,0)
        end
    end
end

if sidebarToggle then
    sidebarToggle.MouseButton1Click:Connect(toggleSidebar)
end

local topBar = new("Frame",{
    Parent=contentBg,
    Size=UDim2.new(1,0,0,isMobile and 32 or 46),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0,
    BorderSizePixel=0,
    ZIndex=5
})
new("UICorner",{Parent=topBar,CornerRadius=UDim.new(0,10)})

local dragHandle = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,24,0,3) or UDim2.new(0,40,0,4),
    Position=isMobile and UDim2.new(0.5,-12,0,5) or UDim2.new(0.5,-20,0,7),
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
    Position=UDim2.new(0,isMobile and 8 or 14,0,0),
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 10 or 15,
    BackgroundTransparency=1,
    TextColor3=colors.text,
    TextXAlignment=Enum.TextXAlignment.Left,
    ZIndex=6
})

local controlsFrame = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,44,0,22) or UDim2.new(0,66,0,30),
    Position=isMobile and UDim2.new(1,-48,0.5,-11) or UDim2.new(1,-70,0.5,-15),
    BackgroundTransparency=1,
    ZIndex=6
})
new("UIListLayout",{
    Parent=controlsFrame,
    FillDirection=Enum.FillDirection.Horizontal,
    Padding=UDim.new(0,isMobile and 3 or 6)
})

local function createControlBtn(icon, color)
    local btnSize = isMobile and 22 or 30
    local btn = new("TextButton",{
        Parent=controlsFrame,
        Size=UDim2.new(0,btnSize,0,btnSize),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        Text=icon,
        Font=Enum.Font.GothamBold,
        TextSize=(icon == "×" and (isMobile and 14 or 20)) or (isMobile and 10 or 15),
        TextColor3=colors.textDim,
        AutoButtonColor=false,
        ZIndex=7
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,isMobile and 5 or 7)})
    
    btn.MouseEnter:Connect(function()
        playTween(btn, TweenInfo.new(0.15), {
            BackgroundColor3=color,
            BackgroundTransparency=0,
            TextColor3=colors.text
        })
    end)
    btn.MouseLeave:Connect(function()
        playTween(btn, TweenInfo.new(0.15), {
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.1,
            TextColor3=colors.textDim
        })
    end)
    return btn
end

local btnMin = createControlBtn("─", colors.warning)
local btnClose = createControlBtn("×", colors.danger)

local resizeHandle = new("TextButton",{
    Parent=win,
    Size=isMobile and UDim2.new(0,16,0,16) or UDim2.new(0,22,0,22),
    Position=isMobile and UDim2.new(1,-16,1,-16) or UDim2.new(1,-22,1,-22),
    BackgroundColor3=colors.bg5,
    BackgroundTransparency=0.2,
    BorderSizePixel=0,
    Text="⋰",
    Font=Enum.Font.GothamBold,
    TextSize=isMobile and 9 or 13,
    TextColor3=colors.textDim,
    AutoButtonColor=false,
    ZIndex=100
})
new("UICorner",{Parent=resizeHandle,CornerRadius=UDim.new(0,5)})

local function createPage(name)
    local page = new("ScrollingFrame",{
        Parent=contentBg,
        Size=UDim2.new(1,-10,1,-(isMobile and 38 or 54)),
        Position=UDim2.new(0,5,0,isMobile and 36 or 50),
        BackgroundTransparency=1,
        ScrollBarThickness=isMobile and 3 or 4,
        ScrollBarImageColor3=colors.accent,
        BorderSizePixel=0,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
        ClipsDescendants=true,
        ScrollingEnabled=true,
        ElasticBehavior=Enum.ElasticBehavior.WhenScrollable,
        ZIndex=5
    })
    new("UIListLayout",{
        Parent=page,
        Padding=UDim.new(0,isMobile and 6 or 10),
        SortOrder=Enum.SortOrder.LayoutOrder
    })
    new("UIPadding",{
        Parent=page,
        PaddingTop=UDim.new(0,isMobile and 4 or 8),
        PaddingBottom=UDim.new(0,isMobile and 4 or 8)
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

local function createNavButton(text, icon, page, order)
    local btn = new("TextButton",{
        Parent=navContainer,
        Size=isMobile and UDim2.new(1,0,0,38) or UDim2.new(1,0,0,46),
        BackgroundColor3=page == currentPage and colors.bg4 or Color3.fromRGB(0,0,0),
        BackgroundTransparency=page == currentPage and 0.1 or 1,
        BorderSizePixel=0,
        Text="",
        AutoButtonColor=false,
        LayoutOrder=order,
        ZIndex=6
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,8)})
    
    local indicator = new("Frame",{
        Parent=btn,
        Size=isMobile and UDim2.new(0,3,0,14) or UDim2.new(0,4,0,20),
        Position=UDim2.new(0,0,0.5,isMobile and -7 or -10),
        BackgroundColor3=colors.accent,
        BorderSizePixel=0,
        Visible=page == currentPage,
        ZIndex=7
    })
    new("UICorner",{Parent=indicator,CornerRadius=UDim.new(1,0)})
    
    local iconLabel = new("TextLabel",{
        Parent=btn,
        Text=icon,
        Size=isMobile and UDim2.new(1,0,1,0) or UDim2.new(0,32,1,0),
        Position=isMobile and UDim2.new(0,0,0,0) or UDim2.new(0,10,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 14 or 18,
        TextColor3=page == currentPage and colors.accent or colors.textDim,
        ZIndex=7
    })
    
    local textLabel = new("TextLabel",{
        Parent=btn,
        Text=text,
        Size=UDim2.new(1,-50,1,0),
        Position=UDim2.new(0,46,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamSemibold,
        TextSize=11,
        TextColor3=page == currentPage and colors.text or colors.textDim,
        TextXAlignment=Enum.TextXAlignment.Left,
        Visible=isMobile and sidebarExpanded or not isMobile,
        ZIndex=7
    })
    
    navButtons[page] = {btn=btn, icon=iconLabel, text=textLabel, indicator=indicator}
    
    return btn
end

local lastPageSwitch = 0
local function switchPage(pageName, pageTitle_text)
    if currentPage == pageName then return end
    
    local now = tick()
    if now - lastPageSwitch < 0.2 then return end
    lastPageSwitch = now
    
    for _, page in pairs(pages) do page.Visible = false end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        playTween(btnData.btn, TweenInfo.new(0.15), {
            BackgroundColor3=isActive and colors.bg4 or Color3.fromRGB(0,0,0),
            BackgroundTransparency=isActive and 0.1 or 1
        })
        btnData.indicator.Visible = isActive
        playTween(btnData.icon, TweenInfo.new(0.15), {
            TextColor3=isActive and colors.accent or colors.textDim
        })
        if not isMobile or sidebarExpanded then
            playTween(btnData.text, TweenInfo.new(0.15), {
                TextColor3=isActive and colors.text or colors.textDim
            })
        end
    end
    
    pages[pageName].Visible = true
    pageTitle.Text = pageTitle_text
    currentPage = pageName
    
    if isMobile and sidebarExpanded then
        task.delay(0.2, toggleSidebar)
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

local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 38 or 50),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=false,
        ZIndex=6
    })
    new("UICorner",{Parent=categoryFrame,CornerRadius=UDim.new(0,8)})
    
    local header = new("TextButton",{
        Parent=categoryFrame,
        Size=UDim2.new(1,0,0,isMobile and 38 or 50),
        BackgroundTransparency=1,
        Text="",
        AutoButtonColor=false,
        ClipsDescendants=true,
        ZIndex=7
    })
    new("UICorner",{Parent=header,CornerRadius=UDim.new(0,8)})
    
    local iconLabel = new("TextLabel",{
        Parent=header,
        Text=icon,
        Size=isMobile and UDim2.new(0,26,0,26) or UDim2.new(0,34,0,34),
        Position=isMobile and UDim2.new(0,8,0.5,-13) or UDim2.new(0,10,0.5,-17),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 12 or 16,
        TextColor3=colors.accent,
        ZIndex=8
    })
    
    local titleLabel = new("TextLabel",{
        Parent=header,
        Text=title,
        Size=UDim2.new(1,-70,1,0),
        Position=isMobile and UDim2.new(0,36,0,0) or UDim2.new(0,48,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 10 or 13,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=8
    })
    
    local arrow = new("TextLabel",{
        Parent=header,
        Text="▼",
        Size=UDim2.new(0,isMobile and 16 or 20,1,0),
        Position=isMobile and UDim2.new(1,-20,0,0) or UDim2.new(1,-26,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 9 or 12,
        TextColor3=colors.accent,
        ZIndex=8
    })
    
    local contentContainer = new("Frame",{
        Parent=categoryFrame,
        Size=isMobile and UDim2.new(1,-14,0,0) or UDim2.new(1,-18,0,0),
        Position=isMobile and UDim2.new(0,7,0,42) or UDim2.new(0,9,0,56),
        BackgroundTransparency=1,
        Visible=false,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,
        ZIndex=7
    })
    new("UIListLayout",{Parent=contentContainer,Padding=UDim.new(0,isMobile and 5 or 8)})
    new("UIPadding",{Parent=contentContainer,PaddingBottom=UDim.new(0,isMobile and 8 or 12)})
    
    local isOpen = false
    local lastCategoryToggle = 0
    header.MouseButton1Click:Connect(function()
        local now = tick()
        if now - lastCategoryToggle < 0.25 then return end
        lastCategoryToggle = now
        
        isOpen = not isOpen
        contentContainer.Visible = isOpen
        playTween(arrow, TweenInfo.new(0.22, Enum.EasingStyle.Quart), {Rotation=isOpen and 180 or 0})
        playTween(categoryFrame, TweenInfo.new(0.18), {
            BackgroundColor3=isOpen and colors.bg4 or colors.bg3
        })
    end)
    
    return contentContainer
end

local function makeToggle(parent, label, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 30 or 38),
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
        TextSize=isMobile and 9 or 12,
        TextWrapped=true,
        ZIndex=8
    })
    
    local toggleBg = new("Frame",{
        Parent=frame,
        Size=isMobile and UDim2.new(0,40,0,20) or UDim2.new(0,48,0,24),
        Position=isMobile and UDim2.new(1,-42,0.5,-10) or UDim2.new(1,-50,0.5,-12),
        BackgroundColor3=colors.bg5,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=toggleBg,CornerRadius=UDim.new(1,0)})
    new("UIStroke",{Parent=toggleBg,Color=colors.border,Thickness=1,Transparency=0.5})
    
    local toggleCircle = new("Frame",{
        Parent=toggleBg,
        Size=isMobile and UDim2.new(0,16,0,16) or UDim2.new(0,20,0,20),
        Position=isMobile and UDim2.new(0,2,0.5,-8) or UDim2.new(0,2,0.5,-10),
        BackgroundColor3=colors.toggleWhite,
        BorderSizePixel=0,
        ZIndex=9
    })
    new("UICorner",{Parent=toggleCircle,CornerRadius=UDim.new(1,0)})
    
    local enabled = false
    local toggleBtn = new("TextButton",{
        Parent=toggleBg,
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text="",
        ZIndex=10
    })
    
    local lastToggleClick = 0
    toggleBtn.MouseButton1Click:Connect(function()
        local now = tick()
        if now - lastToggleClick < 0.25 then return end
        lastToggleClick = now
        
        enabled = not enabled
        local circlePos = enabled and (isMobile and UDim2.new(1,-18,0.5,-8) or UDim2.new(1,-22,0.5,-10)) or (isMobile and UDim2.new(0,2,0.5,-8) or UDim2.new(0,2,0.5,-10))
        local circleColor = enabled and colors.toggleWhite or colors.toggleWhite
        local bgColor = enabled and colors.accent or colors.bg5
        
        playTween(toggleCircle, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position=circlePos,
            BackgroundColor3=circleColor
        })
        playTween(toggleBg, TweenInfo.new(0.22), {
            BackgroundColor3=bgColor
        })
        if callback then callback(enabled) end
    end)
    
    return frame
end

local function makeSlider(parent, label, min, max, default, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 42 or 54),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local labelText = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(0.5,0,0,isMobile and 16 or 20),
        TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 9 or 12,
        ZIndex=8
    })
    
    local valueLabel = new("TextLabel",{
        Parent=frame,
        Text=tostring(default),
        Size=UDim2.new(0,isMobile and 30 or 40,0,isMobile and 16 or 20),
        Position=UDim2.new(1,isMobile and -32 or -42,0,0),
        BackgroundTransparency=1,
        TextColor3=colors.accent,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 9 or 12,
        TextXAlignment=Enum.TextXAlignment.Right,
        ZIndex=8
    })
    
    local sliderBg = new("Frame",{
        Parent=frame,
        Size=UDim2.new(1,0,0,isMobile and 6 or 8),
        Position=UDim2.new(0,0,1,isMobile and -10 or -14),
        BackgroundColor3=colors.bg5,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=sliderBg,CornerRadius=UDim.new(1,0)})
    
    local sliderFill = new("Frame",{
        Parent=sliderBg,
        Size=UDim2.new((default-min)/(max-min),0,1,0),
        BackgroundColor3=colors.accent,
        BorderSizePixel=0,
        ZIndex=9
    })
    new("UICorner",{Parent=sliderFill,CornerRadius=UDim.new(1,0)})
    
    local sliderKnob = new("Frame",{
        Parent=sliderBg,
        Size=UDim2.new(0,isMobile and 16 or 20,0,isMobile and 16 or 20),
        Position=UDim2.new((default-min)/(max-min),-isMobile and 8 or -10,0.5,-isMobile and 8 or -10),
        BackgroundColor3=colors.toggleWhite,
        BorderSizePixel=0,
        ZIndex=10
    })
    new("UICorner",{Parent=sliderKnob,CornerRadius=UDim.new(1,0)})
    new("UIStroke",{Parent=sliderKnob,Color=colors.accent,Thickness=2})
    
    local dragging = false
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        
        sliderFill.Size = UDim2.new(pos,0,1,0)
        sliderKnob.Position = UDim2.new(pos,-(isMobile and 8 or 10),0.5,-(isMobile and 8 or 10))
        valueLabel.Text = tostring(value)
        
        if callback then callback(value) end
    end
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return frame
end

local function makeDropdown(parent, label, icon, options, callback, uniqueId)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 30 or 38),
        BackgroundTransparency=1,
        AutomaticSize=Enum.AutomaticSize.Y,
        ZIndex=7
    })
    
    local dropBtn = new("TextButton",{
        Parent=frame,
        Size=UDim2.new(1,0,0,isMobile and 30 or 38),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        Text="",
        AutoButtonColor=false,
        ZIndex=8
    })
    new("UICorner",{Parent=dropBtn,CornerRadius=UDim.new(0,6)})
    
    local dropIcon = new("TextLabel",{
        Parent=dropBtn,
        Text=icon,
        Size=isMobile and UDim2.new(0,20,0,20) or UDim2.new(0,26,0,26),
        Position=isMobile and UDim2.new(0,6,0.5,-10) or UDim2.new(0,8,0.5,-13),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 10 or 13,
        TextColor3=colors.accent,
        ZIndex=9
    })
    
    local dropLabel = new("TextLabel",{
        Parent=dropBtn,
        Text=label,
        Size=UDim2.new(1,-isMobile and 50 or -64,1,0),
        Position=isMobile and UDim2.new(0,28,0,0) or UDim2.new(0,38,0,0),
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 9 or 11,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=9
    })
    
    local dropArrow = new("TextLabel",{
        Parent=dropBtn,
        Text="▼",
        Size=UDim2.new(0,isMobile and 14 or 18,1,0),
        Position=isMobile and UDim2.new(1,-18,0,0) or UDim2.new(1,-22,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8 or 10,
        TextColor3=colors.accent,
        ZIndex=9
    })
    
    local dropContainer = new("Frame",{
        Parent=frame,
        Size=UDim2.new(1,0,0,0),
        Position=UDim2.new(0,0,0,isMobile and 34 or 42),
        BackgroundColor3=colors.bg4,
        BorderSizePixel=0,
        Visible=false,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,
        ZIndex=8
    })
    new("UICorner",{Parent=dropContainer,CornerRadius=UDim.new(0,6)})
    new("UIListLayout",{Parent=dropContainer,Padding=UDim.new(0,2)})
    new("UIPadding",{Parent=dropContainer,PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,4)})
    
    local isOpen = false
    dropBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        dropContainer.Visible = isOpen
        playTween(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Rotation=isOpen and 180 or 0})
    end)
    
    for _, option in ipairs(options) do
        local optBtn = new("TextButton",{
            Parent=dropContainer,
            Size=UDim2.new(1,0,0,isMobile and 26 or 32),
            BackgroundColor3=colors.bg3,
            BackgroundTransparency=1,
            BorderSizePixel=0,
            Text=option,
            Font=Enum.Font.Gotham,
            TextSize=isMobile and 8 or 10,
            TextColor3=colors.textDim,
            AutoButtonColor=false,
            ZIndex=9
        })
        
        optBtn.MouseEnter:Connect(function()
            playTween(optBtn, TweenInfo.new(0.12), {
                BackgroundTransparency=0.5,
                TextColor3=colors.text
            })
        end)
        
        optBtn.MouseLeave:Connect(function()
            playTween(optBtn, TweenInfo.new(0.12), {
                BackgroundTransparency=1,
                TextColor3=colors.textDim
            })
        end)
        
        optBtn.MouseButton1Click:Connect(function()
            dropLabel.Text = label.." : "..option
            isOpen = false
            dropContainer.Visible = false
            playTween(dropArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Rotation=0})
            if callback then callback(option) end
        end)
    end
    
    return frame
end

local function makeInput(parent, label, placeholder, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 52 or 64),
        BackgroundTransparency=1,
        ZIndex=7
    })
    
    local labelText = new("TextLabel",{
        Parent=frame,
        Text=label,
        Size=UDim2.new(1,0,0,isMobile and 16 or 20),
        TextXAlignment=Enum.TextXAlignment.Left,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 9 or 12,
        ZIndex=8
    })
    
    local inputBox = new("TextBox",{
        Parent=frame,
        Size=UDim2.new(1,0,0,isMobile and 28 or 36),
        Position=UDim2.new(0,0,0,isMobile and 20 or 26),
        BackgroundColor3=colors.inputBg,
        BorderSizePixel=0,
        PlaceholderText=placeholder,
        PlaceholderColor3=colors.textDimmer,
        Text="",
        Font=Enum.Font.Gotham,
        TextSize=isMobile and 9 or 11,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ClearTextOnFocus=false,
        ZIndex=8
    })
    new("UICorner",{Parent=inputBox,CornerRadius=UDim.new(0,6)})
    local inputStroke = new("UIStroke",{Parent=inputBox,Color=colors.inputBorder,Thickness=1,Transparency=0.5})
    new("UIPadding",{Parent=inputBox,PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)})
    
    inputBox.Focused:Connect(function()
        playTween(inputStroke, TweenInfo.new(0.15), {Color=colors.inputFocus,Transparency=0})
    end)
    
    inputBox.FocusLost:Connect(function(enter)
        playTween(inputStroke, TweenInfo.new(0.15), {Color=colors.inputBorder,Transparency=0.5})
        if enter and callback then callback(inputBox.Text) end
    end)
    
    return frame
end

local catInstant = makeCategory(mainPage, "Instant Fishing", "⚡")
makeToggle(catInstant, "Enable Instant Fishing", function(on)
    if on then
        instant.Start()
    else
        instant.Stop()
    end
end)

local catInstant2 = makeCategory(mainPage, "Perfect Fishing (Instant 2)", "🎯")
makeToggle(catInstant2, "Enable Perfect Fishing", function(on)
    if on then
        instant2.Start()
    else
        instant2.Stop()
    end
end)

makeSlider(catInstant2, "Input Delay (ms)", 0, 1500, 500, function(value)
    if instant2.SetDelay then
        instant2.SetDelay(value)
    end
end)

local catInstant2x = makeCategory(mainPage, "Instant 2X Speed", "🚀")
makeToggle(catInstant2x, "Enable 2X Speed", function(on)
    if on then
        instant2x.Start()
    else
        instant2x.Stop()
    end
end)

makeSlider(catInstant2x, "Input Delay (ms)", 0, 1500, 500, function(value)
    if instant2x.SetDelay then
        instant2x.SetDelay(value)
    end
end)

local catBlatant = makeCategory(mainPage, "Blatant Fishing (OP)", "💎")
makeToggle(catBlatant, "Enable Blatant Mode", function(on)
    if on then
        blatantv2.Start()
    else
        blatantv2.Stop()
    end
end)

makeSlider(catBlatant, "Input Delay (ms)", 0, 1500, 500, function(value)
    if blatantv2.SetDelay then
        blatantv2.SetDelay(value)
    end
end)

local catNoAnim = makeCategory(mainPage, "No Fishing Animation", "🎭")
makeToggle(catNoAnim, "Disable Fishing Animation", function(on)
    if on then
        NoFishingAnimation.Start()
    else
        NoFishingAnimation.Stop()
    end
end)

local catLocation = makeCategory(teleportPage, "Location Teleport", "📍")
makeDropdown(catLocation, "Select Location", "🗺️", {
    "Ocean", "Lake", "River", "Pond", "Deep Sea", "Coral Reef"
}, function(selected)
    if TeleportModule and TeleportModule.ToLocation then
        TeleportModule.ToLocation(selected)
    end
end, "LocationDropdown")

local catPlayer = makeCategory(teleportPage, "Player Teleport", "👤")
makeInput(catPlayer, "Player Name", "Enter player name...", function(text)
    if TeleportToPlayer and text ~= "" then
        TeleportToPlayer.Teleport(text)
    end
end)

local catSell = makeCategory(shopPage, "Auto Sell", "💰")
makeToggle(catSell, "Enable Auto Sell", function(on)
    if on then
        AutoSell.Start()
    else
        AutoSell.Stop()
    end
end)

local catSellTimer = makeCategory(shopPage, "Auto Sell Timer", "⏱️")
makeToggle(catSellTimer, "Enable Sell Timer", function(on)
    if on then
        AutoSellTimer.Start()
    else
        AutoSellTimer.Stop()
    end
end)

makeSlider(catSellTimer, "Sell Interval (seconds)", 10, 300, 60, function(value)
    if AutoSellTimer.SetInterval then
        AutoSellTimer.SetInterval(value)
    end
end)

local catWeather = makeCategory(shopPage, "Auto Buy Weather", "🌤️")
makeToggle(catWeather, "Enable Auto Buy Weather", function(on)
    if on then
        AutoBuyWeather.Start()
    else
        AutoBuyWeather.Stop()
    end
end)

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

local infoContainer = new("Frame",{
    Parent=infoPage,
    Size=UDim2.new(1,0,0,isMobile and 360 or 480),
    BackgroundColor3=colors.bg3,
    BackgroundTransparency=0.1,
    BorderSizePixel=0,
    ZIndex=6
})
new("UICorner",{Parent=infoContainer,CornerRadius=UDim.new(0,10)})

local infoText = new("TextLabel",{
    Parent=infoContainer,
    Size=UDim2.new(1,-28,1,-28),
    Position=UDim2.new(0,14,0,14),
    BackgroundTransparency=1,
    Text=[[
⚫ LYNX v2.4 OPTIMIZED ⚡

Ultra Compact Black Interface
Performance Optimized Edition
Landscape Mobile & PC Ready

━━━━━━━━━━━━━━━━━━━━━━

🎣 AUTO FISHING
• Instant Fishing (Fast/Perfect)
• Horizontal input delay controls
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

💡 v2.4 IMPROVEMENTS
✓ Optimized rendering performance
✓ Smooth fade + scale animations
✓ Fixed toggle (white circle visible)
✓ Reduced transparency layers
✓ Debounced UI interactions
✓ Improved scroll performance
✓ Better mobile responsiveness
✓ Faster tween management

🎮 CONTROLS
• Click categories to expand
• Drag from top bar to move
• Drag corner to resize
• (▶/◀) Toggle sidebar (Mobile)
• (─) Minimize window
• (×) Close GUI

━━━━━━━━━━━━━━━━━━━━━━

Created by Lynx Team
Optimized Edition 2024
    ]],
    Font=Enum.Font.Gotham,
    TextSize=isMobile and 8 or 11,
    TextColor3=colors.text,
    TextWrapped=true,
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Top,
    ZIndex=7
})

local minimized = false
local icon
local savedIconPos = UDim2.new(0,18,0,110)
local logoAssetId = "rbxassetid://111416780887356"

local function createMinimizedIcon()
    if icon then return end
    local iconSize = isMobile and 42 or 56
    icon = new("ImageLabel",{
        Parent=gui,
        Size=UDim2.new(0,iconSize,0,iconSize),
        Position=savedIconPos,
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0,
        BorderSizePixel=0,
        Image=logoAssetId,
        ScaleType=Enum.ScaleType.Fit,
        ZIndex=100
    })
    new("UICorner",{Parent=icon,CornerRadius=UDim.new(0,8)})
    new("UIStroke",{Parent=icon,Color=colors.accent,Thickness=2,Transparency=0.3})
    
    local logoFallback = new("TextLabel",{
        Parent=icon,
        Text="L",
        Size=UDim2.new(1,0,1,0),
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 24 or 32,
        BackgroundTransparency=1,
        TextColor3=colors.text,
        Visible=icon.Image == "",
        ZIndex=101
    })
    
    logoFallback.Visible = (icon.Image == "")
    
    icon.BackgroundTransparency = 0
    
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
            icon.Position = newPos
        end
    end)
    
    icon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                savedIconPos = icon.Position
                if not dragMoved then
                    win.Visible = true
                    win.BackgroundTransparency = 1
                    win.Size = UDim2.new(0.85, 0, 0.85, 0)
                    
                    playTween(win, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size=windowSize,
                        Position=UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2),
                        BackgroundTransparency=0
                    })
                    
                    if icon then 
                        playTween(icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            Size=UDim2.new(0,0,0,0),
                            BackgroundTransparency=1
                        })
                        task.wait(0.3)
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
        local t1 = playTween(win, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size=UDim2.new(0.85,0,0.85,0),
            Position=UDim2.new(0.5,0,0.5,0),
            BackgroundTransparency=1
        })
        
        task.wait(0.3)
        win.Visible = false
        win.Size = windowSize
        win.BackgroundTransparency = 0
        createMinimizedIcon()
        minimized = true
    end
end)

btnClose.MouseButton1Click:Connect(function()
    playTween(win, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(0.5,0,0.5,0),
        BackgroundTransparency=1
    })
    task.wait(0.35)
    gui:Destroy()
end)

local dragging,dragStart,startPos = false,nil,nil

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging,dragStart,startPos = true,input.Position,win.Position
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

local resizing = false
local resizeStart,startSize = nil,nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing,resizeStart,startSize = true,input.Position,win.Size
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
        
        win.Size = UDim2.new(0,newWidth,0,newHeight)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        resizing = false 
    end
end)

task.spawn(function()
    win.BackgroundTransparency = 1
    win.Size = UDim2.new(0.7,0,0.7,0)
    win.Position = UDim2.new(0.5,-(windowSize.X.Offset*0.7)/2,0.5,-(windowSize.Y.Offset*0.7)/2)
    
    task.wait(0.08)
    
    playTween(win, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size=windowSize,
        Position=UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2),
        BackgroundTransparency=0
    })
end)

resizeHandle.MouseEnter:Connect(function()
    playTween(resizeHandle, TweenInfo.new(0.15), {
        BackgroundTransparency=0
    })
end)

resizeHandle.MouseLeave:Connect(function()
    if not resizing then
        playTween(resizeHandle, TweenInfo.new(0.15), {
            BackgroundTransparency=0.2
        })
    end
end)

print("⚡ Lynx GUI v2.4 OPTIMIZED loaded!")
print("🎯 LANDSCAPE MODE - Horizontal Rectangle")
print("📱 Mobile Optimized (480x260)")
print("⚫ Black Theme with Performance Optimizations")
print("✨ NEW: Smooth fade + scale animations")
print("✓ FIXED: Toggle white circle always visible")
print("⚡ Reduced lag with optimized rendering")
print("🖱️ Drag from top | Resize from corner")
print("💎 Created by Lynx Team - Optimized Edition")
