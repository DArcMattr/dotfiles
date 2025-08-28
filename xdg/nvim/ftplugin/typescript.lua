-- vim.b.tagcommands:append { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }
vim.opt_local.iskeyword:append {'$'}

-- curl -OL https://github.com/microsoft/vscode-js-debug/releases/download/v1.102.0/js-debug-dap-v1.102.0.tar.gz
U.dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = { os.getenv('HOME') .. '/contrib/js-debug/src/dapDebugServer.js', '${port}', },
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
