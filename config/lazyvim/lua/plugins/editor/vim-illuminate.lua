return {
  "RRethy/vim-illuminate",
  lazy = false,
  opts = function(_, opts)
    local overload_opts = {
      providers = {
        "regex",
      },
      under_cursor = false,
      delay = 100,
    }

    local function toggle_illuminate_provider()
      if overload_opts["providers"][1] == "regex" then
        overload_opts["providers"] = {
          "lsp",
          "treesitter",
        }
        vim.notify("Set lsp/treesitter vim-illuminate provider")
      else
        overload_opts["providers"] = {
          "regex",
        }
        vim.notify("Set regex vim-illuminate provider")
      end

      require("illuminate").configure(overload_opts)
    end

    vim.keymap.set("n", "<leader>il", toggle_illuminate_provider, { desc = "Toggle Illuminate Provider" })

    return require("lazy.core.util").merge(opts, overload_opts)
  end,
}
