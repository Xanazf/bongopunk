-- Bongopunk Treesitter Highlights
-- Modern treesitter syntax highlighting

local M = {}

function M.setup(colors, config)
  local styles = config.styles or {}

  local highlights = {
    -- Identifiers
    ["@variable"] = vim.tbl_extend("force", { fg = colors.fg }, styles.variables or {}),
    ["@variable.builtin"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.variables or {}
    ),
    ["@variable.parameter"] = vim.tbl_extend("force", { fg = colors.fg }, styles.parameters or {}),
    ["@variable.member"] = vim.tbl_extend("force", { fg = colors.fg }, styles.variables or {}),

    -- Constants
    ["@constant"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange },
      styles.constants or {}
    ),
    ["@constant.builtin"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.constants or {}
    ),
    ["@constant.macro"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.constants or {}
    ),

    -- Modules
    ["@module"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),
    ["@module.builtin"] = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),

    -- Labels
    ["@label"] = vim.tbl_extend("force", { fg = config.glow and colors.pink_glow or colors.pink }, {}),

    -- Strings
    ["@string"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),
    ["@string.documentation"] = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),
    ["@string.regexp"] = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    ["@string.escape"] = vim.tbl_extend("force", { fg = config.glow and colors.orange_glow or colors.orange }, {}),
    ["@string.special"] = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    ["@string.special.symbol"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),
    ["@string.special.url"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan, underline = true },
      {}
    ),
    ["@string.special.path"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),

    -- Characters
    ["@character"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),
    ["@character.special"] = vim.tbl_extend("force", { fg = config.glow and colors.orange_glow or colors.orange }, {}),

    -- Booleans
    ["@boolean"] = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),

    -- Numbers
    ["@number"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange },
      styles.numbers or {}
    ),
    ["@number.float"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange },
      styles.numbers or {}
    ),

    -- Types
    ["@type"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.types or { italic = true }
    ),
    ["@type.builtin"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.types or { italic = true }
    ),
    ["@type.definition"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.types or {}
    ),

    -- Attributes
    ["@attribute"] = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    ["@attribute.builtin"] = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),

    -- Properties
    ["@property"] = vim.tbl_extend("force", { fg = colors.fg }, {}),

    -- Functions
    ["@function"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or { bold = true }
    ),
    ["@function.builtin"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.functions or { bold = true }
    ),
    ["@function.call"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or {}
    ),
    ["@function.macro"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.functions or {}
    ),
    ["@function.method"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or {}
    ),
    ["@function.method.call"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or {}
    ),

    -- Constructors
    ["@constructor"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan },
      styles.functions or {}
    ),

    -- Operators
    ["@operator"] = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),

    -- Keywords
    ["@keyword"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.coroutine"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.function"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.operator"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.import"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.keywords or {}
    ),
    ["@keyword.type"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.modifier"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or {}
    ),
    ["@keyword.repeat"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.return"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.debug"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.red_glow or colors.red },
      styles.keywords or {}
    ),
    ["@keyword.exception"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.red_glow or colors.red },
      styles.keywords or {}
    ),
    ["@keyword.conditional"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or { bold = true }
    ),
    ["@keyword.conditional.ternary"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.pink_glow or colors.pink },
      styles.keywords or {}
    ),
    ["@keyword.directive"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.keywords or {}
    ),
    ["@keyword.directive.define"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple },
      styles.keywords or {}
    ),

    -- Punctuation
    ["@punctuation.delimiter"] = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),
    ["@punctuation.bracket"] = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),
    ["@punctuation.special"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.yellow_glow or colors.yellow },
      {}
    ),

    -- Comments
    ["@comment"] = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),
    ["@comment.documentation"] = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),
    ["@comment.error"] = vim.tbl_extend("force", { fg = config.glow and colors.red_glow or colors.red }, {}),
    ["@comment.warning"] = vim.tbl_extend("force", { fg = config.glow and colors.yellow_glow or colors.yellow }, {}),
    ["@comment.todo"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
      {}
    ),
    ["@comment.note"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),

    -- Markup
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
      {}
    ),
    ["@markup.heading.1"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.red_glow or colors.red, bold = true },
      {}
    ),
    ["@markup.heading.2"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.orange_glow or colors.orange, bold = true },
      {}
    ),
    ["@markup.heading.3"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.yellow_glow or colors.yellow, bold = true },
      {}
    ),
    ["@markup.heading.4"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.green_glow or colors.green, bold = true },
      {}
    ),
    ["@markup.heading.5"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan, bold = true },
      {}
    ),
    ["@markup.heading.6"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
      {}
    ),
    ["@markup.quote"] = vim.tbl_extend("force", { fg = colors.comment }, styles.comments or { italic = true }),
    ["@markup.math"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),
    ["@markup.link"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan, underline = true },
      {}
    ),
    ["@markup.link.label"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),
    ["@markup.link.url"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.cyan_glow or colors.cyan, underline = true },
      {}
    ),
    ["@markup.raw"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),
    ["@markup.raw.block"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),
    ["@markup.list"] = vim.tbl_extend("force", { fg = config.glow and colors.pink_glow or colors.pink }, {}),
    ["@markup.list.checked"] = vim.tbl_extend("force", { fg = config.glow and colors.green_glow or colors.green }, {}),
    ["@markup.list.unchecked"] = vim.tbl_extend(
      "force",
      { fg = config.glow and colors.yellow_glow or colors.yellow },
      {}
    ),

    -- Diff
    ["@diff.plus"] = vim.tbl_extend("force", { fg = colors.git_add }, {}),
    ["@diff.minus"] = vim.tbl_extend("force", { fg = colors.git_delete }, {}),
    ["@diff.delta"] = vim.tbl_extend("force", { fg = colors.git_change }, {}),

    -- Tags
    ["@tag"] = vim.tbl_extend("force", { fg = config.glow and colors.pink_glow or colors.pink }, {}),
    ["@tag.builtin"] = vim.tbl_extend("force", { fg = config.glow and colors.purple_glow or colors.purple }, {}),
    ["@tag.attribute"] = vim.tbl_extend("force", { fg = config.glow and colors.cyan_glow or colors.cyan }, {}),
    ["@tag.delimiter"] = vim.tbl_extend("force", { fg = colors.fg_alt }, {}),
  }

  return highlights
end

return M

