require('share.c').setup()

vim.lsp.enable('clangd')

vim.lsp.config('clangd', {
  autostart = true,
  capabilities = U.capabilities,
  flags = {
    debounce_text_changes = 150
  },
})

U.dap.adapters.c = {
  type = 'executable',
  command = 'lldb-dap',
  name = "lldb"
}

U.dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  }
}
