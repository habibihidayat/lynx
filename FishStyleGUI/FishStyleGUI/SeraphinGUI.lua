-- SeraphinGUI.lua - Seraphin Premium Style for Fish It Roblox
-- Rebuilt from LynxGUI with Seraphin Premium Dark Transparent Theme

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
    for k, v in pairs(props or {}) do inst[k] = v end
    return inst
end

-- Load modules (dari script original)
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

-- Seraphin Premium Color Palette (Dark Transparent Theme)
local colors = {
    bg = Color3.fromRGB(20, 20, 25),
    bgTransparent = 0.15,
    sidebar = Color3.fromRGB(25, 25, 30),
    sidebarTransparent = 0.1,
    content = Color3.fromRGB(30, 30, 35),
    contentTransparent = 0.2,
    
    accent = Color3.fromRGB(70, 130, 180),
    accentHover = Color3.fromRGB(90, 150, 200),
    
    text = Color3.fromRGB(255, 255, 255),
    textDim = Color3.fromRGB(180, 180, 180),
    textDimmer = Color3.fromRGB(120, 120, 120),
    
    inputBg = Color3.fromRGB(40, 40, 45),
    inputBorder = Color3.fromRGB(60, 60, 65),
    
    toggleOn = Color3.fromRGB(255, 255, 255),
    toggleOff = Color3.fromRGB(80, 80, 85),
    toggleBg = Color3.fromRGB(50, 50, 55),
    
    danger = Color3.fromRGB(200, 80, 80),
    success = Color3.fromRGB(80, 200, 120),
}

-- Settings storage
local settings = {
    delayReel = 1.8,
    delayComplete = 0.7,
    delayShake = 0.5,
    delayCast = 0.3,
    blatantFishing = false,
    recoveryFishing = false,
    instantCatch = false,
    instant2Speed = false,
    instant2XSpeed = false,
    noFishingAnim = false,
    autoSell = false,
    autoSellTimer = 60,
    antiAFK = false,
    unlockFPS = false,
    autoBuyWeather = false,
}

-- Window sizing
local windowSize = isMobile and UDim2.new(0, 420, 0, 300) or UDim2.new(0, 500, 0, 350)
local sidebarWidth = isMobile and 120 or 150

-- Main ScreenGui
local gui = new("ScreenGui", {
    Name = "SeraphinGUI",
    Parent = localPlayer.PlayerGui,
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999
})

-- Minimize Button (Logo only - shown when minimized)
local minimizeBtn = new("ImageButton", {
    Parent = gui,
    Size = UDim2.new(0, 50, 0, 50),
    Position = UDim2.new(0, 20, 0.5, -25),
    BackgroundColor3 = colors.bg,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    Image = "rbxassetid://111416780887356",
    ScaleType = Enum.ScaleType.Fit,
    Visible = false,
    ZIndex = 100
})
new("UICorner", {Parent = minimizeBtn, CornerRadius = UDim.new(0, 10)})
new("UIStroke", {
    Parent = minimizeBtn,
    Color = colors.accent,
    Thickness = 2,
    Transparency = 0.5
})

-- Main Window
local mainWindow = new("Frame", {
    Parent = gui,
    Size = windowSize,
    Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2),
    BackgroundColor3 = colors.bg,
    BackgroundTransparency = colors.bgTransparent,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Visible = true,
    ZIndex = 10
})
new("UICorner", {Parent = mainWindow, CornerRadius = UDim.new(0, 12)})

-- Window border
new("UIStroke", {
    Parent = mainWindow,
    Color = Color3.fromRGB(50, 50, 55),
    Thickness = 1,
    Transparency = 0.5
})

-- Title Bar
local titleBar = new("Frame", {
    Parent = mainWindow,
    Size = UDim2.new(1, 0, 0, 40),
    BackgroundColor3 = colors.sidebar,
    BackgroundTransparency = colors.sidebarTransparent,
    BorderSizePixel = 0,
    ZIndex = 11
})

