autocmd FileType javascript setlocal iskeyword+=$

let b:tagcommands = { 'jsx' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/js.tags' } }

let g:user_emmet_settings = {
\   'javascript.jsx' : {
\     'extends': 'jsx',
\     'default_attributes': {
\       'label': [{'htmlFor': ''}],
\      }
\    }
\  }

lua <<EOF
vim.lsp.enable('tsserver')
EOF
