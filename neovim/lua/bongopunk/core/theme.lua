-- Bongopunk Base Theme System
-- Provides a unified theme implementation that eliminates duplication

local palette = require('bongopunk.core.palette')
local plugins = require('bongopunk.core.plugins')
local cache = require('bongopunk.core.cache')

local M = {}

-- Base theme class
local BaseTheme = {}
BaseTheme.__index = BaseTheme

-- Create a new theme instance
function BaseTheme:new(theme_name, config)
  local instance = {
    name = theme_name,
    config = config or {},
    colors = nil,
    highlights = nil,
    loaded = false,
  }
  setmetatable(instance, self)
  return instance
end

-- Load the theme colors
function BaseTheme:load_colors()
  if self.colors then
    return self.colors
  end
  
  self.colors = palette.create_palette(self.name, self.config)
  return self.colors
end

-- Load the theme highlights
function BaseTheme:load_highlights()
  if self.highlights then
    return self.highlights
  end
  
  -- Ensure colors are loaded first
  local colors = self:load_colors()
  
  -- Load plugin highlights
  self.highlights = plugins.load_all_highlights(colors, self.config)
  
  return self.highlights
end

-- Apply the theme to Neovim
function BaseTheme:apply()
  -- Clear existing highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set background and colorscheme name
  vim.o.background = self.name == 'baryon' and 'light' or 'dark'
  vim.g.colors_name = 'bongopunk-' .. self.name
  
  -- Load and apply highlights
  local highlights = self:load_highlights()
  plugins.apply_highlights(highlights)
  
  -- Set terminal colors
  self:set_terminal_colors()
  
  -- Mark as loaded
  self.loaded = true
  
  -- Emit ColorScheme autocmd
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })
end

-- Set terminal colors
function BaseTheme:set_terminal_colors()
  local colors = self:load_colors()
  
  if vim.g.colors_name then
    vim.g.terminal_color_0 = colors.terminal_black
    vim.g.terminal_color_1 = colors.terminal_red
    vim.g.terminal_color_2 = colors.terminal_green
    vim.g.terminal_color_3 = colors.terminal_yellow
    vim.g.terminal_color_4 = colors.terminal_blue
    vim.g.terminal_color_5 = colors.terminal_magenta
    vim.g.terminal_color_6 = colors.terminal_cyan
    vim.g.terminal_color_7 = colors.terminal_white
    vim.g.terminal_color_8 = colors.terminal_bright_black
    vim.g.terminal_color_9 = colors.terminal_bright_red
    vim.g.terminal_color_10 = colors.terminal_bright_green
    vim.g.terminal_color_11 = colors.terminal_bright_yellow
    vim.g.terminal_color_12 = colors.terminal_bright_blue
    vim.g.terminal_color_13 = colors.terminal_bright_magenta
    vim.g.terminal_color_14 = colors.terminal_bright_cyan
    vim.g.terminal_color_15 = colors.terminal_bright_white
  end
end

-- Get theme data (colors and highlights)
function BaseTheme:get_data()
  return {
    colors = self:load_colors(),
    highlights = self:load_highlights()
  }
end

-- Reload the theme (useful for configuration changes)
function BaseTheme:reload()
  -- Clear cached data
  self.colors = nil
  self.highlights = nil
  self.loaded = false
  
  -- Clear relevant caches
  cache.clear("colors")
  cache.clear("highlights")
  
  -- Reapply the theme
  self:apply()
end

-- Update configuration and reload if necessary
function BaseTheme:update_config(new_config)
  local config_changed = cache.config_changed(new_config)
  self.config = new_config
  
  if config_changed and self.loaded then
    self:reload()
  end
end

-- Check if theme is valid
function BaseTheme:validate()
  local available_themes = palette.get_available_themes()
  if not vim.tbl_contains(available_themes, self.name) then
    return false, "Invalid theme name: " .. self.name
  end
  
  -- Validate base palette
  local base_palette = palette.get_base_palette(self.name)
  local valid, error_msg = palette.validate_palette(base_palette)
  if not valid then
    return false, "Invalid palette: " .. error_msg
  end
  
  return true
end

-- Get theme information
function BaseTheme:get_info()
  return {
    name = self.name,
    loaded = self.loaded,
    background = self.name == 'baryon' and 'light' or 'dark',
    config = self.config,
    colors_loaded = self.colors ~= nil,
    highlights_loaded = self.highlights ~= nil,
  }
end

-- Factory function to create theme instances
function M.create_theme(theme_name, config)
  local theme = BaseTheme:new(theme_name, config)
  
  -- Validate the theme
  local valid, error_msg = theme:validate()
  if not valid then
    error("Failed to create theme: " .. error_msg)
  end
  
  return theme
end

-- Load and apply a theme (convenience function)
function M.load_theme(theme_name, config)
  -- Check cache first
  local cached_theme = cache.get_theme(theme_name, config)
  if cached_theme then
    plugins.apply_highlights(cached_theme.highlights)
    return cached_theme
  end
  
  -- Create and apply new theme
  local theme = M.create_theme(theme_name, config)
  theme:apply()
  
  -- Cache the theme data
  local theme_data = theme:get_data()
  cache.set_theme(theme_name, config, theme_data)
  
  return theme_data
end

-- Get available themes
function M.get_available_themes()
  return palette.get_available_themes()
end

-- Switch between themes
function M.switch_theme(from_theme, to_theme, config)
  if from_theme == to_theme then
    return
  end
  
  -- Clear cache if switching themes
  cache.clear_all()
  
  -- Load the new theme
  return M.load_theme(to_theme, config)
end

-- Reload current theme with new configuration
function M.reload_with_config(theme_name, new_config)
  -- Clear caches
  cache.clear_all()
  
  -- Load theme with new config
  return M.load_theme(theme_name, new_config)
end

-- Get theme statistics
function M.get_stats()
  local cache_stats = cache.stats()
  local plugin_stats = plugins.get_stats()
  
  return {
    available_themes = #M.get_available_themes(),
    cache = cache_stats,
    plugins = plugin_stats,
  }
end

-- Export the BaseTheme class for advanced usage
M.BaseTheme = BaseTheme

return M