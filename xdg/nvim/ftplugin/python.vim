setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab
setlocal formatoptions=croql
setlocal keywordprg=pydoc

lua <<EOF
require'lspconfig'.pyls.setup{}
EOF
