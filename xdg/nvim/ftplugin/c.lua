U.lspconfig.clangd.setup {
  autostart = true,
  capabilities = U.capabilities,
  flags = {
    debounce_text_changes = 150
  },
}

vim.opt_local.cinoptions  = { 't0','+4','(4','u4','w1' }

U.dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb',
}

U.dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input( 'Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  }
}
