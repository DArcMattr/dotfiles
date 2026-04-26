vim.api.nvim_create_autocmd({'BufNewFile'}, {
  pattern = '*.go',
  command = '0r $XDG_CONFIG_HOME/nvim/templates/go/template.go',
})

