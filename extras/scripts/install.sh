#!/bin/bash

# Bongopunk Theme Pack Installation Script
# Installs themes for various applications

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

echo -e "${PURPLE}🎵 Bongopunk Theme Pack Installer${NC}"
echo -e "${CYAN}Based on Fluoromachine by maxmx03${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to ask for mode selection
select_mode() {
    echo -e "${PURPLE}Select theme mode:${NC}"
    echo "1) Baryon (Light Mode)"
    echo "2) Antibaryon (Dark Mode)"
    echo "3) Both modes"
    read -p "Enter your choice (1-3): " mode_choice
    
    case $mode_choice in
        1) MODES=("baryon") ;;
        2) MODES=("antibaryon") ;;
        3) MODES=("baryon" "antibaryon") ;;
        *) print_error "Invalid choice. Exiting."; exit 1 ;;
    esac
}

# Function to ask for transparency preference
select_transparency() {
    echo -e "${PURPLE}Select transparency option:${NC}"
    echo "1) Standard (semi-transparent with blur)"
    echo "2) Transparent (fully transparent)"
    echo "3) Both variants"
    read -p "Enter your choice (1-3): " transparency_choice
    
    case $transparency_choice in
        1) TRANSPARENCY=("standard") ;;
        2) TRANSPARENCY=("transparent") ;;
        3) TRANSPARENCY=("standard" "transparent") ;;
        *) print_error "Invalid choice. Exiting."; exit 1 ;;
    esac
}

# Function to install Neovim theme
install_neovim() {
    print_status "Installing Neovim themes..."
    
    local nvim_dir="$HOME/.config/nvim"
    local colors_dir="$nvim_dir/colors"
    
    mkdir -p "$colors_dir"
    
    for mode in "${MODES[@]}"; do
        if [[ -f "$THEME_DIR/neovim/$mode.lua" ]]; then
            cp "$THEME_DIR/neovim/$mode.lua" "$colors_dir/bongopunk-$mode.lua"
            print_success "Installed Neovim $mode theme"
        else
            print_warning "Neovim $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Neovim, add to your init.lua:"
    echo "vim.cmd('colorscheme bongopunk-baryon')  -- for light mode"
    echo "vim.cmd('colorscheme bongopunk-antibaryon')  -- for dark mode"
    echo ""
}

# Function to install Kitty theme
install_kitty() {
    print_status "Installing Kitty themes..."
    
    local kitty_dir="$HOME/.config/kitty"
    mkdir -p "$kitty_dir"
    
    for mode in "${MODES[@]}"; do
        for transparency in "${TRANSPARENCY[@]}"; do
            if [[ "$transparency" == "standard" ]]; then
                if [[ -f "$THEME_DIR/kitty/$mode.conf" ]]; then
                    cp "$THEME_DIR/kitty/$mode.conf" "$kitty_dir/bongopunk-$mode.conf"
                    print_success "Installed Kitty $mode theme"
                fi
            else
                if [[ -f "$THEME_DIR/kitty/$mode-transparent.conf" ]]; then
                    cp "$THEME_DIR/kitty/$mode-transparent.conf" "$kitty_dir/bongopunk-$mode-transparent.conf"
                    print_success "Installed Kitty $mode transparent theme"
                fi
            fi
        done
    done
    
    echo ""
    echo "To use the theme in Kitty, add to your kitty.conf:"
    echo "include bongopunk-baryon.conf  # for light mode"
    echo "include bongopunk-antibaryon.conf  # for dark mode"
    echo "include bongopunk-baryon-transparent.conf  # for transparent light mode"
    echo "include bongopunk-antibaryon-transparent.conf  # for transparent dark mode"
    echo ""
}

