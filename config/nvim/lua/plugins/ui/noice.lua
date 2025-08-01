return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
    },
    -- Роутер для отображения stdout и stderr комманд, вводимых через !
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = { "shell_out", "shell_err" },
        },
        view = "notify",
        -- view = "split",
        opts = {
          level = "info",
          skip = false,
          replace = false,
          -- enter = true,
        },
      },
    },
  },
}
