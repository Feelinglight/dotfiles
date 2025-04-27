return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },

    close_if_last_window = true,

    window = {
      mappings = {
        ["z"] = "close_all_subnodes",
      },
    },

    filesystem = {
      -- bind_to_cwd = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
      },
      use_libuv_file_watcher = true,
    },
    git_status = {
      window = {
        position = "right",
        width = "30%",
      },
    },
    buffers = {
      window = {
        position = "right",
        width = "30%",
      },
    },
    document_symbols = {
      window = {
        position = "right",
        width = "30%",
      },
    },
  },
  keys = {
    {
      "<leader>se",
      function()
        require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
      end,
      desc = "Document symbols explorer",
    },
    {
      "<leader>re",
      function()
        require("neo-tree.command").execute({
          reveal_force_cwd = true,
        })
      end,
      desc = "Reveal current buffer in Neotree",
    },
  },
}
