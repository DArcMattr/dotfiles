vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.c',
  command = '0r ~/.config/nvim/templates/c/template.c',
})

vim.opt_local.cinoptions  = { 't0','+4','(4','u4','w1' }
vim.opt_local.shiftwidth  = 8
vim.opt_local.softtabstop = 8
vim.opt_local.keywordprg  = 'man'
