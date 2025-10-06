# 🎵 Bongopunk Theme Pack - Project Overview

A comprehensive theme pack inspired by Fluoromachine and BongoCat, featuring synthwave aesthetics with dual modes for the Linux/Open Source ecosystem.

## 🌈 Theme Philosophy

**Bongopunk** combines the playful energy of BongoCat with the neon-soaked aesthetics of synthwave, creating a cohesive visual experience across your entire development environment.

### Dual Mode System

- **Baryon (Light Mode)**: Clean, professional light theme with darker, muted accent colors
- **Antibaryon (Dark Mode)**: Synthwave dark theme with bright neon accents

This physics-inspired naming reflects the complementary nature of the two modes - like matter and antimatter, they're opposites that complete each other.

## 📁 Project Structure

```
bongopunk/
├── README.md                 # Main project documentation
├── OVERVIEW.md              # This file
├── colors/                  # Shared color definitions
│   ├── baryon.toml         # Light mode color palette
│   └── antibaryon.toml     # Dark mode color palette
├── neovim/                  # Neovim colorschemes
│   ├── README.md
│   ├── baryon.lua          # Light mode theme
│   └── antibaryon.lua      # Dark mode theme
├── yazi/                    # Yazi file manager themes
│   ├── README.md
│   ├── baryon.yazi/        # Light mode flavor
│   └── antibaryon.yazi/    # Dark mode flavor
├── kitty/                   # Kitty terminal themes
│   ├── baryon.conf         # Light mode config
│   └── antibaryon.conf     # Dark mode config
├── fish/                    # Fish shell themes
│   ├── baryon.fish         # Light mode theme
│   └── antibaryon.fish     # Dark mode theme
├── tmux/                    # Tmux themes
│   ├── baryon.tmux         # Light mode config
│   └── antibaryon.tmux     # Dark mode config
├── alacritty/              # Alacritty terminal themes
│   ├── baryon.toml         # Light mode config
│   └── antibaryon.toml     # Dark mode config
├── qt/                      # QT application themes
├── gtk/                     # GTK application themes
├── rofi/                    # Rofi launcher themes
├── dunst/                   # Dunst notification themes
└── extras/                  # Additional resources
    └── scripts/
        └── install.sh       # Automated installation script
```

## 🎨 Color Philosophy

### Antibaryon (Dark Mode) - The Original Vision
Based on the existing Yazi theme, this represents the core Bongopunk aesthetic:
- **Background**: Deep purple-gray (`#262335`) - mysterious and professional
- **Foreground**: Light blue-gray (`#8BA7A7`) - easy on the eyes
- **Accents**: Bright neon colors that pop against the dark background
  - Electric cyan (`#61E2FF`) - primary accent
  - Neon green (`#72F1B8`) - success/strings
  - Hot pink (`#FC199A`) - keywords/statements
  - Electric purple (`#AF6DF9`) - types/constants
  - Bright orange (`#FF8B39`) - numbers/archives
  - Electric yellow (`#FFCC00`) - warnings/images
  - Bright red (`#FE4450`) - errors/documents

### Baryon (Light Mode) - The Complement
A professional light theme that maintains the Bongopunk spirit:
- **Background**: Clean light gray (`#FAFAFA`) - professional and clean
- **Foreground**: Dark gray (`#2D2D2D`) - high contrast for readability
- **Accents**: Darker, muted versions of the neon colors
  - Dark cyan (`#0891B2`) - primary accent
  - Dark green (`#059669`) - success/strings
  - Dark pink (`#BE185D`) - keywords/statements
  - Dark purple (`#7C3AED`) - types/constants
  - Dark orange (`#EA580C`) - numbers/archives
  - Dark yellow (`#D97706`) - warnings/images
  - Dark red (`#DC2626`) - errors/documents

## 🎯 Supported Applications

### Core Applications (Implemented)
- **Neovim**: Full colorscheme with syntax highlighting
- **Yazi**: File manager with custom icons and colors
- **Kitty**: Terminal emulator with full color support
- **Fish**: Shell with custom prompt and syntax highlighting
- **Tmux**: Terminal multiplexer with status bar theming
- **Alacritty**: GPU-accelerated terminal with color schemes

### Planned Applications
- **QT Applications**: System-wide QT styling
- **GTK Applications**: GNOME/GTK theme support
- **Rofi**: Application launcher themes
- **Dunst**: Notification daemon styling
- **Polybar/Waybar**: Status bar themes
- **i3/Sway**: Window manager themes
- **VS Code**: Editor theme port

## 🚀 Installation Methods

### 1. Automated Installation (Recommended)
```bash
git clone https://github.com/Xanazf/bongopunk.git ~/.config/bongopunk
cd ~/.config/bongopunk
./extras/scripts/install.sh
```

### 2. Manual Installation
Each application directory contains specific installation instructions.

### 3. Package Manager Integration
- Yazi: `ya pack -a Xanazf/bongopunk-antibaryon.yazi`
- Neovim: Plugin manager support (lazy.nvim, packer, etc.)

## 🔧 Customization

### Color Modifications
The shared color definitions in `colors/` make it easy to modify the entire theme pack:
1. Edit `colors/baryon.toml` or `colors/antibaryon.toml`
2. Regenerate application themes using the color values
3. Maintain consistency across all applications

### Application-Specific Tweaks
Each application theme can be customized independently while maintaining the overall aesthetic.

## 🎵 Design Principles

1. **Consistency**: Same color palette across all applications
2. **Accessibility**: High contrast ratios for readability
3. **Aesthetics**: Synthwave-inspired neon colors with retro-futuristic feel
4. **Functionality**: Colors have semantic meaning (red for errors, green for success, etc.)
5. **Flexibility**: Easy switching between light and dark modes

## 🤝 Contributing

### Adding New Applications
1. Create a new directory for the application
2. Implement both Baryon and Antibaryon themes
3. Use colors from the shared palette
4. Add installation instructions
5. Update the main README

### Improving Existing Themes
1. Test themes with various content types
2. Ensure accessibility standards are met
3. Maintain consistency with the overall aesthetic
4. Document any breaking changes

## 📈 Roadmap

### Phase 1: Core Applications ✅
- Neovim, Yazi, Kitty, Fish, Tmux, Alacritty

### Phase 2: Desktop Environment
- QT/GTK themes, Rofi, Dunst, window managers

### Phase 3: Development Tools
- VS Code, Emacs, Git, Bat, Delta, Zellij

### Phase 4: System Integration
- Boot themes, login managers, system notifications

## 🎨 Philosophy Behind the Name

**Bongopunk** represents the fusion of:
- **Bongo**: The playful, rhythmic energy of BongoCat
- **Punk**: The rebellious, neon-soaked aesthetic of cyberpunk

The **Baryon/Antibaryon** naming scheme reflects:
- Physics-inspired terminology for the dual nature
- **Baryon** (light mode): Stable, everyday matter
- **Antibaryon** (dark mode): Exotic, high-energy antimatter

This creates a cohesive identity that's both fun and technically sophisticated.

## 📄 License

MIT License - Based on the original Fluoromachine colorscheme by maxmx03.

## 🙏 Acknowledgments

- **maxmx03**: Original Fluoromachine colorscheme
- **BongoCat community**: Inspiration and energy
- **Synthwave aesthetic**: Visual direction
- **Open Source community**: Platform and tools