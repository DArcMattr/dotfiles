autocmd FileType typescript setlocal iskeyword+=$

let g:ale_fixers['typescript'] = ['eslint']
let g:ale_typescript_eslint_executable = 'eslint_d'
let g:ale_linters['typescript'] = ['eslint']
let b:tagcommands = { 'typescript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/ts.tags' } }

lua <<EOF
require'lspconfig'.tsserver.setup{}
EOF
