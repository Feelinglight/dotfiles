return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      diagnostics = {
        virtual_text = {
          source = true,
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          prefix = "icons",
        },
      },
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = false,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
    },
  },
}
