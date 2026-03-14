require('share.c').setup()

U.dap.adapters.cpp = {
  type = 'executable',
  command = 'lldb-dap',
  name = 'lldb'
}

if not U.dap.configurations.cpp or #U.dap.configurations.cpp == 0 then
  U.dap.configurations.cpp = {
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
end

U.dap.configurations.c = U.dap.configurations.cpp
