let g:ale_linters['html'] = ['tidy']
let g:ale_fixers['html'] = ['tidy']
let g:ale_html_langserver_executable = 'html-languageservice'
let g:ale_html_tidy_options = '-config ~/dotfiles/helpers/htmltidy.cfg'

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.html.setup{}
EOF
