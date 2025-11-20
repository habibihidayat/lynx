# Lynx GUI v2.0 Enhanced

## Overview

Lynx GUI v2.0 Enhanced is a Roblox game GUI script with a modern glass morphism design. The **Enhanced Edition** features significant improvements including 40% more vibrant colors, improved transparency, fixed resize behavior (right/bottom only), removed dark overlay, and added premium visual effects like border glows and gradients throughout.

The project consists of a documentation website served via a Python HTTP server and a Lua-based Roblox GUI script that provides various game automation features including auto-fishing, teleportation, auto-selling, and other quality-of-life enhancements for a fishing game.

### Recent Changes (Enhanced Edition - November 2024)

1. **Enhanced Color Palette** - All colors increased by 30-40% in brightness and saturation for more vibrant UI
2. **Improved Transparency** - Main window transparency increased from 0.15 to 0.25 for better glass morphism effect
3. **Fixed Resize Logic** - Window now only resizes to right and bottom (not bi-directional from center)
4. **Removed Dark Overlay** - Background no longer darkens when GUI opens
5. **Premium Visual Effects** - Added UIStroke border glows, UIGradient on buttons/sliders/logo, enhanced hover animations
6. **HTML Documentation** - Complete visual documentation with before/after comparisons served on port 5000

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture

**Documentation Interface**
- Single-page HTML documentation site with embedded CSS
- Glass morphism design with gradient backgrounds and backdrop blur effects
- Responsive layout with mobile-first considerations
- Color scheme: Dark theme with purple/blue gradient accents (primary: RGB 120, 140, 255)

**Roblox GUI (Lua)**
- Client-side GUI rendered in PlayerGui
- Platform detection for mobile vs desktop interactions
- Modular architecture loading external script modules via HTTP
- Event-driven design using Roblox services (TweenService, UserInputService, RunService)

### Backend Architecture

**Web Server**
- Python HTTP server using `http.server` and `socketserver` modules
- Serves static files from root directory on port 5000
- Custom request handler with cache-control headers to prevent caching
- Designed for local/development access via Webview

**Script Loading System**
- Remote module loading pattern via `loadstring(game:HttpGet())`
- All feature modules loaded from GitHub repository (habibihidayat/project-k)
- Modules organized by functionality (FungsiKeaby directory structure)

### Core Features & Modules

**Automation Modules**
- `BlatantAutoFishing.lua` - Automated fishing mechanics
- `NoFishingAnimation.lua` - Animation optimization
- `AutoSell.lua` & `AutoSellTimer.lua` - Automated item selling with timer control
- `AutoBuyWeather.lua` - Automated weather item purchasing

**Utility Modules**
- `TeleportModule.lua` & `TeleportToPlayer.lua` - Player/location teleportation
- `AntiAFK.lua` - Prevents AFK kicks
- `UnlockFPS.lua` - Frame rate optimization
- `Instant.lua` & `Instant2.lua` - Core utility functions

**Design Pattern**
- Utility-first helper function (`new()`) for instance creation with property initialization
- Lazy initialization pattern (waits for game load and PlayerGui availability)
- Color palette system with predefined theme colors for consistent UI

## External Dependencies

**Third-party Services**
- GitHub Raw Content - All Lua modules hosted at `https://raw.githubusercontent.com/habibihidayat/project-k/refs/heads/main/`
- Roblox Services: Players, TweenService, UserInputService, RunService

**Runtime Environment**
- Python 3.x (for web server)
- Roblox game client (for GUI execution)
- Modern web browser (for documentation viewing)

**Module Repository Structure**
```
habibihidayat/project-k/main/FungsiKeaby/
├── Instant.lua
├── Instant2.lua
├── Utama/
│   ├── BlatantAutoFishing.lua
│   └── NoFishingAnimation.lua
├── TeleportModule.lua
├── TeleportSystem/
│   └── TeleportToPlayer.lua
├── ShopFeatures/
│   ├── AutoSell.lua
│   ├── AutoSellTimer.lua
│   └── AutoBuyWeather.lua
└── Misc/
    ├── AntiAFK.lua
    └── UnlockFPS.lua
```