-- Title Text
local titleText = new("TextLabel", {
    Parent = titleBar,
    Text = "Seraphin | Premium",
    Size = UDim2.new(1, -50, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = isMobile and 14 or 16,
    TextColor3 = colors.text,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 12
})

-- Close Button
local closeBtn = new("TextButton", {
    Parent = titleBar,
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -35, 0.5, -15),
    BackgroundTransparency = 1,
    Text = "×",
    Font = Enum.Font.GothamBold,
    TextSize = 24,
    TextColor3 = colors.textDim,
    ZIndex = 12
})

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {TextColor3 = colors.danger}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {TextColor3 = colors.textDim}):Play()
end)

-- Sidebar
local sidebar = new("Frame", {
    Parent = mainWindow,
    Size = UDim2.new(0, sidebarWidth, 1, -40),
    Position = UDim2.new(0, 0, 0, 40),
    BackgroundColor3 = colors.sidebar,
    BackgroundTransparency = colors.sidebarTransparent,
    BorderSizePixel = 0,
    ZIndex = 11
})

-- Sidebar separator line
local sidebarLine = new("Frame", {
    Parent = sidebar,
    Size = UDim2.new(0, 1, 1, 0),
    Position = UDim2.new(1, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(50, 50, 55),
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
    ZIndex = 12
})

-- Navigation Container
local navContainer = new("Frame", {
    Parent = sidebar,
    Size = UDim2.new(1, -10, 1, -20),
    Position = UDim2.new(0, 5, 0, 10),
    BackgroundTransparency = 1,
    ZIndex = 12
})
new("UIListLayout", {
    Parent = navContainer,
    Padding = UDim.new(0, 5),
    SortOrder = Enum.SortOrder.LayoutOrder
})

-- Content Area
local contentArea = new("Frame", {
    Parent = mainWindow,
    Size = UDim2.new(1, -sidebarWidth - 10, 1, -50),
    Position = UDim2.new(0, sidebarWidth + 5, 0, 45),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    ZIndex = 11
})

-- Pages container
local pages = {}
local currentPage = "Main"
local navButtons = {}

-- Create Page function
local function createPage(name)
    local page = new("ScrollingFrame", {
        Parent = contentArea,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = colors.accent,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ZIndex = 12
    })
    new("UIListLayout", {
        Parent = page,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    new("UIPadding", {
        Parent = page,
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5)
    })
    pages[name] = page
    return page
end

-- Page Title Label
local function createPageTitle(parent, title)
    local titleLabel = new("TextLabel", {
        Parent = parent,
        Text = title,
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 18 or 22,
        TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 13
    })
    return titleLabel
end

-- Create Input Field (replaces slider)
local function createInputField(parent, label, defaultValue, callback)
    local container = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        ZIndex = 13
    })
    
    local labelText = new("TextLabel", {
        Parent = container,
        Text = label,
        Size = UDim2.new(0.6, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = isMobile and 12 or 14,
        TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    })
    
    local inputFrame = new("Frame", {
        Parent = container,
        Size = UDim2.new(0, isMobile and 70 or 80, 0, 30),
        Position = UDim2.new(1, isMobile and -70 or -80, 0.5, -15),
        BackgroundColor3 = colors.inputBg,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 14
    })
    new("UICorner", {Parent = inputFrame, CornerRadius = UDim.new(0, 6)})
    new("UIStroke", {
        Parent = inputFrame,
        Color = colors.inputBorder,
        Thickness = 1,
        Transparency = 0.5
    })
    
    local inputBox = new("TextBox", {
        Parent = inputFrame,
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 12 or 14,
        TextColor3 = colors.text,
        Text = tostring(defaultValue),
        PlaceholderText = "0.00",
        PlaceholderColor3 = colors.textDimmer,
        TextXAlignment = Enum.TextXAlignment.Center,
        ClearTextOnFocus = false,
        ZIndex = 15
    })
    
    inputBox.FocusLost:Connect(function(enterPressed)
        local value = tonumber(inputBox.Text)
        if value then
            inputBox.Text = tostring(value)
            if callback then callback(value) end
        else
            inputBox.Text = tostring(defaultValue)
        end
    end)
    
    return container, inputBox
end

-- Create Toggle Switch
local function createToggle(parent, label, defaultState, callback)
    local container = new("Frame", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        ZIndex = 13
    })
    
    local labelText = new("TextLabel", {
        Parent = container,
        Text = label,
        Size = UDim2.new(0.7, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = isMobile and 12 or 14,
        TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    })
    
    local toggleBg = new("Frame", {
        Parent = container,
        Size = UDim2.new(0, 44, 0, 24),
        Position = UDim2.new(1, -50, 0.5, -12),
        BackgroundColor3 = defaultState and colors.toggleOn or colors.toggleBg,
        BorderSizePixel = 0,
        ZIndex = 14
    })
    new("UICorner", {Parent = toggleBg, CornerRadius = UDim.new(1, 0)})
    
    local toggleCircle = new("Frame", {
        Parent = toggleBg,
        Size = UDim2.new(0, 18, 0, 18),
        Position = defaultState and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9),
        BackgroundColor3 = defaultState and colors.bg or colors.text,
        BorderSizePixel = 0,
        ZIndex = 15
    })
    new("UICorner", {Parent = toggleCircle, CornerRadius = UDim.new(1, 0)})
    
    local toggleBtn = new("TextButton", {
        Parent = toggleBg,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 16
    })
    
    local isOn = defaultState
    
    toggleBtn.MouseButton1Click:Connect(function()
        isOn = not isOn
        
        TweenService:Create(toggleBg, TweenInfo.new(0.2), {
            BackgroundColor3 = isOn and colors.toggleOn or colors.toggleBg
        }):Play()
        
        TweenService:Create(toggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
            Position = isOn and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9),
            BackgroundColor3 = isOn and colors.bg or colors.text
        }):Play()
        
        if callback then callback(isOn) end
    end)
    
    return container, function() return isOn end
