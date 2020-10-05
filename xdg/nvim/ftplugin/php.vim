setlocal keywordprg=pman
setlocal iskeyword+=$
setlocal suffixesadd+=.php

let g:ale_fixers['php'] = ['phpcbf']
let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_php_langserver_executable = 'intelephense'
let g:mta_filetypes['php'] = 1

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.intelephense.setup{}
EOF

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |
