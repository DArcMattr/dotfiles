setlocal iskeyword+=.,#

let g:ale_linters['scss'] = ['stylelint']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_scss_stylelint_options = '--config ~/.config/yarn/global/package.json'
let g:ale_scss_stylelint_use_global = 1

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.cssls.setup{}
EOF
