return {
  "susliko/tla.nvim",
  config = function()
    require("tla").setup()

    require("Comment.ft").set("tla", "\\* %s")
  end,
}
