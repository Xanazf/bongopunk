-- Bongopunk Color Utilities
-- Inspired by fluoromachine's color manipulation functions

local M = {}

-- Convert hex color to RGB
local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16),
  }
end

-- Convert RGB to hex
local function rgb_to_hex(rgb)
  return string.format("#%02x%02x%02x", math.floor(rgb.r + 0.5), math.floor(rgb.g + 0.5), math.floor(rgb.b + 0.5))
end

-- Clamp value between 0 and 255
local function clamp(value)
  return math.max(0, math.min(255, value))
end

-- Darken a color by a percentage
function M.darken(color, percentage)
  if not color or not percentage then
    return color
  end

  local rgb = hex_to_rgb(color)
  local factor = 1 - (percentage / 100)

  return rgb_to_hex({
    r = clamp(rgb.r * factor),
    g = clamp(rgb.g * factor),
    b = clamp(rgb.b * factor),
  })
end

-- Lighten a color by a percentage
function M.lighten(color, percentage)
  if not color or not percentage then
    return color
  end

  local rgb = hex_to_rgb(color)
  local factor = percentage / 100

  return rgb_to_hex({
    r = clamp(rgb.r + (255 - rgb.r) * factor),
    g = clamp(rgb.g + (255 - rgb.g) * factor),
    b = clamp(rgb.b + (255 - rgb.b) * factor),
  })
end

-- Blend two colors with alpha
function M.blend(foreground, background, alpha)
  if not foreground or not background or not alpha then
    return foreground
  end

  local fg = hex_to_rgb(foreground)
  local bg = hex_to_rgb(background)

  return rgb_to_hex({
    r = clamp(fg.r * alpha + bg.r * (1 - alpha)),
    g = clamp(fg.g * alpha + bg.g * (1 - alpha)),
    b = clamp(fg.b * alpha + bg.b * (1 - alpha)),
  })
end

-- Shade a color (mix with black)
function M.shade(color, percentage)
  if not color or not percentage then
    return color
  end
  return M.blend(color, "#000000", 1 - (percentage / 100))
end

-- Tint a color (mix with white)
function M.tint(color, percentage)
  if not color or not percentage then
    return color
  end
  return M.blend(color, "#ffffff", 1 - (percentage / 100))
end

-- Adjust brightness of a color
function M.adjust_brightness(color, brightness)
  if not color or not brightness then
    return color
  end

  local rgb = hex_to_rgb(color)
  local factor = 1 + brightness

  return rgb_to_hex({
    r = clamp(rgb.r * factor),
    g = clamp(rgb.g * factor),
    b = clamp(rgb.b * factor),
  })
end

-- Create glow effect for a color
function M.create_glow(color, intensity)
  if not color then
    return color
  end
  intensity = intensity or 0.3

  -- Create a lighter, more saturated version for glow effect
  local rgb = hex_to_rgb(color)
  local max_val = math.max(rgb.r, rgb.g, rgb.b)

  if max_val == 0 then
    return color
  end

  local factor = 255 / max_val * intensity + (1 - intensity)

  return rgb_to_hex({
    r = clamp(rgb.r * factor),
    g = clamp(rgb.g * factor),
    b = clamp(rgb.b * factor),
  })
end

-- Apply transparency to a color
function M.with_alpha(color, alpha)
  if not color then
    return "NONE"
  end
  if alpha >= 1 then
    return color
  end
  if alpha <= 0 then
    return "NONE"
  end

  -- For Neovim, we can't directly apply alpha to hex colors
  -- This function is mainly for conditional transparency
  return color
end

-- Get all color utility functions as a table
function M.get_color_utils()
  return {
    darken = M.darken,
    lighten = M.lighten,
    blend = M.blend,
    shade = M.shade,
    tint = M.tint,
    adjust_brightness = M.adjust_brightness,
    create_glow = M.create_glow,
    with_alpha = M.with_alpha,
  }
end

return M
