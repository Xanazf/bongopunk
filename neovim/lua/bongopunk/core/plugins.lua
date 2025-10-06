-- Bongopunk Plugin Management System
-- Provides lazy loading, plugin detection, and extensible plugin support

local cache = require("bongopunk.core.cache")

local M = {}

-- Plugin registry
local plugin_registry = {
  -- Core plugins (always loaded)
  core = {
    editor = {
      module = "bongopunk.plugins.editor",
      required = true,
      description = "Basic editor UI elements",
    },
    syntax = {
      module = "bongopunk.plugins.syntax",
      required = true,
      description = "Basic syntax highlighting",
    },
  },

  -- Optional plugins (loaded based on config and detection)
  optional = {
    treesitter = {
      module = "bongopunk.plugins.treesitter",
      detect = function()
        return pcall(require, "nvim-treesitter")
      end,
      description = "Treesitter syntax highlighting",
    },
    lspconfig = {
      module = "bongopunk.plugins.lsp",
      detect = function()
        return vim.lsp ~= nil
      end,
      description = "LSP highlights and diagnostics",
    },
    cmp = {
      module = "bongopunk.plugins.cmp",
      detect = function()
        return pcall(require, "cmp")
      end,
      description = "nvim-cmp completion menu",
    },
    telescope = {
      module = "bongopunk.plugins.telescope",
      detect = function()
        return pcall(require, "telescope")
      end,
      description = "Telescope fuzzy finder",
    },
    gitsigns = {
      module = "bongopunk.plugins.gitsigns",
      detect = function()
        return pcall(require, "gitsigns")
      end,
      description = "Gitsigns git integration",
    },
    neotree = {
      module = "bongopunk.plugins.neotree",
      detect = function()
        return pcall(require, "neo-tree")
      end,
      description = "Neo-tree file explorer",
    },
    notify = {
      module = "bongopunk.plugins.notify",
      detect = function()
        return pcall(require, "notify")
      end,
      description = "nvim-notify notifications",
    },
    snacks = {
      module = "bongopunk.plugins.snacks",
      detect = function()
        return pcall(require, "snacks")
      end,
      description = "Snacks.nvim QoL plugin collection",
    },
    mini = {
      module = "bongopunk.plugins.mini",
      detect = function()
        -- Check for any mini.nvim module
        local mini_modules = {
          "mini.animate", "mini.base16", "mini.bufremove", "mini.clue", "mini.comment",
          "mini.completion", "mini.cursorword", "mini.deps", "mini.diff", "mini.doc",
          "mini.files", "mini.fuzzy", "mini.hipatterns", "mini.indentscope", "mini.jump",
          "mini.jump2d", "mini.map", "mini.move", "mini.notify", "mini.operators",
          "mini.pairs", "mini.pick", "mini.sessions", "mini.splitjoin", "mini.starter",
          "mini.statusline", "mini.surround", "mini.tabline", "mini.test", "mini.trailspace"
        }
        for _, module in ipairs(mini_modules) do
          if pcall(require, module) then
            return true
          end
        end
        return false
      end,
      description = "Mini.nvim collection of independent Lua modules",
    },
    -- Add more plugins as needed
  },
}

-- Cache for plugin detection results
local detection_cache = {}

-- Detect if a plugin is available
local function detect_plugin(plugin_name, plugin_info)
  if detection_cache[plugin_name] ~= nil then
    return detection_cache[plugin_name]
  end

  local detected = false
  if plugin_info.detect and type(plugin_info.detect) == "function" then
    local ok, result = pcall(plugin_info.detect)
    detected = ok and result
  end

  detection_cache[plugin_name] = detected
  return detected
end

-- Load a specific plugin's highlights
local function load_plugin_highlights(plugin_name, plugin_info, colors, config)
  local ok, plugin_module = pcall(require, plugin_info.module)
  if not ok then
    if plugin_info.required then
      vim.notify("Failed to load required plugin: " .. plugin_name, vim.log.levels.ERROR)
    end
    return {}
  end

  if type(plugin_module.setup) ~= "function" then
    vim.notify("Plugin module " .. plugin_name .. " does not have a setup function", vim.log.levels.WARN)
    return {}
  end

  local highlights = plugin_module.setup(colors, config)
  return highlights or {}
end

