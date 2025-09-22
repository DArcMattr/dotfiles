vim.opt_local.keywordprg = 'ri'
vim.opt.tags:append { vim.lsp.buf.list_workspace_folders()[1] .. '/ruby.tags' }

vim.lsp.enable('solargraph')
