vim.api.nvim_create_autocmd({'BufNewFile'}, {
  pattern = '*.html',
  command = '0r $XDG_CONFIG_HOME/nvim/templates/html/index.html',
})