end

-- Create Section Header
local function createSectionHeader(parent, title)
    local header = new("TextLabel", {
        Parent = parent,
        Text = title,
        Size = UDim2.new(1, 0, 0, 25),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = isMobile and 11 or 13,
        TextColor3 = colors.textDim,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    })
    return header
end

-- Create Button
local function createButton(parent, label, callback)
    local btn = new("TextButton", {
        Parent = parent,
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = colors.inputBg,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        Text = label,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 12 or 14,
        TextColor3 = colors.text,
        AutoButtonColor = false,
        ZIndex = 14
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0, 8)})
    new("UIStroke", {
        Parent = btn,
        Color = colors.inputBorder,
        Thickness = 1,
        Transparency = 0.5
    })
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = colors.accent,
            BackgroundTransparency = 0.2
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = colors.inputBg,
            BackgroundTransparency = 0.3
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return btn
end

-- Create Navigation Button
local function createNavButton(text, icon, pageName, order)
    local btn = new("TextButton", {
        Parent = navContainer,
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = colors.content,
        BackgroundTransparency = pageName == currentPage and 0.5 or 1,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = order,
        ZIndex = 13
    })
    new("UICorner", {Parent = btn, CornerRadius = UDim.new(0, 6)})
    
    local iconLabel = new("TextLabel", {
        Parent = btn,
        Text = icon,
        Size = UDim2.new(0, 25, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = pageName == currentPage and colors.text or colors.textDim,
        ZIndex = 14
    })
    
    local textLabel = new("TextLabel", {
        Parent = btn,
        Text = text,
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 35, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium,
        TextSize = isMobile and 11 or 12,
        TextColor3 = pageName == currentPage and colors.text or colors.textDim,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    })
    
    navButtons[pageName] = {btn = btn, icon = iconLabel, text = textLabel}
    
    btn.MouseEnter:Connect(function()
        if pageName ~= currentPage then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.7}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if pageName ~= currentPage then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        end
    end)
    
    return btn
end

