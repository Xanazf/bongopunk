# Bongopunk for Neovim

Synthwave-inspired colorschemes for Neovim with dual modes and advanced features inspired by fluoromachine.

## ✨ Features

- **🌓 Dual Modes**: Antibaryon (dark) and Baryon (light)
- **✨ Glow Effect**: Distinctive neon glow effect for enhanced synthwave aesthetics
- **🔧 Highly Customizable**: Full customization support with color utilities
- **🎨 Style Control**: Individual styling for comments, functions, variables, etc.
- **🔌 Extensive Plugin Support**: 20+ popular Neovim plugins supported
- **🌈 Color Utilities**: Advanced color manipulation functions
- **📊 Lualine Themes**: Dedicated statusline themes
- **🔍 LSP & Treesitter**: Modern syntax highlighting and diagnostics
- **⚡ Performance**: Optimized for fast loading

## 📦 Installation

### Using lazy.nvim (Recommended)

```lua
{
  "Xanazf/bongopunk",
  lazy = false,
  priority = 1000,
  config = function()
    require('bongopunk').setup({
      theme = 'antibaryon', -- or 'baryon'
      glow = true,
      transparent = false,
      brightness = 0.0,
    })
    vim.cmd('colorscheme bongopunk-antibaryon')
  end
}
```

#### With Snacks.nvim Integration

```lua
-- Load bongopunk first
{
  "Xanazf/bongopunk",
  lazy = false,
  priority = 1000,
  config = function()
    require('bongopunk').setup({
      theme = 'antibaryon',
      glow = true,
      plugins = {
        snacks = true, -- Enable snacks.nvim support
      },
    })
    vim.cmd('colorscheme bongopunk-antibaryon')
  end
},
-- Then load snacks.nvim
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = { "Xanazf/bongopunk" },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
```

### Using packer.nvim

```lua
use {
  'Xanazf/bongopunk',
  config = function()
    require('bongopunk').setup({
      theme = 'antibaryon',
      glow = true,
    })
    vim.cmd('colorscheme bongopunk-antibaryon')
  end
}
```

### Manual Installation

1. Copy the theme files to your Neovim directory:
   ```bash
   git clone https://github.com/Xanazf/bongopunk ~/.config/nvim/lua/bongopunk
   ```

2. Add to your `init.lua`:
   ```lua
   require('bongopunk').setup()
   vim.cmd('colorscheme bongopunk-antibaryon')
   ```

## ⚙️ Configuration

### Default Configuration

```lua
require('bongopunk').setup({
  theme = 'antibaryon',        -- 'antibaryon' (dark) or 'baryon' (light)
  glow = true,                 -- Enable glow effect
  brightness = 0.0,            -- Brightness adjustment (-1.0 to 1.0)
  transparent = false,         -- Transparent background
  
  -- Style customization
  styles = {
    comments = { italic = true },
    functions = { bold = true },
    variables = {},
    numbers = {},
    constants = {},
    parameters = {},
    keywords = { bold = true },
    types = { italic = true },
  },
  
  -- Custom color overrides
  colors = {},
  
  -- Custom highlight overrides
  overrides = {},
  
  -- Plugin support
  plugins = {
    bufferline = true,
    cmp = true,
    dashboard = true,
    editor = true,
    gitsigns = true,
    hop = true,
    ibl = true,
    illuminate = true,
    lazy = true,
    lspconfig = true,
    minicursor = true,
    ministarter = true,
    minitabline = true,
    ministatusline = true,
    navic = true,
    neogit = true,
    neotree = true,
    noice = true,
    notify = true,
    syntax = true,
    telescope = true,
    treesitter = true,
    tree = true,
    whichkey = true,
  },
})
```

### Advanced Customization

#### Custom Colors

```lua
require('bongopunk').setup({
  colors = {
    bg = '#1a1a2e',
    cyan = '#00d4ff',
    pink = '#ff006e',
  }
})
```

#### Custom Overrides with Color Functions

```lua
require('bongopunk').setup({
  overrides = function(colors, utils)
    return {
      -- Custom telescope styling
      TelescopeTitle = { fg = colors.pink, bg = utils.darken(colors.pink, 80) },
      TelescopePromptPrefix = { fg = colors.cyan },
      
      -- Custom treesitter highlights
      ['@function'] = { fg = colors.cyan, bold = true },
      ['@keyword'] = { fg = colors.pink, italic = true },
    }
  end
})
```

