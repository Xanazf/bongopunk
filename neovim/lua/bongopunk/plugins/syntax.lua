-- Bongopunk Syntax Highlights
-- Basic syntax highlighting groups

local M = {}

function M.setup(colors, config)
  local styles = config.styles or {}

  local highlights = {
    -- Comments
    Comment = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),

    -- Constants
    Constant = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange },
      styles.constants or {}
    ),
    String = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.green_glow or colors.green },
      styles.constants or {}
    ),
    Character = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.green_glow or colors.green },
      styles.constants or {}
    ),
    Number = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange },
      styles.numbers or {}
    ),
    Boolean = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.constants or {}
    ),
    Float = vim.tbl_extend("force", { fg = config.glow and colors.orange_glow or colors.orange }, styles.numbers or {}),

    -- Identifiers
    Identifier = vim.tbl_extend("force", { fg = colors.fg }, styles.variables or {}),
    Function = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or { bold = true }
    ),

    -- Statements
    Statement = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    Conditional = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    Repeat = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    Label = vim.tbl_extend("force", { fg = config.glow and colors.pink_glow or colors.pink }, styles.keywords or {}),
    Operator = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),
    Keyword = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    Exception = vim.tbl_extend("force", { fg = config.glow and colors.red_glow or colors.red }, styles.keywords or {}),

    -- PreProcessor
    PreProc = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),
    Include = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),
    Define = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),
    Macro = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),
    PreCondit = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),

    -- Types
    Type = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.types or { italic = true }
    ),
    StorageClass = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    Structure = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, styles.types or {}),
    Typedef = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, styles.types or {}),

    -- Special
    Special = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    SpecialChar = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    Tag = vim.tbl_extend("force", { fg = config.glow and colors.pink_glow or colors.pink }, {}),
    Delimiter = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),
    SpecialComment = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),
    Debug = vim.tbl_extend("force", { fg = config.glow and colors.red_glow or colors.red }, {}),

    -- Underlined
    Underlined = { fg = config.glow and colors.cyan_glow or colors.cyan, underline = true },

    -- Ignore
    Ignore = { fg = colors.comment },

    -- Error
    Error = { fg = config.glow and colors.red_glow or colors.red, bold = true },

    -- Todo
    Todo = { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
  }

  return highlights
end

return M

