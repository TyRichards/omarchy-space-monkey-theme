-- Space Monkey's Omarchy 3 compositor styling, ported to Hyprland 0.55+ Lua.

local active_border_color = "rgba(a89984de)"
local inactive_border_color = "rgba(a8998480)"

hl.config({
  general = {
    layout = "dwindle",
    gaps_in = 8,
    gaps_out = 18,
    border_size = 2,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 10,
    dim_special = 0.0,
    shadow = {
      enabled = true,
      range = 12,
      render_power = 2,
      color = "rgba(1a1a1aa6)",
    },
    blur = {
      enabled = true,
      size = 2,
      passes = 3,
      new_optimizations = true,
      xray = false,
      contrast = 0.7,
      brightness = 0.5,
      noise = 0.3,
      vibrancy = 0.8,
      vibrancy_darkness = 0.0,
      special = true,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.curve("space-monkey-wind", {
  type = "bezier",
  points = { { 0.02, 0.9 }, { 0.1, 1.03 } },
})
hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "space-monkey-wind", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "space-monkey-wind", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "space-monkey-wind" })

hl.window_rule({
  match = { class = ".*" },
  tag = "-default-opacity",
  opacity = "1 override 1 override",
})
