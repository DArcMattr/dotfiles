autocmd FileType javascript setlocal iskeyword+=$

let g:ale_fixers['javascript'] = ['eslint']
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters['javascript'] = ['eslint']

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.tsserver.setup{}
EOF
