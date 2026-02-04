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
    ["openapi.*%.ya?ml"] = "yaml.openapi",
    ["openapi.*%.json"] = "json.openapi",
  },
})
