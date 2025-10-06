# 🌊 Bongopunk Transparency Guide

This guide explains how to use transparency with Bongopunk themes across different applications.

## 🎯 Available Transparency Options

### 1. **Semi-Transparent (Default)**
- Slight transparency with blur effects
- Maintains readability while showing background
- Good for most use cases

### 2. **Fully Transparent**
- Complete background transparency
- Relies on compositor for effects
- Best for advanced setups with window managers

## 📱 Application-Specific Setup

### Alacritty

#### Semi-Transparent (Default)
```toml
# Use the standard themes
import = ["~/.config/alacritty/bongopunk-antibaryon.toml"]
# or
import = ["~/.config/alacritty/bongopunk-baryon.toml"]

# Adjust opacity in your main config
[window]
opacity = 0.95  # 0.0 = fully transparent, 1.0 = opaque
```

#### Fully Transparent
```toml
# Use the transparent variants
import = ["~/.config/alacritty/bongopunk-antibaryon-transparent.toml"]
# or
import = ["~/.config/alacritty/bongopunk-baryon-transparent.toml"]
```

### Kitty

#### Semi-Transparent
```bash
# Add to your kitty.conf
include bongopunk-antibaryon.conf
# Uncomment these lines in the theme file:
background_opacity 0.95
dynamic_background_opacity yes
```

#### Fully Transparent
```bash
# Use the transparent variants
include bongopunk-antibaryon-transparent.conf
# or
include bongopunk-baryon-transparent.conf
```

### Neovim

#### Semi-Transparent (Default)
```lua
-- Standard setup
require('bongopunk-antibaryon').setup()
-- or
require('bongopunk-baryon').setup()
```

#### Fully Transparent
```lua
-- Enable transparency
require('bongopunk-antibaryon').setup({ transparent = true })
-- or
require('bongopunk-baryon').setup({ transparent = true })
```

### Tmux
Tmux transparency is handled by the terminal emulator. Use transparent terminal themes above.

### Yazi
Yazi transparency is handled by the terminal emulator. Use transparent terminal themes above.

### Fish
Fish transparency is handled by the terminal emulator. Use transparent terminal themes above.

## 🖥️ Compositor Setup

For best transparency effects, ensure your compositor supports:

### Wayland Compositors
- **Hyprland**: Built-in transparency support
- **Sway**: Use with transparency rules
- **KDE Wayland**: Built-in effects

### X11 Compositors
- **Picom**: Excellent transparency and blur
- **Compton**: Basic transparency support

#### Example Picom Config
```ini
# ~/.config/picom/picom.conf
backend = "glx";
opacity-rule = [
  "95:class_g = 'Alacritty'",
  "95:class_g = 'kitty'",
];

blur: {
  method = "dual_kawase";
  strength = 3;
}
```

#### Example Hyprland Config
```ini
# ~/.config/hypr/hyprland.conf
windowrulev2 = opacity 0.95 0.95,class:^(Alacritty)$
windowrulev2 = opacity 0.95 0.95,class:^(kitty)$

decoration {
    blur {
        enabled = true
        size = 3
        passes = 1
    }
}
```

## 🎨 Transparency Levels

### Recommended Opacity Values

| Use Case | Opacity | Description |
|----------|---------|-------------|
| **Coding** | 0.95-1.0 | High readability |
| **Terminal Work** | 0.90-0.95 | Good balance |
| **Aesthetic** | 0.80-0.90 | More transparent |
| **Extreme** | 0.60-0.80 | Very transparent |

### Color Considerations

#### Dark Mode (Antibaryon)
- Works well with darker wallpapers
- Neon accents remain visible through transparency
- Navy background blends nicely with most backgrounds

#### Light Mode (Baryon)
- Best with lighter wallpapers
- Darker text maintains readability
- Clean aesthetic with subtle transparency

## 🔧 Troubleshooting

### Common Issues

1. **Text Hard to Read**
   - Increase opacity value
   - Use blur effects
   - Choose appropriate wallpaper

2. **No Transparency Effect**
   - Check compositor is running
   - Verify transparency support
   - Check application-specific settings

3. **Performance Issues**
   - Reduce blur strength
   - Lower transparency level
   - Disable unnecessary effects

### Testing Transparency

```bash
# Test Alacritty transparency
alacritty --config-file ~/.config/alacritty/bongopunk-antibaryon-transparent.toml

# Test Kitty transparency
kitty --config ~/.config/kitty/bongopunk-antibaryon-transparent.conf
```

## 🎵 Tips for Best Experience

1. **Choose Appropriate Wallpapers**
   - Subtle patterns work best
   - Avoid high contrast backgrounds
   - Consider color harmony

2. **Adjust Based on Lighting**
   - Higher opacity in bright environments
   - Lower opacity in dim lighting

3. **Application-Specific Tuning**
   - Code editors: Higher opacity
   - Terminals: Medium opacity
   - Media players: Lower opacity

4. **Dynamic Adjustment**
   - Use keybindings to toggle transparency
   - Adjust based on current task
   - Consider time-based automation

## 🚀 Advanced Setups

### Dynamic Transparency with Hyprland
```ini
# Toggle transparency with Super+T
bind = SUPER, T, exec, hyprctl keyword decoration:blur:enabled toggle
```

### Kitty Dynamic Transparency
```bash
# Add to kitty.conf
map ctrl+shift+a>m set_background_opacity +0.1
map ctrl+shift+a>l set_background_opacity -0.1
map ctrl+shift+a>1 set_background_opacity 1
map ctrl+shift+a>d set_background_opacity default
```

### Neovim Transparency Toggle
```lua
-- Add to your Neovim config
vim.keymap.set('n', '<leader>tt', function()
  if vim.g.bongopunk_transparent then
    vim.g.bongopunk_transparent = false
    require('bongopunk-antibaryon').setup({ transparent = false })
  else
    vim.g.bongopunk_transparent = true
    require('bongopunk-antibaryon').setup({ transparent = true })
  end
end, { desc = 'Toggle transparency' })
```

---

**Note**: Transparency effects depend on your system's compositor and hardware capabilities. Some features may not be available on all systems.