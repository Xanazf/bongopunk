#!/bin/bash

# Bongopunk Advanced Theme Switcher
# Switches between Baryon (light) and Antibaryon (dark) modes
# Supports multiple applications and transparency options

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
CONFIG_DIR="$HOME/.config/bongopunk"
CURRENT_MODE_FILE="$CONFIG_DIR/current_mode"
CURRENT_TRANSPARENCY_FILE="$CONFIG_DIR/current_transparency"
ENABLED_APPS_FILE="$CONFIG_DIR/enabled_apps"

mkdir -p "$CONFIG_DIR"

# Default values
DEFAULT_MODE="antibaryon"
DEFAULT_TRANSPARENCY="standard"
DEFAULT_APPS="kitty alacritty fish tmux neovim"

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

# Get current mode
get_current_mode() {
    if [[ -f "$CURRENT_MODE_FILE" ]]; then
        cat "$CURRENT_MODE_FILE"
    else
        echo "$DEFAULT_MODE"
    fi
}

# Get current transparency
get_current_transparency() {
    if [[ -f "$CURRENT_TRANSPARENCY_FILE" ]]; then
        cat "$CURRENT_TRANSPARENCY_FILE"
    else
        echo "$DEFAULT_TRANSPARENCY"
    fi
}

# Get enabled apps
get_enabled_apps() {
    if [[ -f "$ENABLED_APPS_FILE" ]]; then
        cat "$ENABLED_APPS_FILE"
    else
        echo "$DEFAULT_APPS"
    fi
}

# Save current mode
save_current_mode() {
    echo "$1" > "$CURRENT_MODE_FILE"
}

# Save current transparency
save_current_transparency() {
    echo "$1" > "$CURRENT_TRANSPARENCY_FILE"
}

# Save enabled apps
save_enabled_apps() {
    echo "$1" > "$ENABLED_APPS_FILE"
}

# Switch Kitty theme
switch_kitty() {
    local mode="$1"
    local transparency="$2"
    local kitty_config="$HOME/.config/kitty/kitty.conf"
    
    if [[ ! -f "$kitty_config" ]]; then
        print_warning "Kitty config not found, skipping"
        return
    fi
    
    # Remove existing bongopunk includes
    sed -i '/include.*bongopunk/d' "$kitty_config"
    
    # Add new theme
    if [[ "$transparency" == "transparent" ]]; then
        echo "include bongopunk-$mode-transparent.conf" >> "$kitty_config"
    else
        echo "include bongopunk-$mode.conf" >> "$kitty_config"
    fi
    
    print_success "Switched Kitty to $mode mode ($transparency)"
}

# Switch Alacritty theme
switch_alacritty() {
    local mode="$1"
    local transparency="$2"
    local alacritty_config="$HOME/.config/alacritty/alacritty.toml"
    
    if [[ ! -f "$alacritty_config" ]]; then
        print_warning "Alacritty config not found, skipping"
        return
    fi
    
    # Remove existing bongopunk imports
    sed -i '/import.*bongopunk/d' "$alacritty_config"
    
    # Add new theme import
    if [[ "$transparency" == "transparent" ]]; then
        echo "import = [\"~/.config/alacritty/bongopunk-$mode-transparent.toml\"]" >> "$alacritty_config"
    else
        echo "import = [\"~/.config/alacritty/bongopunk-$mode.toml\"]" >> "$alacritty_config"
    fi
    
    print_success "Switched Alacritty to $mode mode ($transparency)"
}

# Switch Fish theme
switch_fish() {
    local mode="$1"
    local fish_config="$HOME/.config/fish/config.fish"
    
    if [[ ! -f "$fish_config" ]]; then
        print_warning "Fish config not found, skipping"
        return
    fi
    
    # Remove existing bongopunk sources
    sed -i '/source.*bongopunk/d' "$fish_config"
    
    # Add new theme source
    echo "source ~/.config/fish/bongopunk-$mode.fish" >> "$fish_config"
    
    print_success "Switched Fish to $mode mode"
}

