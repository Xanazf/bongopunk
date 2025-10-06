-- Bongopunk Color Palette System
-- Provides a unified system for managing color palettes and generating variants

local utils = require("bongopunk.utils")
local cache = require("bongopunk.core.cache")

local M = {}

-- Base color definitions for themes
local base_palettes = {
  antibaryon = {
    -- Base colors
    bg = "#090318",
    fg = "#8BA7A7",
    bg_alt = "#070216",
    bg_dark = "#050114",
    fg_alt = "#495495",

    -- Accent colors
    cyan = "#61E2FF",
    green = "#72F1B8",
    orange = "#FF8B39",
    pink = "#FC199A",
    purple = "#AF6DF9",
    red = "#FE4450",
    yellow = "#FFCC00",

    -- UI colors
    border = "#61E2FF",
    border_alt = "#4A6B7C",
    cursor = "#8BA7A7",
    comment = "#495495",
  },

  baryon = {
    -- Base colors
    bg = "#FAFAFA",
    fg = "#2D2D2D",
    bg_alt = "#F5F5F5",
    bg_dark = "#F0F0F0",
    fg_alt = "#6B7280",

    -- Accent colors
    cyan = "#0891b2",
    green = "#059669",
    orange = "#EA580C",
    pink = "#BE185D",
    purple = "#7C3AED",
    red = "#DC2626",
    yellow = "#D97706",

    -- UI colors
    border = "#0891b2",
    border_alt = "#D1D5DB",
    comment = "#9CA3AF",
    cursor = "#2D2D2D",
  },
}

-- Generate color variants (muted, bright, glow, etc.)
local function generate_variants(base_colors, config)
  local colors = vim.deepcopy(base_colors)
  local theme_type = config.theme

  -- Generate muted variants
  local accent_colors = { "cyan", "green", "orange", "pink", "purple", "red", "yellow" }
  for _, color in ipairs(accent_colors) do
    if colors[color] then
      colors[color .. "_muted"] = utils.darken(colors[color], 20)
    end
  end

  -- Generate bright variants for light theme
  if theme_type == "baryon" then
    for _, color in ipairs(accent_colors) do
      if colors[color] then
        colors[color .. "_bright"] = utils.lighten(colors[color], 15)
      end
    end
  end

  -- Generate glow variants if enabled
  if config.glow then
    local glow_intensity = theme_type == "baryon" and 0.2 or 0.4
    for _, color in ipairs(accent_colors) do
      if colors[color] then
        colors[color .. "_glow"] = utils.create_glow(colors[color], glow_intensity)
      end
    end
  end

  return colors
end

-- Generate derived colors (selection, highlights, etc.)
local function generate_derived_colors(colors, config)
  local theme_type = config.theme

  -- Selection and highlights
  colors.selection = theme_type == "baryon" and "#E5E7EB" or "#2D4A5C"
  colors.line_highlight = theme_type == "baryon" and "#F3F4F6" or "#2D4A5C"
  colors.visual = colors.selection
  colors.search = theme_type == "baryon" and "#FEF3C7" or "#4A6B7C"
  colors.match_paren = theme_type == "baryon" and "#DBEAFE" or "#4A6B7C"

  -- Status colors
  colors.warning = colors.yellow
  colors.error = colors.red
  colors.info = colors.cyan
  colors.success = colors.green

  -- Diff colors
  if theme_type == "baryon" then
    colors.diff_add = "#D1FAE5"
    colors.diff_delete = "#FEE2E2"
    colors.diff_change = "#FEF3C7"
    colors.diff_text = "#FDE68A"
  else
    colors.diff_add = "#2D5A3D"
    colors.diff_delete = "#5A2D2D"
    colors.diff_change = "#5A5A2D"
    colors.diff_text = "#6B6B2D"
  end

  -- Git colors
  colors.git_add = colors.green
  colors.git_change = colors.yellow
  colors.git_delete = colors.red

  -- Diagnostic colors
  colors.diagnostic_error = colors.red
  colors.diagnostic_warn = colors.yellow
  colors.diagnostic_info = colors.cyan
  colors.diagnostic_hint = colors.purple

  return colors
end

