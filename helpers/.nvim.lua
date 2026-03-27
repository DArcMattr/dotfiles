local LocalPHP = vim.api.nvim_create_augroup('LocalPHP', { clear = true })
local bin = vim.fn.getcwd() .. '/bin/'

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
vim.opt.includeexpr = vim.fn.substitute(vim.v.fname, '^/', '', '')
vim.keymap.set({'n','t'}, '<Leader>cc', '<Cmd>ClaudeCodeContinue<Cr>', { desc = 'Toggle Claude Code (continue)'})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufEnter', 'BufWinEnter'}, {
    pattern = '*',
    group = LocalPHP,
    callback = function(_)
        vim.opt.path = { '.', vim.lsp.buf.list_workspace_folders()[1] }
    end
})

vim.api.nvim_create_autocmd({'LspAttach'}, {
    pattern = '*.php',
    group = LocalPHP,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local root_dir = client ~= nil and client.config.root_dir
        if root_dir ~= nil then
            vim.opt.tags:append { vim.lsp.buf.list_workspace_folders()[1] .. '/php.tags' }
        end
    end
})

vim.api.nvim_create_autocmd({'LspAttach'}, {
    pattern = '*.php',
    group = LocalPHP,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'intelephense' then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings or {}, {
                intelephense = {
                    diagnostics = {
                        unusedSymbols = false,
                    },
                },
            })
            client:notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
    end,
})

vim.api.nvim_create_autocmd({'LspAttach'}, {
    pattern = '*.js',
    group = LocalPHP,
    callback = function(_)
        vim.opt.tags:append { vim.lsp.buf.list_workspace_folders()[1] .. '/js.tags' }
    end
})

U.utils.add_null_ls_sources({
  U.null_ls.builtins.diagnostics.phpcs.with({ command = bin .. 'phpcs' }),
  U.null_ls.builtins.diagnostics.phpstan.with({ command = bin .. 'phpstan' }),
  U.null_ls.builtins.formatting.phpcbf.with({ command = bin .. 'phpcbf' }),
})
