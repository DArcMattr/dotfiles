vim.keymap.set('n', 'q', ';q<Cr>')
vim.api.nvim_create_autocmd({'VimEnter'}, {
  callback = function()
    vim.cmd.normal('gg0')
    vim.cmd('startinsert')
  end,
})
