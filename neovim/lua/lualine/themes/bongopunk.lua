-- Bongopunk Dynamic Lualine Theme
-- Automatically adapts to current theme and configuration

local M = {}

-- Generate lualine theme from bongopunk colors
local function generate_lualine_theme(colors)
  return {
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
end

-- Get current bongopunk colors and generate theme
local function get_current_theme()
  local ok, bongopunk = pcall(require, 'bongopunk')
  if not ok then
    -- Fallback to static antibaryon theme
    return require('lualine.themes.bongopunk-antibaryon')
  end
  
  local colors = bongopunk.get_colors()
  if vim.tbl_isempty(colors) then
    -- Initialize bongopunk with default theme based on background
    local theme_name = vim.o.background == 'light' and 'baryon' or 'antibaryon'
    bongopunk.setup({ theme = theme_name })
    colors = bongopunk.get_colors()
    
    -- If still empty, fallback to static theme
    if vim.tbl_isempty(colors) then
      return require('lualine.themes.bongopunk-' .. theme_name)
    end
  end
  
  return generate_lualine_theme(colors)
end

-- Return the dynamic theme
return get_current_theme()