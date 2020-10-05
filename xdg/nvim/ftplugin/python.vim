setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab
setlocal formatoptions=croql
setlocal keywordprg=pydoc

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.pyls.setup{}
EOF
