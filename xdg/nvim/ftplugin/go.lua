-- Golang
local InsertOutsert = vim.api.nvim_create_augroup('GoFormat', {})

require'lspconfig'.gopls.setup{}

vim.g.go_term_mode = "split"
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
