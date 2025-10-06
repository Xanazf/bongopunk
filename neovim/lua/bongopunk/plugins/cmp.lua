-- Bongopunk nvim-cmp Highlights
-- Completion menu highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Completion Menu
    CmpNormal = { fg = colors.fg, bg = colors.bg_alt },
    CmpBorder = { fg = colors.border, bg = colors.bg_alt },
    CmpDocumentation = { fg = colors.fg, bg = colors.bg_alt },
    CmpDocumentationBorder = { fg = colors.border, bg = colors.bg_alt },

    -- Completion Items
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrDeprecated = { fg = colors.comment, strikethrough = true },
    CmpItemAbbrMatch = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },

    -- Completion Menu Selection
    CmpItemMenu = { fg = colors.comment, italic = true },
    CmpItemSelected = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },

    -- Completion Item Kinds
    CmpItemKindText = { fg = colors.fg },
    CmpItemKindMethod = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindFunction = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindConstructor = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindField = { fg = colors.fg },
    CmpItemKindVariable = { fg = colors.fg },
    CmpItemKindClass = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindInterface = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindModule = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindProperty = { fg = colors.fg },
    CmpItemKindUnit = { fg = config.glow and colors.orange_glow or colors.orange },
    CmpItemKindValue = { fg = config.glow and colors.orange_glow or colors.orange },
    CmpItemKindEnum = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindKeyword = { fg = config.glow and colors.pink_glow or colors.pink },
    CmpItemKindSnippet = { fg = config.glow and colors.green_glow or colors.green },
    CmpItemKindColor = { fg = config.glow and colors.yellow_glow or colors.yellow },
    CmpItemKindFile = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindReference = { fg = config.glow and colors.purple_glow or colors.purple },
    CmpItemKindFolder = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindEnumMember = { fg = config.glow and colors.orange_glow or colors.orange },
    CmpItemKindConstant = { fg = config.glow and colors.orange_glow or colors.orange },
    CmpItemKindStruct = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindEvent = { fg = config.glow and colors.yellow_glow or colors.yellow },
    CmpItemKindOperator = { fg = colors.fg_alt },
    CmpItemKindTypeParameter = { fg = config.glow and colors.cyan_glow or colors.cyan },

    -- LSP-specific kinds
    CmpItemKindCopilot = { fg = config.glow and colors.green_glow or colors.green },
    CmpItemKindTabNine = { fg = config.glow and colors.purple_glow or colors.purple },
    CmpItemKindEmoji = { fg = config.glow and colors.yellow_glow or colors.yellow },

    -- Source-specific highlights
    CmpItemKindBuffer = { fg = config.glow and colors.cyan_glow or colors.cyan },
    CmpItemKindPath = { fg = config.glow and colors.green_glow or colors.green },
    CmpItemKindCmdline = { fg = config.glow and colors.yellow_glow or colors.yellow },
  }

  return highlights
end

return M

