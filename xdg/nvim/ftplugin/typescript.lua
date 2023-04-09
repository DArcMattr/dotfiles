require'lspconfig'.tsserver.setup{
	capabilities = U.capabilities
}

-- vim.b.tagcommands:append { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }
vim.opt_local.iskeyword:append {'$'}