-- Switch Page function
local function switchPage(pageName)
    if currentPage == pageName then return end
    
    for name, page in pairs(pages) do
        page.Visible = false
    end
    
    for name, btnData in pairs(navButtons) do
        local isActive = name == pageName
        TweenService:Create(btnData.btn, TweenInfo.new(0.2), {
            BackgroundTransparency = isActive and 0.5 or 1
        }):Play()
        TweenService:Create(btnData.icon, TweenInfo.new(0.2), {
            TextColor3 = isActive and colors.text or colors.textDim
        }):Play()
        TweenService:Create(btnData.text, TweenInfo.new(0.2), {
            TextColor3 = isActive and colors.text or colors.textDim
        }):Play()
    end
    
    pages[pageName].Visible = true
    currentPage = pageName
end

-- Create Pages
local infoPage = createPage("Info")
local exclusivePage = createPage("Exclusive")
local mainPage = createPage("Main")
local menuPage = createPage("Menu")
local tradingPage = createPage("Trading")
local questPage = createPage("Quest")

-- Create Navigation Buttons (sesuai gambar Seraphin)
local btnInfo = createNavButton("Info", "📋", "Info", 1)
local btnExclusive = createNavButton("Exclusive", "⭐", "Exclusive", 2)
local btnMain = createNavButton("Main", "🎮", "Main", 3)
local btnMenu = createNavButton("Menu", "📁", "Menu", 4)
local btnTrading = createNavButton("Trading", "💰", "Trading", 5)
local btnQuest = createNavButton("Quest", "📜", "Quest", 6)

-- Connect navigation
btnInfo.MouseButton1Click:Connect(function() switchPage("Info") end)
btnExclusive.MouseButton1Click:Connect(function() switchPage("Exclusive") end)
btnMain.MouseButton1Click:Connect(function() switchPage("Main") end)
btnMenu.MouseButton1Click:Connect(function() switchPage("Menu") end)
btnTrading.MouseButton1Click:Connect(function() switchPage("Trading") end)
btnQuest.MouseButton1Click:Connect(function() switchPage("Quest") end)

-- ============ INFO PAGE ============
createPageTitle(infoPage, "Info")
createSectionHeader(infoPage, "Script Information")

local infoText = new("TextLabel", {
    Parent = infoPage,
    Text = "Seraphin Premium\nFish It Script\n\nVersion: 2.0\nStyle: Dark Transparent\n\nCredits:\n- Original: LynxGUI\n- Modules: habibihidayat",
    Size = UDim2.new(1, 0, 0, 150),
    BackgroundColor3 = colors.inputBg,
    BackgroundTransparency = 0.5,
    Font = Enum.Font.Gotham,
    TextSize = isMobile and 11 or 13,
    TextColor3 = colors.textDim,
    TextWrapped = true,
    TextYAlignment = Enum.TextYAlignment.Top,
    ZIndex = 14
})
new("UICorner", {Parent = infoText, CornerRadius = UDim.new(0, 8)})
new("UIPadding", {Parent = infoText, PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10)})

-- ============ EXCLUSIVE PAGE ============
createPageTitle(exclusivePage, "Exclusive")
createSectionHeader(exclusivePage, "Premium Features")

createToggle(exclusivePage, "Instant Catch", settings.instantCatch, function(state)
    settings.instantCatch = state
    if instant then instant.Toggle(state) end
end)

createToggle(exclusivePage, "Instant 2 Speed", settings.instant2Speed, function(state)
    settings.instant2Speed = state
    if instant2 then instant2.Toggle(state) end
end)

createToggle(exclusivePage, "Instant 2X Speed", settings.instant2XSpeed, function(state)
    settings.instant2XSpeed = state
    if instant2x then instant2x.Toggle(state) end
end)

createToggle(exclusivePage, "No Fishing Animation", settings.noFishingAnim, function(state)
    settings.noFishingAnim = state
    if NoFishingAnimation then NoFishingAnimation.Toggle(state) end
end)

-- ============ MAIN PAGE ============
createPageTitle(mainPage, "Main")

createInputField(mainPage, "Delay Reel", settings.delayReel, function(value)
    settings.delayReel = value
end)

createInputField(mainPage, "Delay Complete", settings.delayComplete, function(value)
    settings.delayComplete = value
end)

