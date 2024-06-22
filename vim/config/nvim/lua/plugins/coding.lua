return {

   -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
      {
        "tzachar/cmp-fuzzy-path",
        dependencies = {
          "tzachar/fuzzy.nvim",
        },
      },
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          documentation = cmp.config.disable
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Скролл больших блоков документации в hover-ах
          -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<tab>"] = cmp.mapping.confirm({ select = true }),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<s-tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        }),
        sources = cmp.config.sources(
          {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            -- { name = "path" },
            {
              name = "fuzzy_path",
              option  = {
                -- Если поставить большую глубину, то будет очень долго искать
                fd_cmd = {'fdfind', '-d', '3', '-p'},
              }
            },
          },

          {
            {
              name = "buffer",
              option = {
                -- Дефолтная регулярка, но \h и \w заменены на аналоги с добавлением а-яА-Я для
                -- поддержки русских слов
                keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|[a-zA-Zа-яА-Я_][a-zA-Zа-яА-Я0-9_]*\%([\-.][a-zA-Zа-яА-Я0-9_]*\)*\)]]
              }
            },
          }
        ),

        formatting = {
          format = function(_, item)
            local icons = require("config").defaults.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        performance = {
          -- max_view_entries = 15,
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

 -- auto pairs
  {
    "echasnovski/mini.pairs",
    lazy = false,
    config = function()
      require('mini.pairs').setup()
    end,
    keys = {
      {
        "<leader><up>",
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            print("Disabled auto pairs")
          else
            print("Enabled auto pairs")
          end
        end,
        desc = "Toggle Auto Pairs",
      },
    },
  },

  -- Better text-objects
  {
    "echasnovski/mini.ai",
    lazy = false,
    config = function (_, opts)
      require("mini.ai").setup(opts)
    end,
    opts = {
      n_lines = 500,
    }
  },

}
