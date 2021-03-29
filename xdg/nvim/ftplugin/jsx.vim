autocmd FileType javascript setlocal iskeyword+=$

let b:tagcommands = { 'jsx' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/js.tags' } }

let g:ale_fixers['jsx'] = ['eslint']
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_jsx_eslint_executable = 'eslint_d'
let g:ale_linters['jsx'] = ['eslint']
let g:user_emmet_settings = {
\   'javascript.jsx' : {
\     'extends': 'jsx',
\     'default_attributes': {
\       'label': [{'htmlFor': ''}],
\      }
\    }
\  }

lua <<EOF
require'lspconfig'.tsserver.setup{}
EOF
