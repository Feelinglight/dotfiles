vim.filetype.add({
  extension = {
    conf = "conf",
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    [".yamlfmt"] = "yaml",
  },
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
  },
})
