-- LynxGUI_v2.3.lua - Ultra Minimalist Black Edition (IMPROVED)
-- LANDSCAPE OPTIMIZED FOR MOBILE (Horizontal Rectangle)
-- FIXED: Input delays now show properly with horizontal layout
-- FIXED: Logo only appears when minimized

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
}

local windowSize = isMobile and UDim2.new(0,480,0,260) or UDim2.new(0,720,0,480)
local minWindowSize = isMobile and Vector2.new(420, 230) or Vector2.new(620, 420)
local maxWindowSize = isMobile and Vector2.new(580, 340) or Vector2.new(920, 620)

local gui = new("ScreenGui",{
    Name="LynxGUI_v2.3",
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
    BackgroundTransparency=0.05,
    BorderSizePixel=0,
    ClipsDescendants=false,
    ZIndex=3
})
new("UICorner",{Parent=win,CornerRadius=UDim.new(0,10)})

local overlay = new("Frame",{
    Parent=win,
    Size=UDim2.new(1,0,1,0),
    BackgroundColor3=colors.bg1,
    BackgroundTransparency=0.92,
    BorderSizePixel=0,
    ZIndex=2
})
new("UICorner",{Parent=overlay,CornerRadius=UDim.new(0,10)})

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
    BackgroundTransparency=0.05,
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
        BackgroundTransparency=0.15,
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
    Text="v2.3",
    Size=UDim2.new(1,0,0,14),
    Position=isMobile and UDim2.new(0,0,0,38) or UDim2.new(0,0,0,46),
    Font=Enum.Font.Gotham,
    TextSize=10,
    BackgroundTransparency=1,
    TextColor3=colors.textDim,
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
    BackgroundTransparency=0.1,
    BorderSizePixel=0,
    ClipsDescendants=true,
    ZIndex=4
})
new("UICorner",{Parent=contentBg,CornerRadius=UDim.new(0,10)})

local pages = {}
local currentPage = "Main"
local navButtons = {}

local function toggleSidebar()
    if not isMobile then return end
    
    sidebarExpanded = not sidebarExpanded
    local targetWidth = sidebarExpanded and sidebarExpandedWidth or sidebarCollapsedWidth
    
    TweenService:Create(sidebar,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{
        Size=UDim2.new(0,targetWidth,1,0)
    }):Play()
    
    TweenService:Create(contentBg,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{
        Size=UDim2.new(1,-(targetWidth+8),1,-12),
        Position=UDim2.new(0,targetWidth+6,0,7)
    }):Play()
    
    if sidebarToggle then
        TweenService:Create(sidebarToggle,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{
            Position=UDim2.new(0,targetWidth-3,1,-54)
        }):Play()
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
    BackgroundTransparency=0.15,
    BorderSizePixel=0,
    ZIndex=5
})
new("UICorner",{Parent=topBar,CornerRadius=UDim.new(0,10)})

