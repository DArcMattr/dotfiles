setlocal iskeyword+=.,#

let g:ale_linters['css'] = ['stylelint']
let g:ale_fixers['css'] = ['stylelint']
let g:ale_css_stylelint_use_global = 1
let g:ale_css_stylelint_options = '--config=$HOME/.config/yarn/global/package.json'
lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.css-languageserver.setup{}
EOF
