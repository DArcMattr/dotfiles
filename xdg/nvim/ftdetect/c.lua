vim.api.nvim_create_autocmd({'BufNewFile'}, {
  pattern = '*.c',
  command = '0r $XDG_CONFIG_HOME/nvim/templates/c/template.c',
})

require('lspconfig').clangd.setup {
  autostart = true,
  capabilities = U.capabilities,
  flags = {
    debounce_text_changes = 150
  },
}
