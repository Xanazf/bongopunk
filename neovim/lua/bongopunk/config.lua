-- Bongopunk Enhanced Configuration System
-- Provides validation, migration, and runtime updates

local palette = require("bongopunk.core.palette")

local M = {}

-- Configuration schema version for migration
M.schema_version = "0.1.0"

-- Default configuration
M.defaults = {
  -- Schema version
  version = M.schema_version,

  -- Theme variant: 'antibaryon' (dark) or 'baryon' (light)
  theme = "antibaryon",

  -- Brightness adjustment (-1.0 to 1.0)
  brightness = 0.0,

  -- Enable glow effect
  glow = true,

  -- Transparent background
  transparent = false,

  -- Performance settings
  performance = {
    cache_enabled = true,
    lazy_loading = true,
    plugin_detection = true,
  },

  -- Style customization for different syntax elements
  styles = {
    comments = { italic = true },
    functions = { bold = true },
    variables = {},
    numbers = {},
    constants = {},
    parameters = {},
    keywords = { bold = true },
    types = { italic = true },
  },

  -- Custom color overrides
  colors = {},

  -- Custom highlight group overrides
  overrides = {},

  -- Plugin support configuration
  -- Set to true/false to force enable/disable, or nil for auto-detection
  plugins = {
    -- Core plugins (always enabled)
    editor = true,
    syntax = true,

    -- Optional plugins (auto-detected by default)
    treesitter = nil,
    lspconfig = nil,
    cmp = nil,
    telescope = nil,
    gitsigns = nil,
    neotree = nil,
    notify = nil,
    snacks = nil,

    -- Additional plugins (auto-detected by default)
    bufferline = nil,
    dashboard = nil,
    hop = nil,
    ibl = nil,
    illuminate = nil,
    lazy = nil,
    mini = nil,
    navic = nil,
    neogit = nil,
    noice = nil,
    tree = nil,
    whichkey = nil,
  },
}

-- Configuration validation rules
local validation_rules = {
  theme = {
    type = "string",
    validate = function(value)
      local available = palette.get_available_themes()
      return vim.tbl_contains(available, value), "Invalid theme. Available: " .. table.concat(available, ", ")
    end,
  },
  brightness = {
    type = "number",
    validate = function(value)
      return value >= -1.0 and value <= 1.0, "Brightness must be between -1.0 and 1.0"
    end,
  },
  glow = {
    type = "boolean",
  },
  transparent = {
    type = "boolean",
  },
  performance = {
    type = "table",
    fields = {
      cache_enabled = { type = "boolean" },
      lazy_loading = { type = "boolean" },
      plugin_detection = { type = "boolean" },
    },
  },
  styles = {
    type = "table",
    validate = function(value)
      local valid_style_keys = { "italic", "bold", "underline", "undercurl", "strikethrough" }
      for category, styles in pairs(value) do
        if type(styles) == "table" then
          for key, _ in pairs(styles) do
            if not vim.tbl_contains(valid_style_keys, key) then
              return false, "Invalid style key '" .. key .. "' in category '" .. category .. "'"
            end
          end
        end
      end
      return true
    end,
  },
  colors = {
    type = "table",
    validate = function(value)
      for key, color in pairs(value) do
        if type(color) == "string" and color ~= "NONE" and not color:match("^#%x%x%x%x%x%x$") then
          return false, "Invalid color format for '" .. key .. "': " .. color
        end
      end
      return true
    end,
  },
  overrides = {
    type = { "table", "function" },
  },
  plugins = {
    type = "table",
  },
}

-- Validate a configuration value
local function validate_config_field(key, value, rule)
  -- Check type
  if rule.type then
    local expected_types = type(rule.type) == "table" and rule.type or { rule.type }
    local value_type = type(value)
    if not vim.tbl_contains(expected_types, value_type) then
      return false, "Expected " .. table.concat(expected_types, " or ") .. ", got " .. value_type
    end
  end

  -- Check custom validation
  if rule.validate and type(rule.validate) == "function" then
    local valid, error_msg = rule.validate(value)
    if not valid then
      return false, error_msg
    end
  end

  -- Check nested fields for tables
  if rule.fields and type(value) == "table" then
    for field_key, field_rule in pairs(rule.fields) do
      if value[field_key] ~= nil then
        local valid, error_msg = validate_config_field(field_key, value[field_key], field_rule)
        if not valid then
          return false, "Field '" .. field_key .. "': " .. error_msg
        end
      end
    end
  end

  return true
end

-- Validate entire configuration
local function validate_config(config)
  local errors = {}

  for key, rule in pairs(validation_rules) do
    if config[key] ~= nil then
      local valid, error_msg = validate_config_field(key, config[key], rule)
      if not valid then
        table.insert(errors, "Config field '" .. key .. "': " .. error_msg)
      end
    end
  end

  return #errors == 0, errors
end

-- Ensure configuration has required version
local function ensure_version(config)
  if not config.version then
    config.version = M.schema_version
  end

  return config
end

-- Apply configuration fixes
local function fix_config(config)
  -- Clamp brightness
  if config.brightness then
    config.brightness = math.max(-1.0, math.min(1.0, config.brightness))
  end

  -- Ensure core plugins are enabled
  if config.plugins then
    config.plugins.editor = true
    config.plugins.syntax = true
  end

  return config
end

-- Setup configuration with validation and migration
function M.setup(user_config)
  user_config = user_config or {}

  -- Ensure configuration has version
  user_config = ensure_version(user_config)

  -- Merge with defaults
  local config = vim.tbl_deep_extend("force", M.defaults, user_config)

  -- Apply fixes
  config = fix_config(config)

  -- Validate configuration
  local valid, errors = validate_config(config)
  if not valid then
    vim.notify("Bongopunk configuration errors:\n" .. table.concat(errors, "\n"), vim.log.levels.ERROR)
    -- Use defaults for invalid configuration
    config = vim.tbl_deep_extend("force", M.defaults, {})
  end

  return config
end

-- Update configuration at runtime
function M.update(current_config, updates)
  local new_config = vim.tbl_deep_extend("force", current_config, updates)

  -- Validate the updated configuration
  local valid, errors = validate_config(new_config)
  if not valid then
    vim.notify("Configuration update failed:\n" .. table.concat(errors, "\n"), vim.log.levels.ERROR)
    return current_config, false
  end

  return fix_config(new_config), true
end

-- Get configuration schema for documentation/tooling
function M.get_schema()
  return {
    version = M.schema_version,
    defaults = M.defaults,
    validation_rules = validation_rules,
  }
end

-- Check if configuration has valid version
function M.has_valid_version(config)
  return config.version and config.version == M.schema_version
end

return M
