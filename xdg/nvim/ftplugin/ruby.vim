autocmd FileType ruby setlocal keywordprg=ri

let b:tagcommands['ruby'] = { 'tagfile': $XDG_CONFIG_HOME . '/nvim/ruby.tags' }
lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.solargraph.setup{}
EOF
