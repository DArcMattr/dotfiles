setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal foldlevel=1
setlocal expandtab

lua <<EOF
require'lspconfig'.jsonls.setup{}
EOF
