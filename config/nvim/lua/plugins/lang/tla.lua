return {
  "susliko/tla.nvim",
  config = function()
    require("tla").setup({
      java_executable = "java",
    })

    require("Comment.ft").set("tla", "\\* %s")
  end,
}
