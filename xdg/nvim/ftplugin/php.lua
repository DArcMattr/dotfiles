U.lspconfig.intelephense.setup {
  capabilities = U.capabilities,
  autostart = true,
  root_dir = U.lspconfig.util.root_pattern('.git', 'composer.json', 'index.php'),
}

vim.opt_local.iskeyword:append {'$'}
vim.opt_local.suffixesadd:append {'.php'}
vim.g.mta_filetypes.php = 1

U.dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/contrib/vscode-php-debug/out/phpDebug.js' }
}
