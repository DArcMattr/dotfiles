autocmd FileType ruby setlocal keywordprg=ri

let b:tagcommands['ruby'] = { 'tagfile': $XDG_CONFIG_HOME . '/nvim/ruby.tags' }
lua <<EOF
require'nvim_lsp'.solargraph.setup{}
EOF
