setlocal iskeyword+=.,#

let g:ale_linters['scss'] = ['stylelint']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_scss_stylelint_options = '--config ~/.config/yarn/global/package.json'

lua <<EOF
require'lspconfig'.cssls.setup{}
EOF
