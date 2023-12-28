U.lspconfig.clangd.setup {}

vim.opt_local.cinoptions  = { 't0','+4','(4','u4','w1' }
vim.opt_local.shiftwidth  = 8
vim.opt_local.softtabstop = 8

U.dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb',
}
