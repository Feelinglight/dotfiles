return {
  "echasnovski/mini.map",
  enabled = false,
  lazy = false,
  config = function()
    local minimap = require("mini.map")

    minimap.setup({
      integrations = {
        minimap.gen_integration.diagnostic({
          error = "DiagnosticFloatingError",
          warn = "DiagnosticFloatingWarn",
          info = "DiagnosticFloatingInfo",
          hint = "DiagnosticFloatingHint",
        }),
        minimap.gen_integration.builtin_search(),
        minimap.gen_integration.gitsigns(),
      },
      symbols = {
        encode = minimap.gen_encode_symbols.dot("3x2"),
      },
    })
    minimap.open()
  end,
}
