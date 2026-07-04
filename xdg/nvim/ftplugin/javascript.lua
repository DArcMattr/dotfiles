vim.lsp.enable('ts_ls')
vim.opt_local.iskeyword:append {'$'}

U.dap.adapters['pwa-node'] = { -- also repeat for typescript
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { os.getenv('HOME') .. '/contrib/vscode-js-debug/dist/src/dapDebugServer.js', '${port}', },
  },
}

U.dap.configurations.javascript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
  }
}
