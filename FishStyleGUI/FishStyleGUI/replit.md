# Seraphin Premium GUI - Fish It Roblox Script

## Overview
Roblox Lua script untuk game Fish It dengan GUI style Seraphin Premium. Script ini adalah rebuild dari LynxGUI dengan tampilan dark transparent yang modern.

## Project Structure
```
/
├── SeraphinGUI.lua          # Main GUI script untuk Roblox
├── attached_assets/         # Asset gambar dan referensi
│   ├── image_1764143112797.png    # Referensi style Seraphin Premium
│   └── Pasted--LynxGUI...txt      # Script original LynxGUI
└── replit.md                # Dokumentasi project
```

## Features

### GUI Style
- Dark transparent theme (Seraphin Premium style)
- Clean minimal design
- Smooth animations tanpa animasi berputar saat close
- Responsive untuk mobile dan desktop

### Sidebar Navigation
- Info - Informasi script
- Exclusive - Premium features (Instant Catch, Instant 2 Speed, dll)
- Main - Delay settings dengan input manual
- Menu - Miscellaneous settings
- Trading - Shop features (Auto Sell, Auto Buy Weather)
- Quest - Teleport system

### Input System
- TextBox input untuk delay (format desimal: 0.066, 1.2, 2.1111)
- Toggle switches untuk fitur on/off
- Button untuk aksi teleport

### Logo Behavior
- Logo hanya tampil saat window di-minimize
- Logo tidak ditampilkan di GUI utama saat window terbuka

## Modules Loaded
Script memuat external modules dari GitHub:
- Instant.lua, Instant2.lua, Instant2Xspeed.lua
- BlatantV2.lua
- NoFishingAnimation.lua
- TeleportModule.lua, TeleportToPlayer.lua
- AutoSell.lua, AutoSellTimer.lua
- AntiAFK.lua, UnlockFPS.lua
- AutoBuyWeather.lua

## Usage
Copy isi file `SeraphinGUI.lua` dan execute di Roblox executor seperti Synapse X, KRNL, atau executor lainnya.

## Color Palette
```lua
bg = Color3.fromRGB(20, 20, 25)           -- Dark background
sidebar = Color3.fromRGB(25, 25, 30)      -- Sidebar background
accent = Color3.fromRGB(70, 130, 180)     -- Blue accent
text = Color3.fromRGB(255, 255, 255)      -- White text
textDim = Color3.fromRGB(180, 180, 180)   -- Dimmed text
toggleOn = Color3.fromRGB(255, 255, 255)  -- Toggle on state
toggleOff = Color3.fromRGB(80, 80, 85)    -- Toggle off state
```

## Recent Changes
- November 26, 2025: Rebuild GUI dengan Seraphin Premium style
  - Ganti semua slider dengan TextBox input manual
  - Tambah sidebar navigation sesuai referensi gambar
  - Logo hanya tampil saat minimize
  - Hapus animasi berputar saat close window
  - Dark transparent theme
