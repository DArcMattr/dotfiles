" Golang

let g:go_term_mode = "split"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_command='golangci-lint'

lua <<EOF
require'lspconfig'.gopls.setup{}
EOF