# Switch Tmux theme
switch_tmux() {
    local mode="$1"
    local tmux_config="$HOME/.tmux.conf"
    
    if [[ ! -f "$tmux_config" ]]; then
        print_warning "Tmux config not found, skipping"
        return
    fi
    
    # Remove existing bongopunk sources
    sed -i '/source-file.*bongopunk/d' "$tmux_config"
    
    # Add new theme source
    echo "source-file ~/.tmux-bongopunk-$mode.conf" >> "$tmux_config"
    
    # Reload tmux if running
    if pgrep tmux > /dev/null; then
        tmux source-file "$tmux_config" 2>/dev/null || true
    fi
    
    print_success "Switched Tmux to $mode mode"
}

# Switch Neovim theme
switch_neovim() {
    local mode="$1"
    local nvim_config="$HOME/.config/nvim/lua/theme.lua"
    
    # Create theme.lua if it doesn't exist
    if [[ ! -f "$nvim_config" ]]; then
        mkdir -p "$(dirname "$nvim_config")"
        cat > "$nvim_config" << EOF
-- Bongopunk theme configuration
-- This file is managed by the Bongopunk theme switcher

require('bongopunk').setup({
    theme = '$mode',
    glow = true,
    transparent = false,
})

vim.cmd('colorscheme bongopunk-$mode')
EOF
    else\n        # Update existing theme.lua\n        sed -i \"s/theme = '[^']*'/theme = '$mode'/g\" \"$nvim_config\"\n        sed -i \"s/colorscheme bongopunk-[a-z]*/colorscheme bongopunk-$mode/g\" \"$nvim_config\"\n    fi\n    \n    print_success \"Switched Neovim to $mode mode\"\n}\n\n# Switch Rofi theme\nswitch_rofi() {\n    local mode=\"$1\"\n    local rofi_config=\"$HOME/.config/rofi/config.rasi\"\n    \n    if [[ ! -f \"$rofi_config\" ]]; then\n        mkdir -p \"$(dirname \"$rofi_config\")\"\n        cat > \"$rofi_config\" << EOF\nconfiguration {\n    theme: \"~/.config/rofi/bongopunk-$mode.rasi\";\n}\nEOF\n    else\n        # Update existing config\n        sed -i \"s/bongopunk-[a-z]*.rasi/bongopunk-$mode.rasi/g\" \"$rofi_config\"\n    fi\n    \n    print_success \"Switched Rofi to $mode mode\"\n}\n\n# Switch Dunst theme\nswitch_dunst() {\n    local mode=\"$1\"\n    local dunst_config=\"$HOME/.config/dunst/dunstrc\"\n    \n    if [[ -f \"$HOME/.config/dunst/bongopunk-$mode.conf\" ]]; then\n        cp \"$HOME/.config/dunst/bongopunk-$mode.conf\" \"$dunst_config\"\n        \n        # Restart dunst\n        killall dunst 2>/dev/null || true\n        \n        print_success \"Switched Dunst to $mode mode\"\n    else\n        print_warning \"Dunst $mode theme not found, skipping\"\n    fi\n}\n\n# Switch all enabled applications\nswitch_all_apps() {\n    local mode=\"$1\"\n    local transparency=\"$2\"\n    local enabled_apps=\"$3\"\n    \n    print_status \"Switching to $mode mode ($transparency)...\"\n    \n    for app in $enabled_apps; do\n        case $app in\n            kitty) switch_kitty \"$mode\" \"$transparency\" ;;\n            alacritty) switch_alacritty \"$mode\" \"$transparency\" ;;\n            fish) switch_fish \"$mode\" ;;\n            tmux) switch_tmux \"$mode\" ;;\n            neovim) switch_neovim \"$mode\" ;;\n            rofi) switch_rofi \"$mode\" ;;\n            dunst) switch_dunst \"$mode\" ;;\n            *) print_warning \"Unknown application: $app\" ;;\n        esac\n    done\n}\n\n# Toggle between modes\ntoggle_mode() {\n    local current_mode=$(get_current_mode)\n    local current_transparency=$(get_current_transparency)\n    local enabled_apps=$(get_enabled_apps)\n    \n    if [[ \"$current_mode\" == \"baryon\" ]]; then\n        local new_mode=\"antibaryon\"\n        echo \"Switching to Antibaryon (Dark Mode)\"\n    else\n        local new_mode=\"baryon\"\n        echo \"Switching to Baryon (Light Mode)\"\n    fi\n    \n    switch_all_apps \"$new_mode\" \"$current_transparency\" \"$enabled_apps\"\n    save_current_mode \"$new_mode\"\n    \n    print_success \"Theme switched to $new_mode\"\n}\n\n# Set specific mode\nset_mode() {\n    local mode=\"$1\"\n    local transparency=$(get_current_transparency)\n    local enabled_apps=$(get_enabled_apps)\n    \n    if [[ \"$mode\" != \"baryon\" && \"$mode\" != \"antibaryon\" ]]; then\n        print_error \"Invalid mode: $mode. Use 'baryon' or 'antibaryon'\"\n        exit 1\n    fi\n    \n    switch_all_apps \"$mode\" \"$transparency\" \"$enabled_apps\"\n    save_current_mode \"$mode\"\n    \n    print_success \"Theme set to $mode\"\n}\n\n# Set transparency\nset_transparency() {\n    local transparency=\"$1\"\n    local mode=$(get_current_mode)\n    local enabled_apps=$(get_enabled_apps)\n    \n    if [[ \"$transparency\" != \"standard\" && \"$transparency\" != \"transparent\" ]]; then\n        print_error \"Invalid transparency: $transparency. Use 'standard' or 'transparent'\"\n        exit 1\n    fi\n    \n    switch_all_apps \"$mode\" \"$transparency\" \"$enabled_apps\"\n    save_current_transparency \"$transparency\"\n    \n    print_success \"Transparency set to $transparency\"\n}\n\n# Configure enabled applications\nconfigure_apps() {\n    echo \"Current enabled applications: $(get_enabled_apps)\"\n    echo \"\"\n    echo \"Available applications:\"\n    echo \"1) kitty\"\n    echo \"2) alacritty\"\n    echo \"3) fish\"\n    echo \"4) tmux\"\n    echo \"5) neovim\"\n    echo \"6) rofi\"\n    echo \"7) dunst\"\n    echo \"\"\n    read -p \"Enter space-separated application names: \" -a apps\n    \n    local app_string=\"${apps[*]}\"\n    save_enabled_apps \"$app_string\"\n    \n    print_success \"Enabled applications updated: $app_string\"\n}\n\n# Show current status\nshow_status() {\n    echo -e \"${PURPLE}🎵 Bongopunk Theme Status${NC}\"\n    echo \"\"\n    echo \"Current Mode: $(get_current_mode)\"\n    echo \"Transparency: $(get_current_transparency)\"\n    echo \"Enabled Apps: $(get_enabled_apps)\"\n    echo \"\"\n}\n\n# Show help\nshow_help() {\n    echo -e \"${PURPLE}🎵 Bongopunk Theme Switcher${NC}\"\n    echo \"\"\n    echo \"Usage: $0 [COMMAND] [OPTIONS]\"\n    echo \"\"\n    echo \"Commands:\"\n    echo \"  toggle                    Toggle between light and dark modes\"\n    echo \"  set <mode>               Set specific mode (baryon/antibaryon)\"\n    echo \"  transparency <type>      Set transparency (standard/transparent)\"\n    echo \"  configure               Configure enabled applications\"\n    echo \"  status                  Show current theme status\"\n    echo \"  help                    Show this help message\"\n    echo \"\"\n    echo \"Examples:\"\n    echo \"  $0 toggle\"\n    echo \"  $0 set antibaryon\"\n    echo \"  $0 transparency transparent\"\n    echo \"  $0 configure\"\n    echo \"\"\n}\n\n# Main execution\ncase \"${1:-toggle}\" in\n    toggle)\n        toggle_mode\n        ;;\n    set)\n        if [[ -z \"$2\" ]]; then\n            print_error \"Mode required. Use 'baryon' or 'antibaryon'\"\n            exit 1\n        fi\n        set_mode \"$2\"\n        ;;\n    transparency)\n        if [[ -z \"$2\" ]]; then\n            print_error \"Transparency type required. Use 'standard' or 'transparent'\"\n            exit 1\n        fi\n        set_transparency \"$2\"\n        ;;\n    configure)\n        configure_apps\n        ;;\n    status)\n        show_status\n        ;;\n    help|--help|-h)\n        show_help\n        ;;\n    *)\n        print_error \"Unknown command: $1\"\n        show_help\n        exit 1\n        ;;\nesac"