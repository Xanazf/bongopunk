# Bongopunk for Rofi

Synthwave-inspired themes for Rofi application launcher.

## Installation

### Manual Installation

1. Copy the theme files to your Rofi configuration directory:
   ```bash
   mkdir -p ~/.config/rofi
   cp antibaryon.rasi ~/.config/rofi/bongopunk-antibaryon.rasi
   cp baryon.rasi ~/.config/rofi/bongopunk-baryon.rasi
   ```

2. Use the theme with Rofi:
   ```bash
   # Dark mode
   rofi -show drun -theme ~/.config/rofi/bongopunk-antibaryon.rasi
   
   # Light mode
   rofi -show drun -theme ~/.config/rofi/bongopunk-baryon.rasi
   ```

### Set as Default Theme

Add to your Rofi configuration file (`~/.config/rofi/config.rasi`):

```css
configuration {
    theme: "~/.config/rofi/bongopunk-antibaryon.rasi";
}
```

## Features

- **Synthwave aesthetics** with neon colors
- **Rounded corners** and modern styling
- **Icon support** with proper spacing
- **Responsive design** that adapts to content
- **Consistent colors** with other Bongopunk themes

## Customization

You can customize the theme by editing the `.rasi` files:

- **Window size**: Modify the `width` property in the `window` section
- **Colors**: Adjust color variables at the top of the file
- **Font**: Change the `font` property in the global section
- **Border radius**: Modify `border-radius` values for different roundness

## Usage Examples

```bash
# Application launcher
rofi -show drun -theme bongopunk-antibaryon

# Window switcher
rofi -show window -theme bongopunk-antibaryon

# Run command
rofi -show run -theme bongopunk-antibaryon

# SSH connections
rofi -show ssh -theme bongopunk-antibaryon
```

## Color Palette

### Antibaryon (Dark Mode)
- Background: `#090318`
- Foreground: `#8BA7A7`
- Accent: `#61E2FF` (Cyan)
- Selection: `#2D4A5C`

### Baryon (Light Mode)
- Background: `#FAFAFA`
- Foreground: `#2D2D2D`
- Accent: `#0891B2` (Dark Cyan)
- Selection: `#E5E7EB`