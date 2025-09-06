-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local key_tables = wezterm.gui.default_key_tables()

--- @generic T
--- @param dst T[]
--- @param ... T[]
--- @return T[]
local function list_extend(dst, ...)
  for _, list in ipairs({ ... }) do
    for _, v in ipairs(list) do
      table.insert(dst, v)
    end
  end
  return dst
end

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_tab_bar = false

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.font = wezterm.font("JetBrains Mono")
-- config.color_scheme = "Bamboo"

config.colors = {
  ansi = {
    "#232627",
    "#ed1515",
    "#11d117",
    "#f67400",
    "#1d9af3",
    "#9b59b6",
    "#1abc9c",
    "#fcfcfc",
  },
  brights = {
    "#7f8c8d",
    "#c0392b",
    "#1cdc9a",
    "#fdbc4b",
    "#3daee9",
    "#8e44ad",
    "#16a085",
    "#ffffff",
  },
  background = "#232627",
  foreground = "#fcfcfc",
  selection_bg = "4e5051",
  scrollbar_thumb = "#ed1515",

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  -- copy_mode_active_highlight_bg = { Color = "#000000" },

  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  -- copy_mode_active_highlight_fg = { AnsiColor = "Black" },
  -- copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
  -- copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

  -- quick_select_label_bg = { Color = "peru" },
  -- quick_select_label_fg = { Color = "#ffffff" },
  -- quick_select_match_bg = { AnsiColor = "Navy" },
  -- quick_select_match_fg = { Color = "#ffffff" },

  -- input_selector_label_bg = { AnsiColor = "Black" }, -- (*Since: Nightly Builds Only*)
  -- input_selector_label_fg = { Color = "#ffffff" }, -- (*Since: Nightly Builds Only*)

  -- launcher_label_bg = { AnsiColor = "Black" }, -- (*Since: Nightly Builds Only*)
  -- launcher_label_fg = { Color = "#ffffff" }, -- (*Since: Nightly Builds Only*)
}

--------------- ScrollBar ---------------
config.enable_scroll_bar = true
config.scrollback_lines = 3500

--------------- Search mode ---------------
list_extend(key_tables.search_mode, {
  { key = "w", mods = "CTRL", action = act.CopyMode("ClearPattern") },
  { key = "y", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
})

--------------- Copy mode ---------------
list_extend(key_tables.copy_mode, {})

config.keys = {
  -- action = ,
  -- { key = "/", mods = "CTRL", action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "/", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "Insert", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
  { key = "Insert", mods = "SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

config.key_tables = key_tables
return config
