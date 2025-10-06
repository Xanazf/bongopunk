-- Bongopunk Neovim Theme
-- Synthwave-inspired colorscheme with enhanced architecture
-- Refactored for better maintainability, performance, and extensibility

local config_module = require("bongopunk.config")
local theme_core = require("bongopunk.core.theme")
local cache = require("bongopunk.core.cache")
local utils = require("bongopunk.utils")

local M = {}

-- Store the current state
M._config = nil
M._current_theme = nil
M._initialized = false

-- Setup function - main entry point
function M.setup(user_config)
  user_config = user_config or {}

  -- Setup configuration with validation and migration
  M._config = config_module.setup(user_config)

  -- Initialize cache if enabled
  if M._config.performance.cache_enabled then
    -- Cache is already initialized, just clear if config changed
    if cache.config_changed(M._config) then
      cache.clear_all()
    end
  else
    -- Disable cache
    cache.clear_all()
  end

  M._initialized = true

  -- Don't apply the theme immediately, just store the config
  -- The theme will be applied when colorscheme is set or load() is called
end

-- Load and apply the theme
function M.load()
  if not M._initialized then
    -- If setup wasn't called, use defaults
    M.setup()
  end

  -- Load the theme using the new core system
  M._theme_data = theme_core.load_theme(M._config.theme, M._config)

  return M._theme_data
end

-- Get current colors (useful for statusline themes, etc.)
function M.get_colors()
  if not M._theme_data then
    -- Lazy load if not already loaded
    M.load()
  end
  return M._theme_data and M._theme_data.colors or {}
end

-- Get current configuration
function M.get_config()
  return M._config or {}
end

-- Update configuration at runtime
function M.update_config(updates)
  if not M._config then
    M.setup()
  end

  local new_config, success = config_module.update(M._config, updates)
  if success then
    M._config = new_config

    -- Reload theme with new configuration
    M._theme_data = theme_core.reload_with_config(M._config.theme, M._config)

    return true
  end

  return false
end

-- Switch theme variant
function M.switch_theme(theme_name)
  local available_themes = theme_core.get_available_themes()
  if not vim.tbl_contains(available_themes, theme_name) then
    vim.notify(
      "Invalid theme name '" .. theme_name .. "'. Available: " .. table.concat(available_themes, ", "),
      vim.log.levels.ERROR
    )
    return false
  end

  if not M._config then
    M.setup()
  end

  local old_theme = M._config.theme
  M._config.theme = theme_name

  -- Switch theme using core system
  M._theme_data = theme_core.switch_theme(old_theme, theme_name, M._config)

  return true
end

-- Toggle between light and dark themes
function M.toggle()
  if not M._config then
    M.setup()
  end

  local new_theme = M._config.theme == "antibaryon" and "baryon" or "antibaryon"
  return M.switch_theme(new_theme)
end

-- Get available themes
function M.get_available_themes()
  return theme_core.get_available_themes()
end

-- Get theme information
function M.get_theme_info()
  if not M._config then
    return { error = "Not initialized" }
  end

  return {
    current_theme = M._config.theme,
    available_themes = M.get_available_themes(),
    loaded = M._theme_data ~= nil,
    config_version = M._config.version,
    cache_enabled = M._config.performance.cache_enabled,
  }
end

-- Get plugin information
function M.get_plugin_info()
  local plugins = require("bongopunk.core.plugins")
  return {
    available = plugins.get_available_plugins(),
    detection_status = plugins.get_detection_status(),
    stats = plugins.get_stats(),
  }
end

-- Get performance statistics
function M.get_stats()
  return theme_core.get_stats()
end

-- Clear all caches
function M.clear_cache()
  cache.clear_all()
  vim.notify("Bongopunk cache cleared", vim.log.levels.INFO)
end

-- Reload current theme (useful for development)
function M.reload()
  if not M._config then
    vim.notify("Bongopunk not initialized", vim.log.levels.WARN)
    return false
  end

  -- Clear caches and reload
  cache.clear_all()
  M._theme_data = theme_core.reload_with_config(M._config.theme, M._config)

  vim.notify("Bongopunk theme reloaded", vim.log.levels.INFO)
  return true
end

-- Advanced API for theme customization
function M.create_custom_theme(theme_name, base_theme, customizations)
  local palette = require("bongopunk.core.palette")

  -- Get base palette
  local base_palette = palette.get_base_palette(base_theme)
  if not base_palette then
    error("Invalid base theme: " .. base_theme)
  end

  -- Apply customizations
  local custom_palette = vim.tbl_deep_extend("force", base_palette, customizations)

  -- Validate the custom palette
  local valid, error_msg = palette.validate_palette(custom_palette)
  if not valid then
    error("Invalid custom palette: " .. error_msg)
  end

  -- Add the custom theme
  palette.add_theme(theme_name, custom_palette)

  vim.notify("Custom theme '" .. theme_name .. "' created", vim.log.levels.INFO)
end

-- Export utility functions
M.utils = utils.get_color_utils()

-- Version and metadata
M.version = "2.0.0"
M.name = "bongopunk"
M.schema_version = config_module.schema_version

-- Health check function
function M.health()
  local health = {
    initialized = M._initialized,
    config_valid = M._config ~= nil,
    theme_loaded = M._theme_data ~= nil,
    cache_enabled = M._config and M._config.performance.cache_enabled or false,
    errors = {},
    warnings = {},
  }

  -- Check for common issues
  if not M._initialized then
    table.insert(health.warnings, "Bongopunk not initialized. Call setup() first.")
  end

  if M._config and not config_module.has_valid_version(M._config) then
    table.insert(health.warnings, "Configuration version mismatch. Expected v" .. config_module.schema_version)
  end

  -- Add plugin detection info
  if M._initialized then
    health.plugins = M.get_plugin_info()
    health.stats = M.get_stats()
  end

  return health
end

return M

