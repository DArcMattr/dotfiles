U.lspconfig.pyls.setup {
  capabilities = U.capabilities,
  autostart = true,
  root_dir = U.lspconfig.util.find_git_ancestor,
}

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.formatoptions = 'croql'
vim.opt_local.keywordprg = 'pydoc'
