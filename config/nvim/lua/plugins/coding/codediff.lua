local keymaps = require("config.keymaps-const")

return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codediff_input = { "path" },
        },
      },
    },
  },

  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    opts = {
      keymaps = {
        view = {
          toggle_explorer = "<leader>e",
          focus_explorer = "",

          toggle_layout = "<leader>t",

          next_hunk = keymaps.NEXT_HUNK,
          prev_hunk = keymaps.PREV_HUNK,
        },
      },
    },
    keys = {
      { "<leader>odr", "<cmd>CodeDiff<cr>", desc = "Open CodeDiff" },
      {
        "<leader>odf",
        function()
          -- 1. Check if buffer is a special type (e.g., file explorer, terminal, quickfix)
          if vim.bo.buftype ~= "" then
            vim.notify("Current buffer is not a normal file", vim.log.levels.WARN)
            return
          end

          local current_buffer = vim.fn.expand("%")

          -- 2. Check if path is empty or not a readable file on disk
          if current_buffer == "" or vim.fn.filereadable(current_buffer) ~= 1 then
            vim.notify("Current buffer is not a valid file on disk", vim.log.levels.WARN)
            return
          end

          -- 3. Prompt user for input only if validation passes
          Snacks.input({
            prompt = "CodeDiff target file: ",
            win = {
              b = { completion = true },
              bo = { filetype = "codediff_input" },
            },
          }, function(user_input)
            if user_input and user_input ~= "" then
              vim.cmd(
                string.format(
                  "CodeDiff file %s %s",
                  vim.fn.fnameescape(user_input),
                  vim.fn.fnameescape(current_buffer)
                )
              )
            end
          end)
        end,
        desc = "CodeDiff current buffer with target file on disk",
      },
    },
  },
}
