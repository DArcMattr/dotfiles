autocmd FileType typescript setlocal iskeyword+=$

let g:ale_fixers['typescript'] = ['eslint']
let g:ale_typescript_eslint_executable = 'eslint_d'
let g:ale_typescript_eslint_use_global = 1
let g:ale_linters['typescript'] = ['eslint']
let b:tagcommands = { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.tsserver.setup{}
EOF
