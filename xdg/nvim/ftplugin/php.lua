vim.lsp.enable('intelephense')

vim.opt_local.iskeyword:append {'$'}
vim.opt_local.suffixesadd:append {'.php'}
vim.opt.foldmarker = '-[[[-,-]]]-'
vim.g.mta_filetypes.php = 1 -- needed for a plugin, but don't remember what

U.dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/contrib/vscode-php-debug/out/phpDebug.js' }
}
