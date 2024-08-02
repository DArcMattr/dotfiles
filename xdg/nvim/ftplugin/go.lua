-- Golang
local FormatSyncGrp = vim.api.nvim_create_augroup('GoFormat', {})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimport()
  end,
  group = FormatSyncGrp,
})
