# 🎨 Bongopunk Kvantum Integration

Kvantum theme engine integration for the Bongopunk theme pack, providing consistent Qt application styling across both light and dark modes.

## 🎯 Available Themes

- **BongopunkAntibaryon** - Dark synthwave theme with neon accents
- **BongopunkBaryon** - Light professional theme with muted colors

## 📦 Prerequisites

Install Kvantum theme engine:

```bash
# Arch Linux
sudo pacman -S kvantum

# Ubuntu/Debian
sudo apt install qt5-style-kvantum qt6-style-kvantum

# Fedora
sudo dnf install kvantum

# From source
git clone https://github.com/tsujan/Kvantum.git
cd Kvantum && make && sudo make install
```

## 🚀 Installation

### Method 1: Automatic Installation

```bash
# Copy themes to Kvantum directory
mkdir -p ~/.config/Kvantum
cp -r ~/.config/bongopunk/kvantum/* ~/.config/Kvantum/

# Set theme via Kvantum Manager
kvantummanager
```

### Method 2: Manual Installation

```bash
# Create Kvantum config directory
mkdir -p ~/.config/Kvantum

# Copy individual themes
cp -r ~/.config/bongopunk/kvantum/BongopunkAntibaryon ~/.config/Kvantum/
cp -r ~/.config/bongopunk/kvantum/BongopunkBaryon ~/.config/Kvantum/
```

### Method 3: System-wide Installation

```bash
# Install for all users (requires root)
sudo cp -r ~/.config/bongopunk/kvantum/* /usr/share/Kvantum/
```

## ⚙️ Configuration

### Using Kvantum Manager (GUI)

1. Open Kvantum Manager: `kvantummanager`
2. Go to **Change/Delete Theme** tab
3. Select **BongopunkAntibaryon** or **BongopunkBaryon**
4. Click **Use this theme**
5. Restart Qt applications

### Using Command Line

```bash
# Set dark theme
echo "theme=BongopunkAntibaryon" > ~/.config/Kvantum/kvantum.kvconfig

# Set light theme  
echo "theme=BongopunkBaryon" > ~/.config/Kvantum/kvantum.kvconfig
```

### Environment Variables

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
# Enable Kvantum for Qt applications
export QT_STYLE_OVERRIDE=kvantum

# For Qt6 applications
export QT_QPA_PLATFORMTHEME=qt6ct
```

## 🎨 Theme Features

### BongopunkAntibaryon (Dark Mode)

#### Color Palette
- **Background**: Dark navy-blue (`#1E2A3A`)
- **Foreground**: Light blue-gray (`#8BA7A7`)
- **Accent**: Electric cyan (`#61E2FF`)
- **Selection**: Dark blue-gray (`#2D4A5C`)
- **Border**: Muted blue (`#4A6B7C`)

#### Visual Features
- **Enhanced Text Glow**: Comprehensive cyan glow effects on all text elements
- **Advanced Transparency**: Multi-level opacity settings for windows, menus, and popups
- **Blur effects**: Gaussian blur for depth with Wayland/Hyprland optimization
- **Neon accents**: Bright cyan highlights with enhanced glow filters
- **Gradient backgrounds**: Subtle gradients for modern depth perception
- **Rounded corners**: 4px radius for modern look
- **Smooth animations**: State transitions enabled with glow effects

### BongopunkBaryon (Light Mode)

#### Color Palette
- **Background**: Light gray (`#FAFAFA`)
- **Foreground**: Dark gray (`#2D2D2D`)
- **Accent**: Dark cyan (`#0891B2`)
- **Selection**: Light blue-gray (`#F3F4F6`)
- **Border**: Light gray (`#D1D5DB`)

#### Visual Features
- **Subtle Text Glow**: Professional cyan glow effects on all text elements
- **Optional Transparency**: Configurable transparency with lighter opacity settings
- **Professional look**: Enhanced gradients and subtle glow effects
- **Muted accents**: Dark cyan highlights with refined glow filters
- **Gradient backgrounds**: Clean gradients for professional appearance
- **Consistent spacing**: Optimized padding and margins
- **Smooth animations**: Professional transitions with subtle glow effects

## 🎯 Supported Applications

Kvantum themes work with all Qt-based applications:

### Development Tools
- **Qt Creator** - IDE with full theme support
- **KDevelop** - Integrated development environment
- **Qt Designer** - UI design tool

### Media Applications
- **VLC Media Player** - Video player
- **SMPlayer** - Media player frontend
- **Kdenlive** - Video editor
- **Audacity** - Audio editor

### System Applications
- **Dolphin** - KDE file manager
- **Konsole** - KDE terminal
- **Kate** - Text editor
- **Okular** - Document viewer

### Communication
- **Telegram Desktop** - Messaging app
- **qBittorrent** - BitTorrent client
- **Mumble** - Voice chat

## 🔧 Customization

### Text Glow Effects

Both themes now include comprehensive text glow effects. To customize:

```ini
# In any text element section (e.g., [PanelButtonCommand])
text.shadow=1                    # Enable glow (1) or disable (0)
text.shadow.color=#61E2FF        # Glow color (cyan for dark theme)
text.shadow.alpha=128            # Glow opacity (0-255)
text.shadow.xoffset=0            # Horizontal offset
text.shadow.yoffset=0            # Vertical offset  
text.shadow.depth=2              # Glow intensity
```

