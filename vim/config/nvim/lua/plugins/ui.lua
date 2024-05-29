return {

  -- {
  --   "rcarriga/nvim-notify",
  --   lazy = false,
  --   init = function()
  --       vim.notify = require("notify")
  --   end,
  --   keys = {
  --     {
  --       "<leader>un",
  --       function()
  --         require("notify").dismiss({ silent = true, pending = true })
  --       end,
  --       desc = "Dismiss All Notifications",
  --     },
  --   },
  --   opts = {
  --     stages = "static",
  --     timeout = 10000,
  --     max_height = function()
  --       return math.floor(vim.o.lines * 0.75)
  --     end,
  --     max_width = function()
  --       return math.floor(vim.o.columns * 0.75)
  --     end,
  --     on_open = function(win)
  --       vim.api.nvim_win_set_config(win, { zindex = 100 })
  --     end,
  --   },
  -- },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "dashboard",
        }
      }
    },
    main = "ibl",
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup()
    end,
    keys = {
      { "]t", "<cmd>BufferLineMoveNext<cr>", desc = "Reorder tab next" },
      { "[t", "<cmd>BufferLineMovePrev<cr>", desc = "Reorder tab back" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Go to next tab" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go to prev tab" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick tab" },
      { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others tabs" },
      { "<leader>bb", "<cmd>e #<cr>", desc = "Switch to prev Buffer" },
      { "<leader>bd", "<cmd>:bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Delete Buffer" },
      { "<leader>bD", "<cmd>:bd<cr>", desc = "Delete Buffer and Window" },
    }
  },

  -- Статусная строка
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          theme = 'dracula'
        },
      })
    end
  },

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
           ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
           ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
           ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
           ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
           ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
           ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find File",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
            { action = "e ~/.config/nvim",                                         desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

}
