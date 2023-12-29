vim.api.nvim_create_autocmd({'BufNewFile'}, {
  pattern = '*.tex',
  command = '0r $XDG_CONFIG_HOME/nvim/templates/latex/template.tex',
})
