-- Bongopunk nvim-notify Highlights
-- Notification highlights

local M = {}

function M.setup(colors, config)
  local highlights = {
    -- Notify Background
    NotifyBackground = { bg = colors.bg },

    -- Notify Error
    NotifyERRORBorder = { fg = colors.diagnostic_error },
    NotifyERRORIcon = { fg = colors.diagnostic_error },
    NotifyERRORTitle = { fg = colors.diagnostic_error, bold = true },
    NotifyERRORBody = { fg = colors.fg, bg = colors.bg_alt },

    -- Notify Warning
    NotifyWARNBorder = { fg = colors.diagnostic_warn },
    NotifyWARNIcon = { fg = colors.diagnostic_warn },
    NotifyWARNTitle = { fg = colors.diagnostic_warn, bold = true },
    NotifyWARNBody = { fg = colors.fg, bg = colors.bg_alt },

    -- Notify Info
    NotifyINFOBorder = { fg = colors.diagnostic_info },
    NotifyINFOIcon = { fg = colors.diagnostic_info },
    NotifyINFOTitle = { fg = colors.diagnostic_info, bold = true },
    NotifyINFOBody = { fg = colors.fg, bg = colors.bg_alt },

    -- Notify Debug
    NotifyDEBUGBorder = { fg = colors.comment },
    NotifyDEBUGIcon = { fg = colors.comment },
    NotifyDEBUGTitle = { fg = colors.comment, bold = true },
    NotifyDEBUGBody = { fg = colors.fg, bg = colors.bg_alt },

    -- Notify Trace
    NotifyTRACEBorder = { fg = colors.diagnostic_hint },
    NotifyTRACEIcon = { fg = colors.diagnostic_hint },
    NotifyTRACETitle = { fg = colors.diagnostic_hint, bold = true },
    NotifyTRACEBody = { fg = colors.fg, bg = colors.bg_alt },

    -- Notify Log Level
    NotifyLogTime = { fg = colors.comment, italic = true },
    NotifyLogTitle = { fg = config.glow and colors.purple_glow or colors.purple, bold = true },
  }

  return highlights
end

return M

