-- Bongopunk Snacks.nvim Highlights
-- Comprehensive support for folke/snacks.nvim plugin collection

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- ===== SNACKS PICKER =====
    -- Main picker window
    SnacksPicker = { fg = colors.fg, bg = colors.bg_alt },
    SnacksPickerBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksPickerTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksPickerFooter = { fg = colors.comment, bg = colors.bg_alt },
    
    -- Picker input/prompt
    SnacksPickerInput = { fg = colors.fg, bg = colors.bg },
    SnacksPickerPrompt = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    SnacksPickerCursor = { fg = colors.bg, bg = colors.cursor },
    
    -- Picker results
    SnacksPickerNormal = { fg = colors.fg, bg = colors.bg_alt },
    SnacksPickerMatch = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    SnacksPickerCurrent = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksPickerCurrentMatch = { fg = colors.bg, bg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
    
    -- File types in picker
    SnacksPickerFile = { fg = colors.fg },
    SnacksPickerDir = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    SnacksPickerHidden = { fg = colors.comment },
    SnacksPickerExecutable = { fg = config.glow and colors.green_glow or colors.green },
    SnacksPickerSymlink = { fg = config.glow and colors.purple_glow or colors.purple },
    
    -- Picker icons and indicators
    SnacksPickerIcon = { fg = config.glow and colors.orange_glow or colors.orange },
    SnacksPickerIconDir = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksPickerIconFile = { fg = colors.fg_alt },
    SnacksPickerMarked = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },
    
    -- Picker preview
    SnacksPickerPreview = { fg = colors.fg, bg = colors.bg },
    SnacksPickerPreviewBorder = { fg = colors.border, bg = colors.bg },
    SnacksPickerPreviewTitle = { fg = config.glow and colors.green_glow or colors.green, bold = true },
    
    -- ===== SNACKS NOTIFIER =====
    -- Notification window
    SnacksNotifier = { fg = colors.fg, bg = colors.bg_alt },
    SnacksNotifierBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksNotifierTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksNotifierIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksNotifierFooter = { fg = colors.comment, bg = colors.bg_alt },
    
    -- Notification levels
    SnacksNotifierError = { fg = colors.error, bg = colors.bg_alt },
    SnacksNotifierErrorBorder = { fg = colors.error },
    SnacksNotifierErrorIcon = { fg = colors.error },
    SnacksNotifierErrorTitle = { fg = colors.error, bold = true },
    
    SnacksNotifierWarn = { fg = colors.warning, bg = colors.bg_alt },
    SnacksNotifierWarnBorder = { fg = colors.warning },
    SnacksNotifierWarnIcon = { fg = colors.warning },
    SnacksNotifierWarnTitle = { fg = colors.warning, bold = true },
    
    SnacksNotifierInfo = { fg = colors.info, bg = colors.bg_alt },
    SnacksNotifierInfoBorder = { fg = colors.info },
    SnacksNotifierInfoIcon = { fg = colors.info },
    SnacksNotifierInfoTitle = { fg = colors.info, bold = true },
    
    SnacksNotifierDebug = { fg = colors.comment, bg = colors.bg_alt },
    SnacksNotifierDebugBorder = { fg = colors.comment },
    SnacksNotifierDebugIcon = { fg = colors.comment },
    SnacksNotifierDebugTitle = { fg = colors.comment, bold = true },
    
    SnacksNotifierTrace = { fg = colors.fg_alt, bg = colors.bg_alt },
    SnacksNotifierTraceBorder = { fg = colors.fg_alt },
    SnacksNotifierTraceIcon = { fg = colors.fg_alt },
    SnacksNotifierTraceTitle = { fg = colors.fg_alt, bold = true },
    
    -- ===== SNACKS DASHBOARD =====
    SnacksDashboard = { fg = colors.fg, bg = colors.bg },
    SnacksDashboardHeader = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksDashboardFooter = { fg = colors.comment },
    SnacksDashboardIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksDashboardTitle = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },
    SnacksDashboardDesc = { fg = colors.fg_alt },
    SnacksDashboardKey = { fg = config.glow and colors.orange_glow or colors.orange, bold = true },
    SnacksDashboardDir = { fg = config.glow and colors.green_glow or colors.green },
    SnacksDashboardFile = { fg = colors.fg },
    SnacksDashboardRecent = { fg = colors.fg_alt },
    SnacksDashboardProject = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksDashboardMru = { fg = colors.fg_alt },
    SnacksDashboardShortcut = { fg = config.glow and colors.yellow_glow or colors.yellow },
    
    -- ===== SNACKS EXPLORER =====
    SnacksExplorer = { fg = colors.fg, bg = colors.bg_alt },
    SnacksExplorerBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksExplorerTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksExplorerDir = { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
    SnacksExplorerFile = { fg = colors.fg },
    SnacksExplorerHidden = { fg = colors.comment },
    SnacksExplorerSymlink = { fg = config.glow and colors.purple_glow or colors.purple },
    SnacksExplorerExecutable = { fg = config.glow and colors.green_glow or colors.green },
    SnacksExplorerSelected = { fg = colors.bg, bg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksExplorerCursor = { bg = colors.line_highlight },
    SnacksExplorerIcon = { fg = config.glow and colors.orange_glow or colors.orange },
    SnacksExplorerIndent = { fg = colors.comment },
    SnacksExplorerRoot = { fg = config.glow and colors.pink_glow or colors.pink, bold = true },
    
    -- ===== SNACKS INPUT =====
    SnacksInput = { fg = colors.fg, bg = colors.bg_alt },
    SnacksInputBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksInputTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksInputIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksInputPrompt = { fg = config.glow and colors.orange_glow or colors.orange },
    SnacksInputCursor = { fg = colors.bg, bg = colors.cursor },
    SnacksInputSelection = { bg = colors.visual },
    
    -- ===== SNACKS STATUSCOLUMN =====
    SnacksStatusColumn = { fg = colors.comment, bg = colors.bg },
    SnacksStatusColumnNumber = { fg = colors.comment },
    SnacksStatusColumnRelNumber = { fg = colors.fg_alt },
    SnacksStatusColumnCursorNumber = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksStatusColumnSign = { fg = colors.fg_alt, bg = colors.bg },
    SnacksStatusColumnFold = { fg = colors.comment },
    SnacksStatusColumnGit = { fg = config.glow and colors.green_glow or colors.green },
    SnacksStatusColumnDiagnosticError = { fg = colors.error },
    SnacksStatusColumnDiagnosticWarn = { fg = colors.warning },
    SnacksStatusColumnDiagnosticInfo = { fg = colors.info },
    SnacksStatusColumnDiagnosticHint = { fg = colors.hint },
    
    -- ===== SNACKS SCROLL =====
    SnacksScroll = { fg = colors.fg_alt, bg = colors.bg_alt },
    SnacksScrollThumb = { bg = colors.fg_alt },
    SnacksScrollBar = { bg = colors.border },
    
    -- ===== SNACKS INDENT =====
    SnacksIndent = { fg = colors.comment },
    SnacksIndentScope = { fg = config.glow and colors.purple_glow or colors.purple },
    SnacksIndentChunk = { fg = config.glow and colors.cyan_glow or colors.cyan },
    
    -- ===== SNACKS TERMINAL =====
    SnacksTerminal = { fg = colors.fg, bg = colors.bg },
    SnacksTerminalBorder = { fg = colors.border, bg = colors.bg },
    SnacksTerminalTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksTerminalFloat = { fg = colors.fg, bg = colors.bg_alt },
    SnacksTerminalFloatBorder = { fg = colors.border, bg = colors.bg_alt },
    
    -- ===== SNACKS ZEN =====
    SnacksZen = { fg = colors.fg, bg = colors.bg },
    SnacksZenBorder = { fg = colors.border },
    SnacksZenTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    
    -- ===== SNACKS WORDS =====
    SnacksWords = { bg = colors.match_paren },
    SnacksWordsCurrent = { bg = config.glow and colors.yellow_glow or colors.yellow, fg = colors.bg },
    SnacksWordsReference = { bg = colors.visual },
    
    -- ===== SNACKS DIM =====
    SnacksDim = { fg = colors.comment },
    SnacksDimFocus = { fg = colors.fg },
    
    -- ===== SNACKS WIN (Window management) =====
    SnacksWin = { fg = colors.fg, bg = colors.bg_alt },
    SnacksWinBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksWinTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksWinFooter = { fg = colors.comment, bg = colors.bg_alt },
    SnacksWinBar = { fg = colors.fg, bg = colors.bg_alt },
    SnacksWinBarNC = { fg = colors.comment, bg = colors.bg_alt },
    
    -- ===== SNACKS SCRATCH =====
    SnacksScratch = { fg = colors.fg, bg = colors.bg },
    SnacksScratchBorder = { fg = colors.border, bg = colors.bg },
    SnacksScratchTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksScratchKey = { fg = config.glow and colors.orange_glow or colors.orange, bold = true },
    SnacksScratchDesc = { fg = colors.fg_alt },
    
    -- ===== SNACKS LAZYGIT =====
    SnacksLazygit = { fg = colors.fg, bg = colors.bg },
    SnacksLazygitBorder = { fg = colors.border, bg = colors.bg },
    SnacksLazygitTitle = { fg = config.glow and colors.green_glow or colors.green, bold = true },
    
    -- ===== SNACKS RENAME =====
    SnacksRename = { fg = colors.fg, bg = colors.bg_alt },
    SnacksRenameBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksRenameTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksRenameInput = { fg = colors.fg, bg = colors.bg },
    SnacksRenameCursor = { fg = colors.bg, bg = colors.cursor },
    
    -- ===== SNACKS TOGGLE =====
    SnacksToggle = { fg = colors.fg },
    SnacksToggleEnabled = { fg = config.glow and colors.green_glow or colors.green, bold = true },
    SnacksToggleDisabled = { fg = colors.error, bold = true },
    SnacksToggleIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksToggleKey = { fg = config.glow and colors.orange_glow or colors.orange },
    SnacksToggleDesc = { fg = colors.fg_alt },
    
    -- ===== SNACKS SCOPE =====
    SnacksScope = { bg = colors.line_highlight },
    SnacksScopeKey = { fg = config.glow and colors.orange_glow or colors.orange, bold = true },
    SnacksScopeDesc = { fg = colors.fg_alt },
    
    -- ===== SNACKS BIGFILE =====
    SnacksBigFile = { fg = colors.warning, bold = true },
    SnacksBigFileIcon = { fg = colors.warning },
    SnacksBigFileTitle = { fg = colors.warning, bold = true },
    SnacksBigFileDesc = { fg = colors.fg_alt },
    
    -- ===== SNACKS PROFILER =====
    SnacksProfiler = { fg = colors.fg, bg = colors.bg_alt },
    SnacksProfilerBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksProfilerTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksProfilerFunction = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksProfilerTime = { fg = config.glow and colors.yellow_glow or colors.yellow },
    SnacksProfilerCount = { fg = config.glow and colors.orange_glow or colors.orange },
    SnacksProfilerPercent = { fg = config.glow and colors.pink_glow or colors.pink },
    
    -- ===== SNACKS DEBUG =====
    SnacksDebug = { fg = colors.fg, bg = colors.bg_alt },
    SnacksDebugBorder = { fg = colors.border, bg = colors.bg_alt },
    SnacksDebugTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksDebugTrace = { fg = colors.comment },
    SnacksDebugFunction = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksDebugFile = { fg = colors.fg_alt },
    SnacksDebugLine = { fg = config.glow and colors.yellow_glow or colors.yellow },
    
    -- ===== SNACKS QUICKFILE =====
    SnacksQuickFile = { fg = colors.fg, bg = colors.bg },
    SnacksQuickFileIcon = { fg = config.glow and colors.cyan_glow or colors.cyan },
    SnacksQuickFileTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    
    -- ===== SNACKS ANIMATE =====
    SnacksAnimate = { fg = colors.fg },
    SnacksAnimateTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    
    -- ===== SNACKS LAYOUT =====
    SnacksLayout = { fg = colors.fg, bg = colors.bg },
    SnacksLayoutBorder = { fg = colors.border },
    SnacksLayoutTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
    SnacksLayoutBox = { fg = colors.fg, bg = colors.bg_alt },
    SnacksLayoutBoxBorder = { fg = colors.border, bg = colors.bg_alt },
  }

  return highlights
end

return M