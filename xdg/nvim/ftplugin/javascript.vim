autocmd FileType javascript setlocal iskeyword+=$

let g:ale_fixers['javascript'] = ['eslint']
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters['javascript'] = ['eslint']

lua <<EOF
require'lspconfig'.tsserver.setup{}
EOF
