# Bongopunk for Yazi

Synthwave-inspired file manager themes with dual modes.

## Installation

### Using ya pkg (Recommended)

```bash
# For Antibaryon (dark mode)
ya pack -a Xanazf/bongopunk-antibaryon.yazi

# For Baryon (light mode)
ya pack -a Xanazf/bongopunk-baryon.yazi
```

### Manual Installation

1. Clone the flavor to your Yazi flavors directory:
   ```bash
   # For both modes
   git clone https://github.com/Xanazf/bongopunk.git ~/.config/bongopunk
   cp -r ~/.config/bongopunk/yazi/antibaryon.yazi ~/.config/yazi/flavors/
   cp -r ~/.config/bongopunk/yazi/baryon.yazi ~/.config/yazi/flavors/
   ```

2. Add the flavor to your `theme.toml`:
   ```toml
   [flavor]
   use = "antibaryon"  # for dark mode
   # use = "baryon"    # for light mode
   ```

## Features

- **Dual Modes**: Baryon (light) and Antibaryon (dark)
- **File Type Colors**: Intuitive color coding for different file types
- **Custom Icons**: Development-focused icon set
- **High Contrast**: Excellent readability in both modes
- **Synthwave Aesthetic**: Neon colors and retro-futuristic design

## File Type Colors

### Antibaryon (Dark Mode)
- 📁 Directories: Electric cyan (`#61E2FF`)
- 🖼️ Images: Electric yellow (`#FFCC00`)
- 🎥 Videos/Audio: Hot pink (`#FC199A`)
- 📦 Archives: Bright orange (`#FF8B39`)
- 📄 Documents: Bright red (`#FE4450`)
- 💻 Code files: Various neon colors based on language

### Baryon (Light Mode)
- 📁 Directories: Dark cyan (`#0891B2`)
- 🖼️ Images: Dark yellow (`#D97706`)
- 🎥 Videos/Audio: Dark pink (`#BE185D`)
- 📦 Archives: Dark orange (`#EA580C`)
- 📄 Documents: Dark red (`#DC2626`)
- 💻 Code files: Various muted colors based on language

## Customization

You can customize the themes by editing the `flavor.toml` files in each theme directory.

## Screenshots

*Screenshots coming soon...*