local dragHandle = new("Frame",{
    Parent=topBar,
    Size=isMobile and UDim2.new(0,24,0,3) or UDim2.new(0,40,0,4),
    Position=isMobile and UDim2.new(0.5,-12,0,5) or UDim2.new(0.5,-20,0,7),
    BackgroundColor3=colors.primary,
    BackgroundTransparency=0.25,
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
        BackgroundTransparency=0.15,
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
        TweenService:Create(btn,TweenInfo.new(0.18),{
            BackgroundColor3=color,
            BackgroundTransparency=0.08,
            TextColor3=colors.text
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.18),{
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.15,
            TextColor3=colors.textDim
        }):Play()
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
    BackgroundTransparency=0.25,
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
        BackgroundTransparency=page == currentPage and 0.15 or 1,
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

local function switchPage(pageName, pageTitle_text)
    if currentPage == pageName then return end
    for _, page in pairs(pages) do page.Visible = false end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        TweenService:Create(btnData.btn,TweenInfo.new(0.18),{
            BackgroundColor3=isActive and colors.bg4 or Color3.fromRGB(0,0,0),
            BackgroundTransparency=isActive and 0.15 or 1
        }):Play()
        btnData.indicator.Visible = isActive
        TweenService:Create(btnData.icon,TweenInfo.new(0.18),{
            TextColor3=isActive and colors.accent or colors.textDim
        }):Play()
        if not isMobile or sidebarExpanded then
            TweenService:Create(btnData.text,TweenInfo.new(0.18),{
                TextColor3=isActive and colors.text or colors.textDim
            }):Play()
        end
    end
    
    pages[pageName].Visible = true
    pageTitle.Text = pageTitle_text
    currentPage = pageName
    
    if isMobile and sidebarExpanded then
        task.wait(0.25)
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

local function makeCategory(parent, title, icon)
    local categoryFrame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 38 or 50),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.25,
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
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        contentContainer.Visible = isOpen
        TweenService:Create(arrow,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{Rotation=isOpen and 180 or 0}):Play()
        TweenService:Create(categoryFrame,TweenInfo.new(0.2),{
            BackgroundColor3=isOpen and colors.bg4 or colors.bg3
        }):Play()
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
        BackgroundColor3=colors.textDim,
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
    
    toggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        local circlePos = enabled and (isMobile and UDim2.new(1,-18,0.5,-8) or UDim2.new(1,-22,0.5,-10)) or (isMobile and UDim2.new(0,2,0.5,-8) or UDim2.new(0,2,0.5,-10))
        TweenService:Create(toggleCircle,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Position=circlePos,BackgroundColor3=enabled and colors.accent or colors.textDim}):Play()
        TweenService:Create(toggleBg,TweenInfo.new(0.2),{BackgroundColor3=enabled and colors.accent or colors.bg5}):Play()
        if callback then callback(enabled) end
    end)
    
    return frame
end

local function makeInput(parent, label, defaultValue, callback)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 32 or 40),
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
        TextSize=isMobile and 9 or 12,
        TextWrapped=true,
        ZIndex=8
    })
    
    local inputContainer = new("Frame",{
        Parent=frame,
        Size=isMobile and UDim2.new(0.42,-4,0,26) or UDim2.new(0.42,-6,0,32),
        Position=isMobile and UDim2.new(0.58,2,0.5,-13) or UDim2.new(0.58,3,0.5,-16),
        BackgroundColor3=colors.inputBg,
        BorderSizePixel=0,
        ZIndex=8
    })
    new("UICorner",{Parent=inputContainer,CornerRadius=UDim.new(0,6)})
    local inputStroke = new("UIStroke",{
        Parent=inputContainer,
        Color=colors.inputBorder,
        Thickness=1.5,
        Transparency=0.3
    })
    
    local inputBox = new("TextBox",{
        Parent=inputContainer,
        Size=UDim2.new(1,-16,1,0),
        Position=UDim2.new(0,8,0,0),
        BackgroundTransparency=1,
        Text=tostring(defaultValue),
        PlaceholderText="0.00",
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 10 or 13,
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
        TweenService:Create(inputStroke,TweenInfo.new(0.2),{Color=colors.inputBorder,Transparency=0.3}):Play()
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
        Size=UDim2.new(1,0,0,isMobile and 30 or 38),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        Text=label,
        Font=Enum.Font.GothamSemibold,
        TextSize=isMobile and 9 or 12,
        TextColor3=colors.text,
        AutoButtonColor=false,
        ZIndex=8
    })
    new("UICorner",{Parent=btn,CornerRadius=UDim.new(0,6)})
    new("UIStroke",{Parent=btn,Color=colors.border,Thickness=1,Transparency=0.6})
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.18),{BackgroundColor3=colors.accent,BackgroundTransparency=0.15}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.18),{BackgroundColor3=colors.bg4,BackgroundTransparency=0.2}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return btn
end

local dropdownStates = {}

