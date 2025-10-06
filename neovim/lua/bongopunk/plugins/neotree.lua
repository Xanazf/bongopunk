-- Bongopunk Neo-tree Highlights
-- File explorer highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Neo-tree
    NeoTreeNormal = { fg = colors.fg, bg = colors.bg_alt },
    NeoTreeNormalNC = { fg = colors.fg, bg = colors.bg_alt },
    NeoTreeWinSeparator = { fg = colors.border, bg = colors.bg_alt },
    NeoTreeEndOfBuffer = { fg = colors.bg_alt, bg = colors.bg_alt },

    -- Neo-tree Root
    NeoTreeRootName = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },

    -- Neo-tree Directory
    NeoTreeDirectoryName = { fg = config.glow and colors.cyan_glow or colors.cyan },
    NeoTreeDirectoryIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },

    -- Neo-tree File
    NeoTreeFileName = { fg = colors.fg },
    NeoTreeFileIcon = { fg = colors.fg_alt },
    NeoTreeFileNameOpened = { fg = config.glow and colors.green_glow or colors.green },

    -- Neo-tree Indent
    NeoTreeIndentMarker = { fg = colors.comment },
    NeoTreeExpander = { fg = colors.comment },

    -- Neo-tree Git
    NeoTreeGitAdded = { fg = colors.git_add },
    NeoTreeGitConflict = { fg = config.glow and colors.red_glow or colors.red },
    NeoTreeGitDeleted = { fg = colors.git_delete },
    NeoTreeGitIgnored = { fg = colors.comment },
    NeoTreeGitModified = { fg = colors.git_change },
    NeoTreeGitUnstaged = { fg = config.glow and colors.orange_glow or colors.orange },
    NeoTreeGitUntracked = { fg = config.glow and colors.yellow_glow or colors.yellow },
    NeoTreeGitStaged = { fg = colors.git_add },

    -- Neo-tree Symbols
    NeoTreeSymbolicLinkTarget = { fg = config.glow and colors.cyan_glow or colors.cyan },

    -- Neo-tree Floating Border
    NeoTreeFloatBorder = { fg = colors.border, bg = colors.bg_alt },
    NeoTreeFloatTitle = { fg = config.glow and colors.purple_glow or colors.purple, bg = colors.bg_alt, bold = true },

    -- Neo-tree Tabs
    NeoTreeTabInactive = { fg = colors.comment, bg = colors.bg_alt },
    NeoTreeTabActive = { fg = colors.fg, bg = colors.bg, bold = true },
    NeoTreeTabSeparatorInactive = { fg = colors.border, bg = colors.bg_alt },
    NeoTreeTabSeparatorActive = { fg = colors.border, bg = colors.bg },

    -- Neo-tree Preview
    NeoTreePreviewBorder = { fg = colors.border, bg = colors.bg },
    NeoTreePreviewTitle = { fg = config.glow and colors.green_glow or colors.green, bg = colors.bg, bold = true },

    -- Neo-tree Cursor
    NeoTreeCursorLine = { bg = colors.line_highlight },

    -- Neo-tree Dimmed
    NeoTreeDimText = { fg = colors.comment },

    -- Neo-tree Hidden
    NeoTreeHiddenByName = { fg = colors.comment, italic = true },

    -- Neo-tree Filter
    NeoTreeFilterTerm = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },

    -- Neo-tree Message
    NeoTreeMessage = { fg = colors.comment, italic = true },

    -- Neo-tree Stats
    NeoTreeStatsHeader = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    NeoTreeStatsText = { fg = colors.fg },
  }

  return highlights
end

return M

