
local colors = require('plugins.colorscheme.darcula.colors')
local hi = vim.api.nvim_set_hl

hi(0, "TelescopeBorder", { fg = colors.dark })
hi(0, "TelescopePromptBorder", { bg = nil, })
hi(0, "TelescopePromptNormal", { bg = nil, fg = colors.dark })
hi(0, "TelescopePromptPrefix", { bg = nil, fg = colors.dark })
hi(0, "TelescopeResultsTitle", { bg = colors.light_olive_green, fg = colors.very_dark_gray })
hi(0, "TelescopePreviewTitle", { bg = colors.light_olive_green, fg = colors.very_dark_gray })

