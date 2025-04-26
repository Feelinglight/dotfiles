local open_grug = function(engine)
  return function()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
      engine = engine,
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
    })
  end
end

return {
  "MagicDuck/grug-far.nvim",
  keys = function()
    return {
      {
        "<leader>srr",
        open_grug("ripgrep"),
        mode = { "n", "v" },
        desc = "Search and Replace ripgrep",
      },
      {
        "<leader>sra",
        open_grug("astgrep"),
        mode = { "n", "v" },
        desc = "Search and Replace astgrep",
      },
    }
  end,
}