-- Get list of plugins to load based on config and detection
function M.get_plugins_to_load(config)
  local plugins_to_load = {}

  -- Always load core plugins
  for name, info in pairs(plugin_registry.core) do
    plugins_to_load[name] = info
  end

  -- Load optional plugins based on config and detection
  for name, info in pairs(plugin_registry.optional) do
    local should_load = false

    -- Check if explicitly enabled in config
    if config.plugins and config.plugins[name] == true then
      should_load = true
    elseif config.plugins and config.plugins[name] == false then
      should_load = false
    else
      -- Auto-detect if not explicitly configured
      should_load = detect_plugin(name, info)
    end

    if should_load then
      plugins_to_load[name] = info
    end
  end

  return plugins_to_load
end

-- Load all plugin highlights
function M.load_all_highlights(colors, config)
  -- Check cache first
  local theme_name = config.theme or "antibaryon"
  local cached = cache.get_highlights(theme_name, config)
  if cached then
    return cached
  end

  local all_highlights = {}
  local plugins_to_load = M.get_plugins_to_load(config)

  -- Load highlights from each plugin
  for plugin_name, plugin_info in pairs(plugins_to_load) do
    local highlights = load_plugin_highlights(plugin_name, plugin_info, colors, config)
    all_highlights = vim.tbl_extend("force", all_highlights, highlights)
  end

  -- Apply custom overrides
  if config.overrides then
    local custom_highlights = {}
    if type(config.overrides) == "function" then
      local utils = require("bongopunk.utils")
      local color_utils = utils.get_color_utils()
      custom_highlights = config.overrides(colors, color_utils)
    elseif type(config.overrides) == "table" then
      custom_highlights = config.overrides
    end
    all_highlights = vim.tbl_extend("force", all_highlights, custom_highlights)
  end

  -- Cache the result
  cache.set_highlights(theme_name, config, all_highlights)

  return all_highlights
end

-- Apply highlights to Neovim
function M.apply_highlights(highlights)
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Register a new plugin
function M.register_plugin(plugin_name, plugin_info, category)
  category = category or "optional"

  if not plugin_registry[category] then
    plugin_registry[category] = {}
  end

  plugin_registry[category][plugin_name] = plugin_info

  -- Clear detection cache for this plugin
  detection_cache[plugin_name] = nil

  -- Clear highlights cache since we added a new plugin
  cache.clear("highlights")
end

-- Unregister a plugin
function M.unregister_plugin(plugin_name, category)
  category = category or "optional"

  if plugin_registry[category] and plugin_registry[category][plugin_name] then
    plugin_registry[category][plugin_name] = nil
    detection_cache[plugin_name] = nil
    cache.clear("highlights")
  end
end

-- Get list of available plugins
function M.get_available_plugins()
  local plugins = {}

  for category, category_plugins in pairs(plugin_registry) do
    for name, info in pairs(category_plugins) do
      plugins[name] = {
        category = category,
        module = info.module,
        required = info.required or false,
        detected = detect_plugin(name, info),
        description = info.description or "No description available",
      }
    end
  end

  return plugins
end

-- Get plugin detection status
function M.get_detection_status()
  local status = {}

  for category, category_plugins in pairs(plugin_registry) do
    for name, info in pairs(category_plugins) do
      status[name] = {
        detected = detect_plugin(name, info),
        required = info.required or false,
        category = category,
      }
    end
  end

  return status
end

-- Clear plugin detection cache
function M.clear_detection_cache()
  detection_cache = {}
end

-- Reload a specific plugin's highlights
function M.reload_plugin(plugin_name, colors, config)
  local plugin_info = nil

  -- Find the plugin in registry
  for category, category_plugins in pairs(plugin_registry) do
    if category_plugins[plugin_name] then
      plugin_info = category_plugins[plugin_name]
      break
    end
  end

  if not plugin_info then
    vim.notify("Plugin not found: " .. plugin_name, vim.log.levels.ERROR)
    return {}
  end

  return load_plugin_highlights(plugin_name, plugin_info, colors, config)
end

-- Get plugin statistics
function M.get_stats()
  local stats = {
    total_plugins = 0,
    core_plugins = vim.tbl_count(plugin_registry.core or {}),
    optional_plugins = vim.tbl_count(plugin_registry.optional or {}),
    detected_plugins = 0,
    cache_hits = 0, -- This would need to be tracked separately
  }

  stats.total_plugins = stats.core_plugins + stats.optional_plugins

  -- Count detected plugins
  for category, category_plugins in pairs(plugin_registry) do
    for name, info in pairs(category_plugins) do
      if detect_plugin(name, info) then
        stats.detected_plugins = stats.detected_plugins + 1
      end
    end
  end

  return stats
end

return M
