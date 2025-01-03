vim.opt_local.iskeyword:append {'$'}

-- curl -OL https://github.com/microsoft/vscode-js-debug/releases/download/v1.96.0/js-debug-dap-v1.96.0.tar.gz
U.dap.adapters['pwa-node'] = { -- also repeat for typescript
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { os.getenv('HOME') .. '/contrib/js-debug/src/dapDebugServer.js', '${port}', },
  },
}

U.dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  }
}