# Function to install Alacritty theme
install_alacritty() {
    print_status "Installing Alacritty themes..."
    
    local alacritty_dir="$HOME/.config/alacritty"
    mkdir -p "$alacritty_dir"
    
    for mode in "${MODES[@]}"; do
        for transparency in "${TRANSPARENCY[@]}"; do
            if [[ "$transparency" == "standard" ]]; then
                if [[ -f "$THEME_DIR/alacritty/$mode.toml" ]]; then
                    cp "$THEME_DIR/alacritty/$mode.toml" "$alacritty_dir/bongopunk-$mode.toml"
                    print_success "Installed Alacritty $mode theme"
                else
                    print_warning "Alacritty $mode theme not found"
                fi
            else
                if [[ -f "$THEME_DIR/alacritty/$mode-transparent.toml" ]]; then
                    cp "$THEME_DIR/alacritty/$mode-transparent.toml" "$alacritty_dir/bongopunk-$mode-transparent.toml"
                    print_success "Installed Alacritty $mode transparent theme"
                else
                    print_warning "Alacritty $mode transparent theme not found"
                fi
            fi
        done
    done
    
    echo ""
    echo "To use the theme in Alacritty, import in your alacritty.toml:"
    echo "import = [\"~/.config/alacritty/bongopunk-baryon.toml\"]  # for light mode"
    echo "import = [\"~/.config/alacritty/bongopunk-antibaryon.toml\"]  # for dark mode"
    echo "import = [\"~/.config/alacritty/bongopunk-baryon-transparent.toml\"]  # transparent light"
    echo "import = [\"~/.config/alacritty/bongopunk-antibaryon-transparent.toml\"]  # transparent dark"
    echo ""
}

# Function to install Fish theme
install_fish() {
    print_status "Installing Fish themes..."
    
    local fish_dir="$HOME/.config/fish"
    local functions_dir="$fish_dir/functions"
    mkdir -p "$functions_dir"
    
    for mode in "${MODES[@]}"; do
        if [[ -f "$THEME_DIR/fish/$mode.fish" ]]; then
            cp "$THEME_DIR/fish/$mode.fish" "$fish_dir/bongopunk-$mode.fish"
            print_success "Installed Fish $mode theme"
        else
            print_warning "Fish $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Fish, source it in your config.fish:"
    echo "source ~/.config/fish/bongopunk-baryon.fish  # for light mode"
    echo "source ~/.config/fish/bongopunk-antibaryon.fish  # for dark mode"
    echo ""
}

# Function to install Tmux theme
install_tmux() {
    print_status "Installing Tmux themes..."
    
    for mode in "${MODES[@]}"; do
        if [[ -f "$THEME_DIR/tmux/$mode.tmux" ]]; then
            cp "$THEME_DIR/tmux/$mode.tmux" "$HOME/.tmux-bongopunk-$mode.conf"
            print_success "Installed Tmux $mode theme"
        else
            print_warning "Tmux $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Tmux, source it in your .tmux.conf:"
    echo "source-file ~/.tmux-bongopunk-baryon.conf  # for light mode"
    echo "source-file ~/.tmux-bongopunk-antibaryon.conf  # for dark mode"
    echo ""
}

# Function to install Yazi theme
install_yazi() {
    print_status "Installing Yazi themes..."
    
    local yazi_dir="$HOME/.config/yazi/flavors"
    mkdir -p "$yazi_dir"
    
    for mode in "${MODES[@]}"; do
        if [[ -d "$THEME_DIR/yazi/$mode.yazi" ]]; then
            cp -r "$THEME_DIR/yazi/$mode.yazi" "$yazi_dir/bongopunk-$mode.yazi"
            print_success "Installed Yazi $mode theme"
        else
            print_warning "Yazi $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Yazi, add to your theme.toml:"
    echo "[flavor]"
    echo "use = \"bongopunk-baryon\"  # for light mode"
    echo "use = \"bongopunk-antibaryon\"  # for dark mode"
    echo ""
}

# Function to install Rofi theme
install_rofi() {
    print_status "Installing Rofi themes..."
    
    local rofi_dir="$HOME/.config/rofi"
    mkdir -p "$rofi_dir"
    
    for mode in "${MODES[@]}"; do
        if [[ -f "$THEME_DIR/rofi/$mode.rasi" ]]; then
            cp "$THEME_DIR/rofi/$mode.rasi" "$rofi_dir/bongopunk-$mode.rasi"
            print_success "Installed Rofi $mode theme"
        else
            print_warning "Rofi $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Rofi:"
    echo "rofi -show drun -theme bongopunk-baryon  # for light mode"
    echo "rofi -show drun -theme bongopunk-antibaryon  # for dark mode"
    echo ""
}

