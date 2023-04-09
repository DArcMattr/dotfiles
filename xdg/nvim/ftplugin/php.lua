require'lspconfig'.intelephense.setup{
	capabilities = U.capabilities
}
vim.opt_local.keywordprg = 'pman'
vim.opt_local.iskeyword:append {'$'}
vim.opt_local.suffixesadd:append {'.php'}
vim.g.mta_filetypes.php = 1

U.dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/contrib/vscode-php-debug/out/phpDebug.js' }
}

U.dap.configurations.php = {
  {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug',
      port = 9003
  }
}
