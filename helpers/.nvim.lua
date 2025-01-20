local LocalPHP = vim.api.nvim_create_augroup('LocalPHP', { clear = true })

U.dap.configurations.php = {
  {
    name = 'Listen for Xdebug',
    type = 'php',
    request = 'launch',
    port = 9003,
    -- log = true,
    hostname = "0.0.0.0",
    pathMappings = {
      ["/var/www/html/"] = "${workspaceFolder}/app/",
    }
  }
}

U.dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        program = "${file}"
    }
}

vim.g.php_version_id = 80300
vim.opt.textwidth = 90
vim.opt.includeexpr = vim.fn.substitute(vim.v.fname, '^/', '', '')

vim.api.nvim_create_autocmd({'BufNewFile', 'BufEnter', 'BufWinEnter'}, {
    pattern = '*',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.path = { '.', vim.lsp.buf.list_workspace_folders()[1] }
    end
})

vim.api.nvim_create_autocmd({'LspAttach'}, {
    pattern = '*.php',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.tags:append { vim.lsp.buf.list_workspace_folders()[1] .. '/php.tags' }
    end
})

vim.api.nvim_create_autocmd({'LspAttach'}, {
    pattern = '*.js',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.tags:append { vim.lsp.buf.list_workspace_folders()[1] .. '/js.tags' }
    end
})
