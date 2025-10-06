-- Bongopunk Cache System
-- Provides caching for color calculations and theme data to improve performance

local M = {}

-- Cache storage
local cache = {
  colors = {},
  highlights = {},
  themes = {},
  config_hash = nil,
}

-- Generate a hash for configuration to detect changes
local function config_hash(config)
  local str = vim.inspect(config)
  return vim.fn.sha256(str)
end

-- Clear all caches
function M.clear_all()
  cache.colors = {}
  cache.highlights = {}
  cache.themes = {}
  cache.config_hash = nil
end

-- Clear specific cache type
function M.clear(cache_type)
  if cache[cache_type] then
    cache[cache_type] = {}
  end
end

-- Check if configuration has changed
function M.config_changed(config)
  local new_hash = config_hash(config)
  local changed = cache.config_hash ~= new_hash
  cache.config_hash = new_hash
  return changed
end

-- Get cached colors for a theme
function M.get_colors(theme_name, config)
  local key = theme_name .. "_" .. config_hash(config)
  return cache.colors[key]
end

-- Set cached colors for a theme
function M.set_colors(theme_name, config, colors)
  local key = theme_name .. "_" .. config_hash(config)
  cache.colors[key] = colors
end

-- Get cached highlights for a theme
function M.get_highlights(theme_name, config)
  local key = theme_name .. "_" .. config_hash(config)
  return cache.highlights[key]
end

-- Set cached highlights for a theme
function M.set_highlights(theme_name, config, highlights)
  local key = theme_name .. "_" .. config_hash(config)
  cache.highlights[key] = highlights
end

-- Get cached theme data
function M.get_theme(theme_name, config)
  local key = theme_name .. "_" .. config_hash(config)
  return cache.themes[key]
end

-- Set cached theme data
function M.set_theme(theme_name, config, theme_data)
  local key = theme_name .. "_" .. config_hash(config)
  cache.themes[key] = theme_data
end

-- Get cache statistics
function M.stats()
  return {
    colors_cached = vim.tbl_count(cache.colors),
    highlights_cached = vim.tbl_count(cache.highlights),
    themes_cached = vim.tbl_count(cache.themes),
    config_hash = cache.config_hash,
  }
end

-- Cleanup old cache entries (keep only the most recent 5 for each type)
function M.cleanup()
  local function cleanup_cache_type(cache_table, max_entries)
    local keys = vim.tbl_keys(cache_table)
    if #keys > max_entries then
      -- Sort by access time (we'll implement this later if needed)
      -- For now, just keep the most recent entries
      table.sort(keys)
      for i = 1, #keys - max_entries do
        cache_table[keys[i]] = nil
      end
    end
  end

  cleanup_cache_type(cache.colors, 5)
  cleanup_cache_type(cache.highlights, 5)
  cleanup_cache_type(cache.themes, 5)
end

return M

