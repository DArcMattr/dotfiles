setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal foldlevel=1
setlocal expandtab

lua <<EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.jsonls.setup{}
EOF
