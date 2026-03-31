vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = 'docker-compose*.{yaml,yml}*',
  callback = function()
    vim.bo.filetype = 'yaml.docker-compose'
  end,
})
