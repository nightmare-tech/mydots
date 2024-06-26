require("mason").setup()
require("mason-lspconfig").setup()

require'lspconfig'.clangd.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.lua_ls.setup{}

