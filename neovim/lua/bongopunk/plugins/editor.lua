-- Bongopunk Editor Highlights
-- Basic editor UI elements

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Editor
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_alt },
    NormalNC = { fg = colors.fg, bg = colors.bg },

    -- Cursor
    Cursor = { fg = colors.bg, bg = colors.cursor },
    CursorLine = { bg = colors.line_highlight },
    CursorColumn = { bg = colors.line_highlight },
    CursorLineNr = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    LineNr = { fg = colors.comment },

    -- Visual
    Visual = { bg = colors.visual },
    VisualNOS = { bg = colors.visual },

    -- Search
    Search = { bg = colors.search, fg = colors.fg },
    IncSearch = { bg = config.glow and colors.yellow_glow or colors.yellow, fg = colors.bg },
    CurSearch = { bg = config.glow and colors.orange_glow or colors.orange, fg = colors.bg },

    -- Diff
    DiffAdd = { bg = colors.diff_add },
    DiffDelete = { bg = colors.diff_delete },
    DiffChange = { bg = colors.diff_change },
    DiffText = { bg = colors.diff_text },

    -- UI Elements
    Pmenu = { fg = colors.fg, bg = colors.bg_alt },
    PmenuSel = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },
    PmenuSbar = { bg = colors.border },
    PmenuThumb = { bg = colors.fg_alt },

    StatusLine = { fg = colors.fg, bg = colors.bg_alt },
    StatusLineNC = { fg = colors.comment, bg = colors.bg_alt },

    TabLine = { fg = colors.comment, bg = colors.bg_alt },
    TabLineFill = { bg = colors.bg_alt },
    TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },

    VertSplit = { fg = colors.border },
    WinSeparator = { fg = colors.border },

    -- Messages
    ErrorMsg = { fg = colors.error },
    WarningMsg = { fg = colors.warning },
    MoreMsg = { fg = colors.info },
    Question = { fg = colors.info },

    -- Folds
    Folded = { fg = colors.comment, bg = colors.bg_alt },
    FoldColumn = { fg = colors.comment, bg = colors.bg },

    -- Spelling
    SpellBad = { undercurl = true, sp = colors.error },
    SpellCap = { undercurl = true, sp = colors.warning },
    SpellLocal = { undercurl = true, sp = colors.info },
    SpellRare = { undercurl = true, sp = colors.purple },

    -- Matching
    MatchParen = { bg = colors.match_paren, bold = true },

    -- Directory
    Directory = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },

    -- Title
    Title = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },

    -- Conceal
    Conceal = { fg = colors.comment },

    -- NonText
    NonText = { fg = colors.comment },
    SpecialKey = { fg = colors.comment },

    -- Whitespace
    Whitespace = { fg = colors.comment },

    -- Sign column
    SignColumn = { bg = colors.bg },

    -- Color column
    ColorColumn = { bg = colors.bg_alt },

    -- Wild menu
    WildMenu = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },

    -- Quickfix
    QuickFixLine = { bg = colors.line_highlight },

    -- Terminal
    Terminal = { fg = colors.fg, bg = colors.bg },

    -- Float border
    FloatBorder = { fg = colors.border, bg = colors.bg_alt },
    FloatTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },

    -- Window
    WinBar = { fg = colors.fg, bg = colors.bg },
    WinBarNC = { fg = colors.comment, bg = colors.bg },
  }

  return highlights
end

return M

