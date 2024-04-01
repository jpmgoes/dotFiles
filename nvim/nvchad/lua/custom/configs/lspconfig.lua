local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig") -- package

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  root_dir = lspconfig.util.root_pattern(
    "eslint.config.js",
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc"
  ),
})
