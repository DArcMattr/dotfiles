setlocal iskeyword+=.,#

let g:ale_linters['css'] = ['stylelint']
let g:ale_fixers['css'] = ['stylelint']
let g:ale_css_stylelint_options = '--config=$HOME/.config/yarn/global/package.json'
lua <<EOF
require'lspconfig'.cssls.setup{}
EOF
