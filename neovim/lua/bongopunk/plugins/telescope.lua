-- Bongopunk Telescope Highlights
-- Telescope fuzzy finder highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_alt },
    TelescopeBorder = { fg = colors.border, bg = colors.bg_alt },
    TelescopeTitle = { fg = config.glow and colors.purple_glow or colors.purple, bg = colors.bg_alt, bold = true },

    -- Telescope Prompt
    TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopePromptBorder = { fg = colors.border, bg = colors.bg_dark },
    TelescopePromptTitle = { fg = config.glow and colors.pink_glow or colors.pink, bg = colors.bg_dark, bold = true },
    TelescopePromptPrefix = { fg = config.glow and colors.cyan_glow or colors.cyan, bg = colors.bg_dark },
    TelescopePromptCounter = { fg = colors.comment, bg = colors.bg_dark },

    -- Telescope Results
    TelescopeResultsNormal = { fg = colors.fg, bg = colors.bg_alt },
    TelescopeResultsBorder = { fg = colors.border, bg = colors.bg_alt },
    TelescopeResultsTitle = { fg = config.glow and colors.cyan_glow or colors.cyan, bg = colors.bg_alt, bold = true },

    -- Telescope Preview
    TelescopePreviewNormal = { fg = colors.fg, bg = colors.bg },
    TelescopePreviewBorder = { fg = colors.border, bg = colors.bg },
    TelescopePreviewTitle = { fg = config.glow and colors.green_glow or colors.green, bg = colors.bg, bold = true },

    -- Telescope Selection
    TelescopeSelection = { fg = colors.fg, bg = colors.line_highlight, bold = true },
    TelescopeSelectionCaret = { fg = config.glow and colors.pink_glow or colors.pink, bg = colors.line_highlight },
    TelescopeMultiSelection = { fg = config.glow and colors.purple_glow or colors.purple, bg = colors.line_highlight },
    TelescopeMultiIcon = { fg = config.glow and colors.purple_glow or colors.purple },

    -- Telescope Matching
    TelescopeMatching = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },

    -- Telescope Path
    TelescopePathSeparator = { fg = colors.comment },

    -- Telescope File Icons
    TelescopeResultsClass = { fg = config.glow and colors.cyan_glow or colors.cyan },
    TelescopeResultsConstant = { fg = config.glow and colors.orange_glow or colors.orange },
    TelescopeResultsField = { fg = colors.fg },
    TelescopeResultsFunction = { fg = config.glow and colors.cyan_glow or colors.cyan },
    TelescopeResultsMethod = { fg = config.glow and colors.cyan_glow or colors.cyan },
    TelescopeResultsOperator = { fg = colors.fg_alt },
    TelescopeResultsStruct = { fg = config.glow and colors.cyan_glow or colors.cyan },
    TelescopeResultsVariable = { fg = colors.fg },
    TelescopeResultsLineNr = { fg = colors.comment },
    TelescopeResultsIdentifier = { fg = colors.fg },
    TelescopeResultsNumber = { fg = config.glow and colors.orange_glow or colors.orange },
    TelescopeResultsComment = { fg = colors.comment },
    TelescopeResultsSpecialComment = { fg = colors.comment },

    -- Telescope File Types
    TelescopeResultsFileIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    TelescopeResultsDiffAdd = { fg = colors.git_add },
    TelescopeResultsDiffChange = { fg = colors.git_change },
    TelescopeResultsDiffDelete = { fg = colors.git_delete },
    TelescopeResultsDiffUntracked = { fg = colors.comment },
  }

  return highlights
end

return M

