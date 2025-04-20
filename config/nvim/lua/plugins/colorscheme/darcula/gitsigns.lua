local colors = require('plugins.colorscheme.darcula.colors')
local hi = vim.api.nvim_set_hl

hi(0, "GitSignsAdd", { fg = colors.mountain_view})
hi(0, "GitSignsChange", { fg = colors.maple_syrup })
hi(0, "GitSignsDelete", { fg = colors.vermilion_seabass })
