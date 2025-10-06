-- Bongopunk Mini.nvim Highlights
-- Comprehensive support for all mini.nvim modules

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Mini.animate
    MiniAnimateCursor = { fg = colors.cursor, reverse = true },
    MiniAnimateNormalFloat = { fg = colors.fg, bg = colors.bg_alt },

    -- Mini.base16 (if used as a base)
    MiniBase16Red = { fg = colors.red },
    MiniBase16Orange = { fg = colors.orange },
    MiniBase16Yellow = { fg = colors.yellow },
    MiniBase16Green = { fg = colors.green },
    MiniBase16Cyan = { fg = colors.cyan },
    MiniBase16Blue = { fg = config.glow and colors.cyan_glow or colors.cyan },
    MiniBase16Purple = { fg = colors.purple },
    MiniBase16Brown = { fg = colors.orange },

    -- Mini.clue
    MiniClueBorder = { fg = colors.border, bg = colors.bg_alt },
    MiniClueDescGroup = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniClueDescSingle = { fg = colors.fg },
    MiniClueNextKey = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    MiniClueNextKeyWithPostkeys = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    MiniClueSeparator = { fg = colors.comment },
    MiniClueTitle = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },

    -- Mini.comment
    MiniComment = { fg = colors.comment, italic = config.styles.comments.italic },

    -- Mini.completion
    MiniCompletionActiveParameter = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },

    -- Mini.cursorword
    MiniCursorword = { bg = colors.line_highlight },
    MiniCursorwordCurrent = { bg = colors.line_highlight, bold = true },

    -- Mini.deps
    MiniDepsChangeAdded = { fg = colors.git_add },
    MiniDepsChangeRemoved = { fg = colors.git_delete },
    MiniDepsHint = { fg = colors.diagnostic_hint },
    MiniDepsInfo = { fg = colors.diagnostic_info },
    MiniDepsMsgBreaking = { fg = colors.diagnostic_error, bold = true },
    MiniDepsPlaceholder = { fg = colors.comment },
    MiniDepsTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniDepsTitleError = { fg = colors.diagnostic_error, bold = true },
    MiniDepsTitleSame = { fg = colors.comment },
    MiniDepsTitleUpdate = { fg = colors.diagnostic_info, bold = true },

    -- Mini.diff
    MiniDiffSignAdd = { fg = colors.git_add },
    MiniDiffSignChange = { fg = colors.git_change },
    MiniDiffSignDelete = { fg = colors.git_delete },
    MiniDiffOverAdd = { bg = colors.diff_add },
    MiniDiffOverChange = { bg = colors.diff_change },
    MiniDiffOverContext = { bg = colors.bg_alt },
    MiniDiffOverDelete = { bg = colors.diff_delete },

    -- Mini.files
    MiniFilesFile = { fg = colors.fg },
    MiniFilesDirectory = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    MiniFilesBorder = { fg = colors.border, bg = colors.bg_alt },
    MiniFilesBorderModified = { fg = colors.git_change, bg = colors.bg_alt },
    MiniFilesCursorLine = { bg = colors.line_highlight },
    MiniFilesNormal = { fg = colors.fg, bg = colors.bg_alt },
    MiniFilesTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniFilesTitleFocused = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },

    -- Mini.fuzzy
    MiniHipatternsFuzzy = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },

    -- Mini.hipatterns
    MiniHipatternsFixme = { fg = colors.bg, bg = colors.diagnostic_error, bold = true },
    MiniHipatternsHack = { fg = colors.bg, bg = colors.diagnostic_warn, bold = true },
    MiniHipatternsNote = { fg = colors.bg, bg = colors.diagnostic_info, bold = true },
    MiniHipatternsTodo = { fg = colors.bg, bg = colors.diagnostic_hint, bold = true },

    -- Mini.indentscope
    MiniIndentscopeSymbol = { fg = config.glow and colors.purple_glow or colors.purple },
    MiniIndentscopePrefix = { nocombine = true },

    -- Mini.jump
    MiniJump = { fg = colors.bg, bg = config.glow and colors.yellow_glow or colors.yellow, bold = true },

    -- Mini.jump2d
    MiniJump2dSpot = { fg = colors.bg, bg = config.glow and colors.pink_glow or colors.pink, bold = true },
    MiniJump2dSpotAhead = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    MiniJump2dSpotUnique = { fg = colors.bg, bg = config.glow and colors.orange_glow or colors.orange, bold = true },

    -- Mini.map
    MiniMapNormal = { fg = colors.fg, bg = colors.bg_alt },
    MiniMapSymbolCount = { fg = colors.comment },
    MiniMapSymbolLine = { fg = config.glow and colors.cyan_glow or colors.cyan },
    MiniMapSymbolView = { fg = config.glow and colors.purple_glow or colors.purple },

    -- Mini.notify
    MiniNotifyBorder = { fg = colors.border, bg = colors.bg_alt },
    MiniNotifyNormal = { fg = colors.fg, bg = colors.bg_alt },
    MiniNotifyTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },

    -- Mini.operators
    MiniOperatorsExchangeFrom = { bg = colors.visual },

    -- Mini.pick
    MiniPickBorder = { fg = colors.border, bg = colors.bg_alt },
    MiniPickBorderBusy = { fg = colors.diagnostic_warn, bg = colors.bg_alt },
    MiniPickBorderText = { fg = config.glow and colors.cyan_glow or colors.cyan, bg = colors.bg_alt },
    MiniPickIconDirectory = { fg = config.glow and colors.cyan_glow or colors.cyan },
    MiniPickIconFile = { fg = colors.fg },
    MiniPickHeader = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniPickMatchCurrent = { bg = colors.line_highlight, bold = true },
    MiniPickMatchMarked = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    MiniPickMatchRanges = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },
    MiniPickNormal = { fg = colors.fg, bg = colors.bg_alt },
    MiniPickPreviewLine = { bg = colors.line_highlight },
    MiniPickPreviewRegion = { bg = colors.visual },
    MiniPickPrompt = { fg = config.glow and colors.cyan_glow or colors.cyan, bg = colors.bg_alt },

    -- Mini.sessions
    MiniSessionsCurrent = { fg = config.glow and colors.green_glow or colors.green, bold = true },
    MiniSessionsFile = { fg = colors.fg },
    MiniSessionsDirectory = { fg = config.glow and colors.cyan_glow or colors.cyan },

    -- Mini.starter
    MiniStarterCurrent = { bg = colors.line_highlight, bold = true },
    MiniStarterFooter = { fg = colors.comment, italic = true },
    MiniStarterHeader = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniStarterInactive = { fg = colors.comment },
    MiniStarterItem = { fg = colors.fg },
    MiniStarterItemBullet = { fg = config.glow and colors.cyan_glow or colors.cyan },
    MiniStarterItemPrefix = { fg = config.glow and colors.pink_glow or colors.pink },
    MiniStarterSection = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    MiniStarterQuery = { fg = config.glow and colors.green_glow or colors.green },

    -- Mini.statusline
    MiniStatuslineDevinfo = { fg = colors.fg, bg = colors.bg_alt },
    MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.bg_alt },
    MiniStatuslineFilename = { fg = colors.fg, bg = colors.bg_alt },
    MiniStatuslineInactive = { fg = colors.comment, bg = colors.bg_alt },
    MiniStatuslineModeCommand = { fg = colors.bg, bg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = colors.bg, bg = config.glow and colors.green_glow or colors.green, bold = true },
    MiniStatuslineModeNormal = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    MiniStatuslineModeOther = { fg = colors.bg, bg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniStatuslineModeReplace = { fg = colors.bg, bg = config.glow and colors.red or colors.red, bold = true },
    MiniStatuslineModeVisual = { fg = colors.bg, bg = config.glow and colors.pink_glow or colors.pink, bold = true },

    -- Mini.surround
    MiniSurround = { bg = colors.visual },

    -- Mini.tabline
    MiniTablineCurrent = { fg = colors.fg, bg = colors.bg, bold = true },
    MiniTablineFill = { bg = colors.bg_alt },
    MiniTablineHidden = { fg = colors.comment, bg = colors.bg_alt },
    MiniTablineModifiedCurrent = { fg = colors.git_change, bg = colors.bg, bold = true },
    MiniTablineModifiedHidden = { fg = colors.git_change, bg = colors.bg_alt },
    MiniTablineModifiedVisible = { fg = colors.git_change, bg = colors.bg_alt },
    MiniTablineTabpagesection = { fg = colors.bg, bg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniTablineVisible = { fg = colors.fg, bg = colors.bg_alt },

    -- Mini.test
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = colors.diagnostic_error, bold = true },
    MiniTestPass = { fg = colors.diagnostic_info, bold = true },

    -- Mini.trailspace
    MiniTrailspace = { bg = colors.diagnostic_error },

    -- Additional mini.nvim modules that might be added in the future
    -- These provide a consistent base for any new modules
    MiniMiscNormal = { fg = colors.fg, bg = colors.bg_alt },
    MiniMiscBorder = { fg = colors.border, bg = colors.bg_alt },
    MiniMiscTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    MiniMiscHeader = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    MiniMiscFooter = { fg = colors.comment, italic = true },
    MiniMiscCurrent = { bg = colors.line_highlight, bold = true },
    MiniMiscSelected = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },
    MiniMiscInfo = { fg = colors.diagnostic_info },
    MiniMiscWarn = { fg = colors.diagnostic_warn },
    MiniMiscError = { fg = colors.diagnostic_error },
    MiniMiscHint = { fg = colors.diagnostic_hint },
  }

  return highlights
end

return M