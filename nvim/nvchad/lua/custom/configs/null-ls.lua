local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
      filetypes = { "html", "json", "yaml", "markdown" },
    })
  }
}

return opts
