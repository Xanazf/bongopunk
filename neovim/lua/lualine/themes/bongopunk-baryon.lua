-- Bongopunk Baryon Lualine Theme
-- Light synthwave theme for lualine
-- Now uses the dynamic palette system

local palette = require('bongopunk.core.palette')

-- Get baryon colors with default config
local colors = palette.create_palette('baryon', { glow = true })

local bongopunk_baryon = {
  normal = {
    a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    b = { fg = colors.cyan, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
    b = { fg = colors.purple, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.red, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.yellow, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  inactive = {
    a = { fg = colors.comment, bg = colors.bg_alt },
    b = { fg = colors.comment, bg = colors.bg_alt },
    c = { fg = colors.comment, bg = colors.bg_dark },
  },
}

return bongopunk_baryon