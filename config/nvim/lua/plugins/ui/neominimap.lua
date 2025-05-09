---@module "neominimap.config.meta"
return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  event = "BufReadPost",
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    vim.g.neominimap = {
      auto_enable = true,

      float = {
        minimap_width = 15,
      },
      search = {
        enabled = true,
        mode = "icon",
      },
      mark = {
        enabled = true,
      },
    }
  end,
  config = function()
    local minimap_enabled = true
    Snacks.toggle
      .new({
        id = "minimap",
        name = "minimap",
        get = function()
          return minimap_enabled
        end,
        set = function()
          vim.cmd("Neominimap Toggle")
          minimap_enabled = not minimap_enabled
        end,
      })
      :map("<Space>um")
  end,
}