-- Generate terminal colors
local function generate_terminal_colors(colors, config)
  local theme_type = config.theme

  if theme_type == "baryon" then
    colors.terminal_black = "#2D2D2D"
    colors.terminal_red = colors.red
    colors.terminal_green = colors.green
    colors.terminal_yellow = colors.yellow
    colors.terminal_blue = colors.cyan
    colors.terminal_magenta = colors.pink
    colors.terminal_cyan = colors.cyan
    colors.terminal_white = "#6B7280"
    colors.terminal_bright_black = "#4B5563"
    colors.terminal_bright_red = colors.red_bright or utils.lighten(colors.red, 10)
    colors.terminal_bright_green = colors.green_bright or utils.lighten(colors.green, 10)
    colors.terminal_bright_yellow = colors.yellow_bright or utils.lighten(colors.yellow, 10)
    colors.terminal_bright_blue = colors.cyan_bright or utils.lighten(colors.cyan, 10)
    colors.terminal_bright_magenta = colors.pink_bright or utils.lighten(colors.pink, 10)
    colors.terminal_bright_cyan = colors.cyan_bright or utils.lighten(colors.cyan, 10)
    colors.terminal_bright_white = "#1F2937"
  else
    colors.terminal_black = colors.bg
    colors.terminal_red = colors.red
    colors.terminal_green = colors.green
    colors.terminal_yellow = colors.yellow
    colors.terminal_blue = colors.cyan
    colors.terminal_magenta = colors.pink
    colors.terminal_cyan = colors.cyan
    colors.terminal_white = colors.fg
    colors.terminal_bright_black = colors.comment
    colors.terminal_bright_red = utils.lighten(colors.red, 15)
    colors.terminal_bright_green = utils.lighten(colors.green, 15)
    colors.terminal_bright_yellow = utils.lighten(colors.yellow, 15)
    colors.terminal_bright_blue = utils.lighten(colors.cyan, 15)
    colors.terminal_bright_magenta = utils.lighten(colors.pink, 15)
    colors.terminal_bright_cyan = utils.lighten(colors.cyan, 15)
    colors.terminal_bright_white = utils.lighten(colors.fg, 15)
  end

  return colors
end

-- Create a complete color palette for a theme
function M.create_palette(theme_name, config)
  -- Check cache first
  local cached = cache.get_colors(theme_name, config)
  if cached then
    return cached
  end

  -- Get base palette
  local base_palette = base_palettes[theme_name]
  if not base_palette then
    error("Unknown theme: " .. theme_name)
  end

  -- Start with base colors
  local colors = vim.deepcopy(base_palette)

  -- Apply brightness adjustment
  if config.brightness and config.brightness ~= 0 then
    for key, color in pairs(colors) do
      if type(color) == "string" and color:match("^#") then
        colors[key] = utils.adjust_brightness(color, config.brightness)
      end
    end
  end

  -- Apply custom color overrides
  if config.colors and type(config.colors) == "table" then
    colors = vim.tbl_deep_extend("force", colors, config.colors)
  end

  -- Generate variants
  colors = generate_variants(colors, config)

  -- Generate derived colors
  colors = generate_derived_colors(colors, config)

  -- Generate terminal colors
  colors = generate_terminal_colors(colors, config)

  -- Apply transparency
  if config.transparent then
    colors.bg = "NONE"
    colors.bg_alt = "NONE"
    colors.bg_dark = "NONE"
  end

  -- Cache the result
  cache.set_colors(theme_name, config, colors)

  return colors
end

-- Get available theme names
function M.get_available_themes()
  return vim.tbl_keys(base_palettes)
end

-- Add a new theme palette
function M.add_theme(theme_name, palette)
  base_palettes[theme_name] = palette
  cache.clear("colors") -- Clear cache since we added a new theme
end

-- Get base palette for a theme (without processing)
function M.get_base_palette(theme_name)
  return vim.deepcopy(base_palettes[theme_name])
end

-- Validate a color palette
function M.validate_palette(palette)
  local required_colors = {
    "bg",
    "fg",
    "bg_alt",
    "fg_alt",
    "cyan",
    "green",
    "orange",
    "pink",
    "purple",
    "red",
    "yellow",
    "border",
    "comment",
  }

  for _, color in ipairs(required_colors) do
    if not palette[color] then
      return false, "Missing required color: " .. color
    end
    if type(palette[color]) ~= "string" or not palette[color]:match("^#%x%x%x%x%x%x$") then
      return false, "Invalid color format for: " .. color
    end
  end

  return true
end

return M