### Transparency Settings

Optional transparency is now fully configurable:

```ini
[%General]
# Main transparency controls
translucent_windows=true         # Enable window transparency
blurring=true                    # Enable blur effects
popup_blurring=true              # Enable popup blur

[Hacks]
# Fine-grained transparency controls
window_opacity=95                # Window opacity (0-100)
menu_opacity=90                  # Menu opacity
tooltip_opacity=85               # Tooltip opacity
popup_opacity=90                 # Popup opacity

# Disable transparency by setting to false:
# translucent_windows=false
# blurring=false
# popup_blurring=false
```

### Modifying Colors

Edit the `.kvconfig` files to change colors:

```ini
[%General]
# Change author info
author=YourName
comment=Your custom Bongopunk variant

# Modify visual settings
translucent_windows=true
blurring=true
animate_states=true
```

### Creating Custom Variants

1. Copy an existing theme directory:
```bash
cp -r ~/.config/Kvantum/BongopunkAntibaryon ~/.config/Kvantum/BongopunkCustom
```

2. Rename files:
```bash
cd ~/.config/Kvantum/BongopunkCustom
mv BongopunkAntibaryon.kvconfig BongopunkCustom.kvconfig
mv BongopunkAntibaryon.svg BongopunkCustom.svg
```

3. Edit the SVG file to change visual elements
4. Modify the kvconfig file for behavior changes

### Advanced SVG Editing

The SVG files contain theme elements:
- **Buttons**: Normal, pressed, hover states
- **Scrollbars**: Slider and groove elements
- **Progress bars**: Chunk and groove
- **Tabs**: Selected and normal states
- **Menus**: Background and selection

Use Inkscape or any SVG editor to modify these elements.

## 🔗 Integration with Other Components

### Qt6ct Integration
Use with Qt6ct for complete Qt6 theming:

```bash
# Install qt6ct
sudo pacman -S qt6ct  # Arch
sudo apt install qt6ct  # Ubuntu

# Set environment variable
export QT_QPA_PLATFORMTHEME=qt6ct
```

### Hyprland Integration
The themes work seamlessly with Hyprland:

```bash
# In hyprland.conf
env = QT_STYLE_OVERRIDE,kvantum
env = QT_QPA_PLATFORMTHEME,qt6ct
```

### GTK Integration
For mixed GTK/Qt environments:

```bash
# Use consistent icon themes
export GTK_THEME=Adwaita-dark  # For dark mode
export GTK_THEME=Adwaita       # For light mode
```

## 🎮 Theme Switching

### Manual Switching
```bash
# Switch to dark theme
echo "theme=BongopunkAntibaryon" > ~/.config/Kvantum/kvantum.kvconfig

# Switch to light theme
echo "theme=BongopunkBaryon" > ~/.config/Kvantum/kvantum.kvconfig

# Restart Qt applications to apply
```

### Automated Switching
Create a script for easy theme switching:

```bash
#!/bin/bash
# ~/.config/bongopunk/extras/scripts/kvantum-switch.sh

if [ "$1" = "dark" ]; then
    echo "theme=BongopunkAntibaryon" > ~/.config/Kvantum/kvantum.kvconfig
    echo "Switched to Bongopunk Antibaryon (Dark)"
elif [ "$1" = "light" ]; then
    echo "theme=BongopunkBaryon" > ~/.config/Kvantum/kvantum.kvconfig
    echo "Switched to Bongopunk Baryon (Light)"
else
    echo "Usage: $0 [dark|light]"
fi
```

## 🐛 Troubleshooting

### Theme Not Applied
1. Check if Kvantum is properly installed
2. Verify environment variables are set
3. Restart Qt applications
4. Check Kvantum Manager settings

### Text Glow Issues
```bash
# Disable text glow if causing rendering problems
# Edit .kvconfig file, set in all text sections:
text.shadow=0

# Or reduce glow intensity:
text.shadow.alpha=32
text.shadow.depth=1
```

### Transparency Issues
```bash
# Disable transparency if causing issues
# Edit .kvconfig file:
translucent_windows=false
blurring=false
popup_blurring=false

# Or reduce opacity levels:
window_opacity=100
menu_opacity=100
tooltip_opacity=100
popup_opacity=100
```

### Performance Problems
```bash
# Disable animations and effects for better performance
animate_states=false
text.shadow=0
blurring=false
```

### Mixed Theme Issues
```bash
# Ensure consistent theme selection
kvantummanager --set BongopunkAntibaryon
```

## 📝 Notes

- Themes are optimized for modern Qt versions (5.15+, 6.0+)
- Some older Qt applications may not support all features
- Transparency requires a compositor (like Hyprland)
- Icon themes should be set separately via system settings

## 🤝 Contributing

To improve the Kvantum integration:
1. Test themes with various Qt applications
2. Optimize SVG elements for better performance
3. Add support for more UI elements
4. Create additional color variants
5. Submit pull requests with improvements

## 📄 License

MIT License - Part of the Bongopunk theme pack by Xanazf.
