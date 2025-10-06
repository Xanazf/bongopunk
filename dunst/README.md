# Bongopunk for Dunst

Synthwave-inspired notification themes for Dunst notification daemon.

## Installation

### Manual Installation

1. Backup your current Dunst configuration:
   ```bash
   cp ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.backup
   ```

2. Copy the theme configuration:
   ```bash
   mkdir -p ~/.config/dunst
   # For dark mode
   cp antibaryon.conf ~/.config/dunst/dunstrc
   # For light mode
   cp baryon.conf ~/.config/dunst/dunstrc
   ```

3. Restart Dunst:
   ```bash
   killall dunst
   # Dunst will restart automatically on next notification
   ```

### Test the Theme

Send a test notification:
```bash
notify-send "Bongopunk Theme" "Your notifications now have synthwave style!" -u normal
notify-send "Critical Alert" "This is a critical notification" -u critical
notify-send "Low Priority" "This is a low priority notification" -u low
```

## Features

- **Synthwave aesthetics** with neon accent colors
- **Rounded corners** for modern appearance
- **Urgency-based styling** with different colors for low/normal/critical
- **Application-specific rules** for popular apps (Spotify, Discord, Firefox)
- **Progress bar support** with themed colors
- **Transparency support** for compositor integration

## Configuration

### Urgency Levels

#### Antibaryon (Dark Mode)
- **Low**: Gray frame (`#4A6B7C`)
- **Normal**: Cyan frame (`#61E2FF`)
- **Critical**: Red frame and text (`#FE4450`)

#### Baryon (Light Mode)
- **Low**: Light gray frame (`#D1D5DB`)
- **Normal**: Dark cyan frame (`#0891B2`)
- **Critical**: Red frame and text (`#DC2626`)

### Application Rules

The theme includes special styling for:
- **Spotify**: Green accent
- **Discord**: Purple accent
- **Firefox**: Orange accent

### Customization

Edit the configuration file to customize:

```ini
# Change notification position
origin = top-right
offset = 10x50

# Adjust transparency
transparency = 10

# Modify timeout
timeout = 10

# Change font
font = Hack Nerd Font 11
```

## Advanced Usage

### Multiple Configurations

You can maintain both themes and switch between them:

```bash
# Switch to dark mode
cp ~/.config/dunst/bongopunk-antibaryon.conf ~/.config/dunst/dunstrc
killall dunst

# Switch to light mode
cp ~/.config/dunst/bongopunk-baryon.conf ~/.config/dunst/dunstrc
killall dunst
```

### Integration with Theme Switcher

Add to your theme switching script:
```bash
# In your theme switcher
if [[ "$mode" == "dark" ]]; then
    cp ~/.config/dunst/bongopunk-antibaryon.conf ~/.config/dunst/dunstrc
else
    cp ~/.config/dunst/bongopunk-baryon.conf ~/.config/dunst/dunstrc
fi
killall dunst
```

## Troubleshooting

### Notifications Not Appearing
```bash
# Check if dunst is running
pgrep dunst

# Restart dunst manually
killall dunst
dunst &
```

### Theme Not Applied
```bash
# Verify configuration location
ls -la ~/.config/dunst/dunstrc

# Check for syntax errors
dunst -print
```

### Icons Not Showing
Ensure you have an icon theme installed:
```bash
# Install a popular icon theme
sudo pacman -S papirus-icon-theme  # Arch
sudo apt install papirus-icon-theme  # Ubuntu/Debian
```

## Color Palette

### Antibaryon (Dark Mode)
- Background: `#090318`
- Foreground: `#8BA7A7`
- Frame: `#4A6B7C` (normal), `#61E2FF` (info), `#FE4450` (critical)

### Baryon (Light Mode)
- Background: `#FAFAFA`
- Foreground: `#2D2D2D`
- Frame: `#D1D5DB` (normal), `#0891B2` (info), `#DC2626` (critical)