local function makeDropdown(parent, label, icon, items, callback, id)
    local frame = new("Frame",{
        Parent=parent,
        Size=UDim2.new(1,0,0,isMobile and 32 or 40),
        BackgroundTransparency=1,
        AutomaticSize=Enum.AutomaticSize.Y,
        ZIndex=7
    })
    
    local header = new("TextButton",{
        Parent=frame,
        Size=UDim2.new(1,0,0,isMobile and 32 or 40),
        BackgroundColor3=colors.bg4,
        BackgroundTransparency=0.2,
        BorderSizePixel=0,
        Text="",
        AutoButtonColor=false,
        ZIndex=8
    })
    new("UICorner",{Parent=header,CornerRadius=UDim.new(0,6)})
    
    local iconLabel = new("TextLabel",{
        Parent=header,
        Text=icon,
        Size=isMobile and UDim2.new(0,22,1,0) or UDim2.new(0,28,1,0),
        Position=UDim2.new(0,isMobile and 6 or 10,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 10 or 14,
        TextColor3=colors.accent,
        ZIndex=9
    })
    
    local labelText = new("TextLabel",{
        Parent=header,
        Text=label,
        Size=UDim2.new(1,-60,1,0),
        Position=UDim2.new(0,isMobile and 30 or 42,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamMedium,
        TextSize=isMobile and 9 or 12,
        TextColor3=colors.text,
        TextXAlignment=Enum.TextXAlignment.Left,
        ZIndex=9
    })
    
    local arrow = new("TextLabel",{
        Parent=header,
        Text="▼",
        Size=UDim2.new(0,isMobile and 14 or 18,1,0),
        Position=isMobile and UDim2.new(1,-18,0,0) or UDim2.new(1,-24,0,0),
        BackgroundTransparency=1,
        Font=Enum.Font.GothamBold,
        TextSize=isMobile and 8 or 11,
        TextColor3=colors.textDim,
        ZIndex=9
    })
    
    local listContainer = new("Frame",{
        Parent=frame,
        Size=UDim2.new(1,0,0,0),
        Position=UDim2.new(0,0,0,isMobile and 36 or 44),
        BackgroundColor3=colors.bg3,
        BackgroundTransparency=0.1,
        BorderSizePixel=0,
        Visible=false,
        AutomaticSize=Enum.AutomaticSize.Y,
        ClipsDescendants=true,
        ZIndex=10
    })
    new("UICorner",{Parent=listContainer,CornerRadius=UDim.new(0,6)})
    new("UIListLayout",{Parent=listContainer,Padding=UDim.new(0,2)})
    new("UIPadding",{Parent=listContainer,PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,4),PaddingLeft=UDim.new(0,4),PaddingRight=UDim.new(0,4)})
    
    for _, item in ipairs(items) do
        local itemBtn = new("TextButton",{
            Parent=listContainer,
            Size=UDim2.new(1,0,0,isMobile and 26 or 32),
            BackgroundColor3=colors.bg4,
            BackgroundTransparency=0.3,
            BorderSizePixel=0,
            Text=item,
            Font=Enum.Font.GothamMedium,
            TextSize=isMobile and 8 or 11,
            TextColor3=colors.text,
            AutoButtonColor=false,
            ZIndex=11
        })
        new("UICorner",{Parent=itemBtn,CornerRadius=UDim.new(0,4)})
        
        itemBtn.MouseEnter:Connect(function()
            TweenService:Create(itemBtn,TweenInfo.new(0.15),{BackgroundColor3=colors.accent,BackgroundTransparency=0.2}):Play()
        end)
        itemBtn.MouseLeave:Connect(function()
            TweenService:Create(itemBtn,TweenInfo.new(0.15),{BackgroundColor3=colors.bg4,BackgroundTransparency=0.3}):Play()
        end)
        itemBtn.MouseButton1Click:Connect(function()
            labelText.Text = label .. ": " .. item
            listContainer.Visible = false
            TweenService:Create(arrow,TweenInfo.new(0.2),{Rotation=0}):Play()
            if id then dropdownStates[id] = false end
            if callback then callback(item) end
        end)
    end
    
    if id then dropdownStates[id] = false end
    
    header.MouseButton1Click:Connect(function()
        local isOpen = not listContainer.Visible
        listContainer.Visible = isOpen
        TweenService:Create(arrow,TweenInfo.new(0.2,Enum.EasingStyle.Quart),{Rotation=isOpen and 180 or 0}):Play()
        if id then dropdownStates[id] = isOpen end
    end)
    
    return frame
end

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
makeToggle(catBlatant,"Blatant Features",function(on) if on then instant2x.Start() else instant2x.Stop() end end)

makeInput(catBlatant,"Fishing Delay",0.3,function(v) instant2x.Settings.FishingDelay=v end)
makeInput(catBlatant,"Cancel Delay",0.19,function(v) instant2x.Settings.CancelDelay=v end)

local catBlatantV2 = makeCategory(mainPage, "Blatant V2", "🔥")
makeToggle(catBlatantV2,"Blatant Features",function(on) if on then blatantv2.Start() else blatantv2.Stop() end end)

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
    BackgroundTransparency=0.15,
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
⚫ LYNX v2.3 MINIMALIST

Ultra Compact Black Interface
Landscape Mobile Optimized

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

💡 v2.3 IMPROVEMENTS
✓ Fixed input delay display
✓ Horizontal layout for inputs
✓ Logo only shows when minimized
✓ Improved color scheme
✓ Better spacing & styling
✓ Enhanced visual feedback

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
        BackgroundTransparency=0.08,
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
            TweenService:Create(icon,TweenInfo.new(0.06),{Position=newPos}):Play()
        end
    end)
    
    icon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                savedIconPos = icon.Position
                if not dragMoved then
                    win.Visible = true
                    TweenService:Create(win,TweenInfo.new(0.35,Enum.EasingStyle.Quart),{
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
        TweenService:Create(win,TweenInfo.new(0.28,Enum.EasingStyle.Quart),{
            Size=UDim2.new(0,0,0,0),
            Position=targetPos
        }):Play()
        task.wait(0.28)
        win.Visible = false
        createMinimizedIcon()
        minimized = true
    end
end)

btnClose.MouseButton1Click:Connect(function()
    TweenService:Create(win,TweenInfo.new(0.28,Enum.EasingStyle.Quart),{
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(0.5,0,0.5,0)
    }):Play()
    task.wait(0.28)
    gui:Destroy()
end)

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
        dragTween = TweenService:Create(win,TweenInfo.new(0.06,Enum.EasingStyle.Linear),{Position=newPos})
        dragTween:Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end
end)

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
        resizeTween = TweenService:Create(win,TweenInfo.new(0.06,Enum.EasingStyle.Linear),{
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

task.spawn(function()
    win.Size = UDim2.new(0,0,0,0)
    win.Position = UDim2.new(0.5,-windowSize.X.Offset/2,0.5,-windowSize.Y.Offset/2)
    
    task.wait(0.12)
    
    TweenService:Create(win,TweenInfo.new(0.45,Enum.EasingStyle.Quart),{
        Size=windowSize
    }):Play()
end)

resizeHandle.MouseEnter:Connect(function()
    TweenService:Create(resizeHandle,TweenInfo.new(0.18),{
        BackgroundTransparency=0.08
    }):Play()
end)

resizeHandle.MouseLeave:Connect(function()
    if not resizing then
        TweenService:Create(resizeHandle,TweenInfo.new(0.18),{
            BackgroundTransparency=0.25
        }):Play()
    end
end)

print("⚫ Lynx GUI v2.3 Minimalist loaded!")
print("🎯 LANDSCAPE MODE - Horizontal Rectangle")
print("📱 Mobile Optimized (480x260)")
print("⚫ Black Transparent Theme")
print("⌨️ FIXED: Input delay controls with horizontal layout")
print("🖼️ FIXED: Logo only appears when minimized")
print("🖱️ Drag from top | Resize from corner")
print("💎 Created by Lynx Team")
