local LocalPHP = vim.api.nvim_create_augroup('LocalPHP', { clear = true })

U.lspconfig.intelephense.setup {
    settings = {
        intelephense = {
            environment = { version = "8.1.0" },
        }
    }
}
--[[
vim.lsp.start({
    name = 'php',
    cmd =
})
--]]

U.dap.configurations.php = {
  {
    name = 'Listen for Xdebug',
    type = 'php',
    request = 'launch',
    port = 9003,
    -- log = true,
    hostname = "0.0.0.0",
    pathMappings = {
      ["/var/www/html/"] = "${workspaceFolder}/",
    }
  }
}

vim.env.PROJECT_ROOT = vim.fs.dirname(
    vim.fs.find('composer.json', { upward = true })[1]
)

vim.g.php_version_id = 80100
vim.opt.textwidth = 90
vim.opt.includeexpr = vim.fn.substitute(vim.v.fname, '^/', '', '')

vim.api.nvim_create_autocmd({'BufNewFile', 'BufEnter'}, {
    pattern = '*',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.path = { '.', vim.env.PROJECT_ROOT }
    end
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufEnter'}, {
    pattern = '*.php',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.tags = { vim.env.PROJECT_ROOT .. '/php.tags' }
        vim.opt.foldmarker = '-[[[-,-]]]-'
    end
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufEnter'}, {
    pattern = '*.js',
    group = LocalPHP,
    callback = function(ev)
        vim.opt.tags = { vim.env.PROJECT_ROOT .. '/js.tags' }
    end
})
