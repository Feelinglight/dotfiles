return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        -- enabled = vim.g.ai_cmp,
        enabled = false,
      },
      menu = {
        draw = {
          columns = {
            {
              "kind_icon",
              "label",
              "label_description",
              gap = 1,
            },
            { "kind", "source_name" },
          },
        },
      },
    },

    sources = {
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = {
      enabled = true,
      keymap = {
        preset = "inherit",
      },
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = true,
            auto_insert = false,
          },
        },
        menu = { auto_show = true },
        ghost_text = { enabled = false },
      },
    },

    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
      ["<C-j>"] = { "select_next", "fallback" },
      -- close menu and not leave Insert mode
      ["<C-x>"] = { "hide", "fallback" },
    },
  },
}