createToggle(mainPage, "Blatant Fishing", settings.blatantFishing, function(state)
    settings.blatantFishing = state
    if blatantv2 then blatantv2.Toggle(state) end
end)

createSectionHeader(mainPage, "")

createToggle(mainPage, "Recovery Fishing", settings.recoveryFishing, function(state)
    settings.recoveryFishing = state
end)

-- ============ MENU PAGE ============
createPageTitle(menuPage, "Menu")
createSectionHeader(menuPage, "Delay Settings")

createInputField(menuPage, "Delay Shake", settings.delayShake, function(value)
    settings.delayShake = value
end)

createInputField(menuPage, "Delay Cast", settings.delayCast, function(value)
    settings.delayCast = value
end)

createSectionHeader(menuPage, "Miscellaneous")

createToggle(menuPage, "Anti AFK", settings.antiAFK, function(state)
    settings.antiAFK = state
    if AntiAFK then AntiAFK.Toggle(state) end
end)

createToggle(menuPage, "Unlock FPS", settings.unlockFPS, function(state)
    settings.unlockFPS = state
    if UnlockFPS then UnlockFPS.Toggle(state) end
end)

-- ============ TRADING PAGE ============
createPageTitle(tradingPage, "Trading")
createSectionHeader(tradingPage, "Shop Features")

createToggle(tradingPage, "Auto Sell", settings.autoSell, function(state)
    settings.autoSell = state
    if AutoSell then AutoSell.Toggle(state) end
end)

createInputField(tradingPage, "Auto Sell Timer (sec)", settings.autoSellTimer, function(value)
    settings.autoSellTimer = value
    if AutoSellTimer then AutoSellTimer.SetTimer(value) end
end)

createToggle(tradingPage, "Auto Buy Weather", settings.autoBuyWeather, function(state)
    settings.autoBuyWeather = state
    if AutoBuyWeather then AutoBuyWeather.Toggle(state) end
end)

-- ============ QUEST PAGE ============
createPageTitle(questPage, "Quest")
createSectionHeader(questPage, "Teleport System")

createButton(questPage, "Teleport to Spawn", function()
    if TeleportModule then TeleportModule.ToSpawn() end
end)

createButton(questPage, "Teleport to Shop", function()
    if TeleportModule then TeleportModule.ToShop() end
end)

createButton(questPage, "Teleport to Fishing Spot", function()
    if TeleportModule then TeleportModule.ToFishingSpot() end
end)

createSectionHeader(questPage, "Player Teleport")

createButton(questPage, "Teleport to Random Player", function()
    if TeleportToPlayer then TeleportToPlayer.ToRandom() end
end)

-- Set Main page as default
mainPage.Visible = true

-- ============ WINDOW CONTROLS ============

-- Dragging functionality
local dragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainWindow.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainWindow.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Minimize/Maximize functionality (tanpa animasi berputar)
local isMinimized = false

local function minimizeWindow()
    isMinimized = true
    TweenService:Create(mainWindow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0, 20 + 25, 0.5, 0)
    }):Play()
    
    task.wait(0.3)
    mainWindow.Visible = false
    minimizeBtn.Visible = true
    
    TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end

local function maximizeWindow()
    isMinimized = false
    minimizeBtn.Visible = false
    mainWindow.Visible = true
    mainWindow.Size = UDim2.new(0, 0, 0, 0)
    mainWindow.Position = UDim2.new(0, 45, 0.5, 0)
    
    TweenService:Create(mainWindow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = windowSize,
        Position = UDim2.new(0.5, -windowSize.X.Offset/2, 0.5, -windowSize.Y.Offset/2)
    }):Play()
end

-- Close button - simple fade out (tanpa animasi berputar)
closeBtn.MouseButton1Click:Connect(function()
    minimizeWindow()
end)

-- Minimize button (logo) click to restore
minimizeBtn.MouseButton1Click:Connect(function()
    maximizeWindow()
end)

-- Mobile touch support for minimize button
if isMobile then
    minimizeBtn.TouchTap:Connect(function()
        maximizeWindow()
    end)
end

print("Seraphin Premium GUI Loaded Successfully!")
