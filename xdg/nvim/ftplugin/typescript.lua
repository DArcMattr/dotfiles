-- vim.b.tagcommands:append { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }
vim.lsp.enable('ts_ls')
vim.opt_local.iskeyword:append {'$'}

U.dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { os.getenv('HOME') .. '/contrib/vscode-js-debug/dist/src/dapDebugServer.js', '${port}', },
  },
}

U.dap.configurations.typescript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
  },
}
