-- vim.b.tagcommands:append { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }
vim.opt_local.iskeyword:append {'$'}

require('dap-vscode-js').setup({
  debugger_path = os.getenv('HOME') .. '/contrib/vscode-js-debug',
  adapters = { 'pwa-node', },
})
