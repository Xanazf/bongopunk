# 🖥️ Bongopunk Qt Integration

Qt application theming for the Bongopunk theme pack, featuring Qt6ct configurations and HyprQT6Engine integration for seamless Qt application styling.

## 🎯 Components

- **qt6ct/** - Qt6 Configuration Tool settings
- **HyprQT6Engine** - Hyprland-specific Qt6 theming engine integration

## 📦 Prerequisites

### Qt6ct Installation

```bash
# Arch Linux
sudo pacman -S qt6ct

# Ubuntu/Debian  
sudo apt install qt6ct

# Fedora
sudo dnf install qt6ct

# openSUSE
sudo zypper install qt6ct
```

### HyprQT6Engine (Optional)

```bash
# Build from source (recommended for latest features)
git clone https://github.com/hyprwm/hyprqt6engine.git
cd hyprqt6engine
cmake -B build
cmake --build build
sudo cmake --install build
```

## 🚀 Installation

### Qt6ct Configuration

```bash
# Copy configurations
mkdir -p ~/.config/qt6ct
cp ~/.config/bongopunk/qt/qt6ct/* ~/.config/qt6ct/

# Set environment variable
echo 'export QT_QPA_PLATFORMTHEME=qt6ct' >> ~/.bashrc
source ~/.bashrc
```

### HyprQT6Engine Setup

```bash
# Set environment variables for Hyprland integration
echo 'export QT_QPA_PLATFORM=hyprqt6' >> ~/.bashrc
echo 'export QT_WAYLAND_DECORATION=hyprqt6' >> ~/.bashrc
source ~/.bashrc
```

## ⚙️ Configuration

### Qt6ct Settings

#### Antibaryon (Dark Mode)
- **Style**: Kvantum (BongopunkAntibaryon)
- **Color scheme**: Darker system colors
- **Icon theme**: Papirus-Dark
- **Fonts**: JetBrains Mono (fixed), Inter (general)

#### Baryon (Light Mode)
- **Style**: Kvantum (BongopunkBaryon)
- **Color scheme**: Light system colors
- **Icon theme**: Papirus
- **Fonts**: JetBrains Mono (fixed), Inter (general)

### Environment Variables

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
# Qt6 theming
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum

# HyprQT6Engine (if installed)
export QT_QPA_PLATFORM=hyprqt6
export QT_WAYLAND_DECORATION=hyprqt6

# Additional Qt settings
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_SCALE_FACTOR=1
```

### Hyprland Integration

Add to your `hyprland.conf`:

```bash
# Qt theming environment variables
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_STYLE_OVERRIDE,kvantum
env = QT_QPA_PLATFORM,hyprqt6
env = QT_WAYLAND_DECORATION,hyprqt6
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = QT_ENABLE_HIGHDPI_SCALING,1
```

## 🎨 Theme Features

### Font Configuration
- **Fixed-width font**: JetBrains Mono 10pt
- **General font**: Inter 10pt
- **Consistent sizing**: Optimized for readability
- **Unicode support**: Full character set coverage

### Interface Settings
- **Single-click activation**: Modern interaction model
- **Icon integration**: Icons in menus and dialogs
- **Keyboard shortcuts**: Visible shortcut hints
- **Smooth scrolling**: 3-line wheel scroll
- **Context menus**: Rich context menu support

### Visual Enhancements
- **Consistent styling**: Matches Kvantum themes
- **Proper scaling**: HiDPI display support
- **Native integration**: Wayland-native rendering
- **Performance optimization**: Hardware acceleration

## 🎯 Supported Applications

### Development Tools
- **Qt Creator** - Full IDE support
- **Qt Designer** - UI design tool
- **Qt Assistant** - Documentation viewer
- **CMake GUI** - Build configuration
- **Wireshark** - Network analyzer

### Media Applications
- **VLC** - Media player
- **SMPlayer** - Video player
- **Kdenlive** - Video editor
- **Audacity** - Audio editor
- **OBS Studio** - Streaming software

### System Tools
- **KDE Applications** - Full KDE suite
- **Dolphin** - File manager
- **Konsole** - Terminal emulator
- **Kate** - Text editor
- **Okular** - Document viewer

### Communication
- **Telegram Desktop** - Messaging
- **qBittorrent** - BitTorrent client
- **Mumble** - Voice chat
- **Element** - Matrix client

## 🔧 Customization

### Modifying Qt6ct Settings

Edit configuration files directly:

```bash
# Edit antibaryon config
nano ~/.config/qt6ct/antibaryon.conf

# Edit baryon config  
nano ~/.config/qt6ct/baryon.conf
```

### Custom Color Schemes

Create custom color schemes:

```bash
# Copy existing scheme
cp /usr/share/qt6ct/colors/darker.conf ~/.config/qt6ct/colors/bongopunk-dark.conf

# Edit colors
nano ~/.config/qt6ct/colors/bongopunk-dark.conf
```

### Font Customization

Modify font settings in qt6ct configurations:

```ini
[Fonts]
fixed="YourFont,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
general="YourFont,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
```

## 🔗 Integration Components

### HyprQT6Engine Features

When using HyprQT6Engine:
- **Native Wayland support**: Direct Wayland integration
- **Window decorations**: Consistent with Hyprland themes
- **Performance optimization**: Reduced overhead
- **Gesture support**: Touch and trackpad gestures
- **Multi-monitor**: Proper multi-display handling

### Kvantum Integration

Qt6ct works seamlessly with Kvantum:
- **Style engine**: Kvantum provides the visual style
- **Configuration**: Qt6ct manages application settings
- **Consistency**: Unified theming across all Qt apps
- **Flexibility**: Easy theme switching

### Icon Theme Integration

Recommended icon themes:
- **Dark mode**: Papirus-Dark, Tela-dark, Numix-Circle-Dark
- **Light mode**: Papirus, Tela, Numix-Circle-Light
- **Consistency**: Match with GTK icon themes

## 🎮 Theme Switching

### Manual Switching

```bash
# Switch to dark theme
cp ~/.config/bongopunk/qt/qt6ct/antibaryon.conf ~/.config/qt6ct/qt6ct.conf

# Switch to light theme
cp ~/.config/bongopunk/qt/qt6ct/baryon.conf ~/.config/qt6ct/qt6ct.conf

# Restart Qt applications
```

### Automated Switching Script

```bash
#!/bin/bash
# ~/.config/bongopunk/extras/scripts/qt-switch.sh

QT6CT_DIR="$HOME/.config/qt6ct"
BONGOPUNK_QT="$HOME/.config/bongopunk/qt/qt6ct"

case "$1" in
    "dark"|"antibaryon")
        cp "$BONGOPUNK_QT/antibaryon.conf" "$QT6CT_DIR/qt6ct.conf"
        echo "Switched to Bongopunk Antibaryon (Dark) Qt theme"
        ;;
    "light"|"baryon")
        cp "$BONGOPUNK_QT/baryon.conf" "$QT6CT_DIR/qt6ct.conf"
        echo "Switched to Bongopunk Baryon (Light) Qt theme"
        ;;
    *)
        echo "Usage: $0 [dark|light|antibaryon|baryon]"
        exit 1
        ;;
esac

echo "Restart Qt applications to apply changes"
```

## 🐛 Troubleshooting

### Qt6ct Not Working

1. **Check environment variable**:
```bash
echo $QT_QPA_PLATFORMTHEME
# Should output: qt6ct
```

2. **Verify installation**:
```bash
which qt6ct
qt6ct --version
```

3. **Test with a Qt application**:
```bash
qt6ct-qtconfig
```

### HyprQT6Engine Issues

1. **Check if properly installed**:
```bash
ls /usr/lib/qt6/plugins/platforms/ | grep hypr
```

2. **Verify environment variables**:
```bash
echo $QT_QPA_PLATFORM
echo $QT_WAYLAND_DECORATION
```

3. **Fallback to standard Wayland**:
```bash
export QT_QPA_PLATFORM=wayland
```

### Font Rendering Issues

1. **Install required fonts**:
```bash
# Arch Linux
sudo pacman -S ttf-jetbrains-mono inter-font

# Ubuntu/Debian
sudo apt install fonts-jetbrains-mono fonts-inter
```

2. **Clear font cache**:
```bash
fc-cache -fv
```

### Theme Not Applied

1. **Restart Qt applications** after configuration changes
2. **Check Kvantum theme** is properly installed
3. **Verify qt6ct configuration** file exists
4. **Test with qt6ct GUI**: `qt6ct`

## 📝 Notes

- Qt6ct only affects Qt6 applications (Qt5 uses qt5ct)
- Some applications may override system themes
- HyprQT6Engine is experimental and may have compatibility issues
- Font rendering depends on system fontconfig settings
- Icon themes should be installed system-wide for best results

## 🤝 Contributing

To improve the Qt integration:
1. Test configurations with various Qt applications
2. Optimize font settings for different screen densities
3. Add support for more Qt versions
4. Improve HyprQT6Engine integration
5. Submit pull requests with improvements

## 📄 License

MIT License - Part of the Bongopunk theme pack by Xanazf.