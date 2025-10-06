-- Bongopunk GitSigns Highlights
-- Git integration highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- GitSigns
    GitSignsAdd = { fg = colors.git_add },
    GitSignsChange = { fg = colors.git_change },
    GitSignsDelete = { fg = colors.git_delete },
    GitSignsAddNr = { fg = colors.git_add },
    GitSignsChangeNr = { fg = colors.git_change },
    GitSignsDeleteNr = { fg = colors.git_delete },
    GitSignsAddLn = { bg = colors.diff_add },
    GitSignsChangeLn = { bg = colors.diff_change },
    GitSignsDeleteLn = { bg = colors.diff_delete },

    -- GitSigns Current Line Blame
    GitSignsCurrentLineBlame = { fg = colors.comment, italic = true },

    -- GitSigns Inline
    GitSignsAddInline = { bg = colors.diff_add },
    GitSignsChangeInline = { bg = colors.diff_change },
    GitSignsDeleteInline = { bg = colors.diff_delete },

    -- GitSigns Word Diff
    GitSignsAddLnInline = { bg = colors.diff_add },
    GitSignsChangeLnInline = { bg = colors.diff_change },
    GitSignsDeleteLnInline = { bg = colors.diff_delete },
  }

  return highlights
end

return M

