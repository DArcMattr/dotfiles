vim.api.nvim_create_autocmd({'BufNewFile'}, {
  -- group = BufNewFileEvents,
  pattern = '*.c',
  command = '0r $XDG_CONFIG_HOME/nvim/templates/c/template.c',
})