#### Style Customization

```lua
require('bongopunk').setup({
  styles = {
    comments = { italic = true, bold = false },
    functions = { italic = false, bold = true },
    keywords = { italic = true, bold = true },
    types = { italic = true },
    variables = { italic = true },
  }
})
```

## 🎨 Color Utilities

Bongopunk provides powerful color manipulation functions:

```lua
local bongopunk = require('bongopunk')

-- Darken a color by percentage
local darker_cyan = bongopunk.darken('#61E2FF', 20)

-- Lighten a color
local lighter_pink = bongopunk.lighten('#FC199A', 15)

-- Blend two colors
local blended = bongopunk.blend('#61E2FF', '#FC199A', 0.5)

-- Shade (mix with black) or tint (mix with white)
local shaded = bongopunk.shade('#61E2FF', 30)
local tinted = bongopunk.tint('#FC199A', 20)
```

## 📊 Lualine Integration

```lua
require('lualine').setup({
  options = {
    theme = 'bongopunk-antibaryon' -- or 'bongopunk-baryon'
  }
})
```

## 🍿 Snacks.nvim Integration

Bongopunk provides comprehensive support for [snacks.nvim](https://github.com/folke/snacks.nvim), a collection of QoL plugins for Neovim. All snacks components are fully themed:

- **Picker**: File picker with synthwave aesthetics
- **Notifier**: Beautiful notifications with glow effects
- **Dashboard**: Themed startup dashboard
- **Explorer**: File explorer with consistent colors
- **Input**: Styled input dialogs
- **Statuscolumn**: Enhanced status column
- **Terminal**: Floating terminals
- **Zen**: Distraction-free mode
- **And all other snacks components**

### Automatic Detection

Snacks.nvim support is automatically detected when the plugin is installed:

```lua
require('bongopunk').setup({
  -- snacks will be auto-detected and themed
})
```

### Manual Configuration

You can explicitly enable or disable snacks support:

```lua
require('bongopunk').setup({
  plugins = {
    snacks = true, -- Force enable
    -- or snacks = false to disable
  }
})
```

## 🔧 Mini.nvim Integration

Bongopunk provides comprehensive support for [mini.nvim](https://github.com/echasnovski/mini.nvim), a collection of independent Lua modules for Neovim. All mini.nvim modules are fully themed with consistent synthwave aesthetics:

### Supported Mini.nvim Modules

- **mini.animate**: Smooth animations with themed cursors
- **mini.base16**: Base16 colorscheme integration
- **mini.bufremove**: Buffer removal utilities
- **mini.clue**: Key binding clues with glow effects
- **mini.comment**: Code commenting with styled highlights
- **mini.completion**: Completion menu theming
- **mini.cursorword**: Cursor word highlighting
- **mini.deps**: Dependency management UI
- **mini.diff**: Git diff visualization
- **mini.doc**: Documentation generation
- **mini.files**: File explorer with synthwave colors
- **mini.fuzzy**: Fuzzy matching highlights
- **mini.hipatterns**: Pattern highlighting (TODO, FIXME, etc.)
- **mini.indentscope**: Indent scope visualization
- **mini.jump**: Quick jumping with bright markers
- **mini.jump2d**: 2D jumping with color-coded spots
- **mini.map**: Window map visualization
- **mini.move**: Text movement utilities
- **mini.notify**: Notification styling
- **mini.operators**: Text operator highlights
- **mini.pairs**: Auto-pairing highlights
- **mini.pick**: Picker interface with full theming
- **mini.sessions**: Session management UI
- **mini.splitjoin**: Split/join operation highlights
- **mini.starter**: Start screen with synthwave styling
- **mini.statusline**: Statusline with mode-specific colors
- **mini.surround**: Surround operation highlights
- **mini.tabline**: Tabline with consistent theming
- **mini.test**: Test result highlighting
- **mini.trailspace**: Trailing whitespace highlighting

### Automatic Detection

Mini.nvim support is automatically detected when any mini.nvim module is installed:

```lua
require('bongopunk').setup({
  -- mini.nvim will be auto-detected and themed
})
```

### Manual Configuration

You can explicitly control mini.nvim support:

```lua
require('bongopunk').setup({
  plugins = {
    mini = true, -- Force enable mini.nvim support
    -- or mini = false to disable
  }
})
```

### Example with Mini.nvim

```lua
-- Load bongopunk first
{
  "Xanazf/bongopunk",
  lazy = false,
  priority = 1000,
  config = function()
    require('bongopunk').setup({
      theme = 'antibaryon',
      glow = true,
      plugins = {
        mini = true, -- Enable mini.nvim support
      },
    })
    vim.cmd('colorscheme bongopunk-antibaryon')
  end
},
-- Then load mini.nvim modules
{
  'echasnovski/mini.nvim',
  version = false,
  dependencies = { "Xanazf/bongopunk" },
  config = function()
    require('mini.starter').setup()
    require('mini.files').setup()
    require('mini.pick').setup()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
    -- Add other mini modules as needed
  end
}
```

## 🔌 Supported Plugins

- **Completion**: nvim-cmp
- **File Explorer**: neo-tree.nvim, nvim-tree.lua
- **Fuzzy Finder**: telescope.nvim, snacks.picker
- **Git**: gitsigns.nvim, neogit
- **LSP**: nvim-lspconfig, nvim-navic
- **Notifications**: nvim-notify, noice.nvim, snacks.notifier
- **Statusline**: lualine.nvim
- **Syntax**: nvim-treesitter
- **Tabline**: bufferline.nvim
- **UI**: dashboard-nvim, which-key.nvim, snacks.dashboard
- **QoL Collection**: snacks.nvim (complete support)
- **Mini.nvim**: Complete collection of mini.nvim modules (animate, base16, bufremove, clue, comment, completion, cursorword, deps, diff, doc, files, fuzzy, hipatterns, indentscope, jump, jump2d, map, move, notify, operators, pairs, pick, sessions, splitjoin, starter, statusline, surround, tabline, test, trailspace)
- **And many more...**

## 🎯 Usage Examples

### Quick Theme Switching

```lua
-- Switch to light theme
require('bongopunk').switch_theme('baryon')

-- Switch to dark theme
require('bongopunk').switch_theme('antibaryon')

-- Toggle between themes
require('bongopunk').toggle()
```

### Get Current Colors

```lua
local colors = require('bongopunk').get_colors()
print(colors.cyan) -- Current cyan color
```

### Direct Colorscheme Loading

You can also load the colorscheme directly:

```lua
vim.cmd('colorscheme bongopunk-antibaryon')
vim.cmd('colorscheme bongopunk-baryon')
```

Note: For full customization options, use the setup function instead.

## 🎨 Color Palette

### Antibaryon (Dark Mode)
- **Background**: `#1E2A3A`
- **Foreground**: `#8BA7A7`
- **Cyan**: `#61E2FF` (with glow: enhanced brightness)
- **Green**: `#72F1B8`
- **Orange**: `#FF8B39`
- **Pink**: `#FC199A`
- **Purple**: `#AF6DF9`
- **Red**: `#FE4450`
- **Yellow**: `#FFCC00`

### Baryon (Light Mode)
- **Background**: `#FAFAFA`
- **Foreground**: `#2D2D2D`
- **Cyan**: `#0891B2`
- **Green**: `#059669`
- **Orange**: `#EA580C`
- **Pink**: `#BE185D`
- **Purple**: `#7C3AED`
- **Red**: `#DC2626`
- **Yellow**: `#D97706`

## ⚡ Performance

Bongopunk is optimized for performance:
- Lazy loading of plugin highlights
- Efficient color calculations
- Minimal startup impact
- Modular architecture
- Full lazy.nvim compatibility

### Lazy.nvim Best Practices

For optimal performance with lazy.nvim:

```lua
-- Recommended configuration
{
  "Xanazf/bongopunk",
  lazy = false,        -- Load immediately for colorscheme
  priority = 1000,     -- High priority for early loading
  config = function()
    require('bongopunk').setup({
      performance = {
        cache_enabled = true,    -- Enable caching
        lazy_loading = true,     -- Lazy load plugin highlights
        plugin_detection = true, -- Auto-detect plugins
      },
    })
    vim.cmd('colorscheme bongopunk-antibaryon')
  end
}
```

**Note**: Set `lazy = false` and `priority = 1000` to ensure the colorscheme loads before other plugins that depend on highlight groups.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📄 License

MIT License - see LICENSE file for details.

## 🙏 Acknowledgments

- Inspired by [fluoromachine.nvim](https://github.com/maxmx03/fluoromachine.nvim)
- Based on the synthwave aesthetic
- Part of the Bongopunk theme collection