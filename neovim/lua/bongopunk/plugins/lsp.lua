-- Bongopunk LSP Highlights
-- Language Server Protocol highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- LSP References
    LspReferenceText = { bg = colors.line_highlight },
    LspReferenceRead = { bg = colors.line_highlight },
    LspReferenceWrite = { bg = colors.line_highlight },

    -- LSP Signature
    LspSignatureActiveParameter = { fg = config.glow and colors.orange_glow or colors.orange, bold = true },

    -- LSP Code Lens
    LspCodeLens = { fg = colors.comment, italic = true },
    LspCodeLensSeparator = { fg = colors.comment },

    -- LSP Inlay Hints
    LspInlayHint = { fg = colors.comment, italic = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.diagnostic_error },
    DiagnosticWarn = { fg = colors.diagnostic_warn },
    DiagnosticInfo = { fg = colors.diagnostic_info },
    DiagnosticHint = { fg = colors.diagnostic_hint },
    DiagnosticOk = { fg = colors.success },

    -- Diagnostic Virtual Text
    DiagnosticVirtualTextError = { fg = colors.diagnostic_error, italic = true },
    DiagnosticVirtualTextWarn = { fg = colors.diagnostic_warn, italic = true },
    DiagnosticVirtualTextInfo = { fg = colors.diagnostic_info, italic = true },
    DiagnosticVirtualTextHint = { fg = colors.diagnostic_hint, italic = true },
    DiagnosticVirtualTextOk = { fg = colors.success, italic = true },

    -- Diagnostic Underline
    DiagnosticUnderlineError = { undercurl = true, sp = colors.diagnostic_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diagnostic_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diagnostic_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.diagnostic_hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = colors.success },

    -- Diagnostic Signs
    DiagnosticSignError = { fg = colors.diagnostic_error },
    DiagnosticSignWarn = { fg = colors.diagnostic_warn },
    DiagnosticSignInfo = { fg = colors.diagnostic_info },
    DiagnosticSignHint = { fg = colors.diagnostic_hint },
    DiagnosticSignOk = { fg = colors.success },

    -- Diagnostic Floating
    DiagnosticFloatingError = { fg = colors.diagnostic_error },
    DiagnosticFloatingWarn = { fg = colors.diagnostic_warn },
    DiagnosticFloatingInfo = { fg = colors.diagnostic_info },
    DiagnosticFloatingHint = { fg = colors.diagnostic_hint },
    DiagnosticFloatingOk = { fg = colors.success },

    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.decorator"] = { fg = config.glow and colors.yellow_glow or colors.yellow },
    ["@lsp.type.enum"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.enumMember"] = { fg = config.glow and colors.orange_glow or colors.orange },
    ["@lsp.type.function"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.interface"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.macro"] = { fg = config.glow and colors.purple_glow or colors.purple },
    ["@lsp.type.method"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.namespace"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.parameter"] = { fg = colors.fg },
    ["@lsp.type.property"] = { fg = colors.fg },
    ["@lsp.type.struct"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.type"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.typeParameter"] = { fg = config.glow and colors.cyan_glow or colors.cyan },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- LSP Modifiers
    ["@lsp.mod.declaration"] = { bold = true },
    ["@lsp.mod.definition"] = { bold = true },
    ["@lsp.mod.readonly"] = { italic = true },
    ["@lsp.mod.static"] = { bold = true },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.abstract"] = { italic = true },
    ["@lsp.mod.async"] = { italic = true },
    ["@lsp.mod.modification"] = { underline = true },
    ["@lsp.mod.documentation"] = { italic = true },
    ["@lsp.mod.defaultLibrary"] = { fg = config.glow and colors.purple_glow or colors.purple },
  }

  return highlights
end

return M