# Function to install Dunst theme
install_dunst() {
    print_status "Installing Dunst themes..."
    
    local dunst_dir="$HOME/.config/dunst"
    mkdir -p "$dunst_dir"
    
    # Backup existing config
    if [[ -f "$dunst_dir/dunstrc" ]]; then
        cp "$dunst_dir/dunstrc" "$dunst_dir/dunstrc.backup.$(date +%Y%m%d_%H%M%S)"
        print_status "Backed up existing Dunst configuration"
    fi
    
    for mode in "${MODES[@]}"; do
        if [[ -f "$THEME_DIR/dunst/$mode.conf" ]]; then
            cp "$THEME_DIR/dunst/$mode.conf" "$dunst_dir/bongopunk-$mode.conf"
            print_success "Installed Dunst $mode theme"
        else
            print_warning "Dunst $mode theme not found"
        fi
    done
    
    echo ""
    echo "To use the theme in Dunst:"
    echo "cp ~/.config/dunst/bongopunk-baryon.conf ~/.config/dunst/dunstrc  # for light mode"
    echo "cp ~/.config/dunst/bongopunk-antibaryon.conf ~/.config/dunst/dunstrc  # for dark mode"
    echo "killall dunst  # restart dunst"
    echo ""
}

# Function to create theme switcher script
create_switcher() {
    print_status "Creating theme switcher script..."
    
    local switcher_script="$HOME/.local/bin/bongopunk-switch"
    mkdir -p "$(dirname "$switcher_script")"
    
    cat > "$switcher_script" << 'EOF'
#!/bin/bash

# Bongopunk Theme Switcher
# Switches between Baryon (light) and Antibaryon (dark) modes

set -e

CURRENT_MODE_FILE="$HOME/.config/bongopunk/current_mode"
mkdir -p "$(dirname "$CURRENT_MODE_FILE")"

# Get current mode
if [[ -f "$CURRENT_MODE_FILE" ]]; then
    CURRENT_MODE=$(cat "$CURRENT_MODE_FILE")
else
    CURRENT_MODE="antibaryon"
fi

# Switch mode
if [[ "$CURRENT_MODE" == "baryon" ]]; then
    NEW_MODE="antibaryon"
    echo "Switching to Antibaryon (Dark Mode)"
else
    NEW_MODE="baryon"
    echo "Switching to Baryon (Light Mode)"
fi

# Save new mode
echo "$NEW_MODE" > "$CURRENT_MODE_FILE"

# Apply themes (add your specific application switching logic here)
echo "Theme switched to $NEW_MODE"
echo "Please restart your applications or reload their configurations"
EOF

    chmod +x "$switcher_script"
    print_success "Created theme switcher at $switcher_script"
    echo ""
    echo "Usage: bongopunk-switch"
    echo ""
}

# Main installation menu
main_menu() {
    echo "Select applications to install themes for:"
    echo "1) All applications"
    echo "2) Neovim"
    echo "3) Kitty"
    echo "4) Alacritty"
    echo "5) Fish"
    echo "6) Tmux"
    echo "7) Yazi"
    echo "8) Rofi"
    echo "9) Dunst"
    echo "10) Create theme switcher"
    echo "11) Custom selection"
    echo "0) Exit"
    
    read -p "Enter your choice: " app_choice
    
    case $app_choice in
        1)
            install_neovim
            install_kitty
            install_alacritty
            install_fish
            install_tmux
            install_yazi
            install_rofi
            install_dunst
            create_switcher
            ;;
        2) install_neovim ;;
        3) install_kitty ;;
        4) install_alacritty ;;
        5) install_fish ;;
        6) install_tmux ;;
        7) install_yazi ;;
        8) install_rofi ;;
        9) install_dunst ;;
        10) create_switcher ;;
        11) custom_selection ;;
        0) exit 0 ;;
        *) print_error "Invalid choice"; exit 1 ;;
    esac
}

# Custom selection menu
custom_selection() {
    echo "Select applications (space-separated numbers):"
    echo "1) Neovim  2) Kitty  3) Alacritty  4) Fish  5) Tmux  6) Yazi  7) Rofi  8) Dunst  9) Switcher"
    read -p "Enter choices: " -a choices
    
    for choice in "${choices[@]}"; do
        case $choice in
            1) install_neovim ;;
            2) install_kitty ;;
            3) install_alacritty ;;
            4) install_fish ;;
            5) install_tmux ;;
            6) install_yazi ;;
            7) install_rofi ;;
            8) install_dunst ;;
            9) create_switcher ;;
            *) print_warning "Invalid choice: $choice" ;;
        esac
    done
}

# Main execution
select_mode
select_transparency
main_menu

print_success "Installation complete!"
echo ""
echo -e "${PURPLE}🎵 Enjoy your new Bongopunk themes! 🎵${NC}"
echo ""
echo "For more information and updates, visit:"
echo "https://github.com/yourusername/bongopunk"
echo ""
echo "Note: Update the GitHub URL in this script once you publish the repository"