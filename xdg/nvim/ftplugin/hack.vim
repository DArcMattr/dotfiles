setlocal iskeyword+=$

let g:ale_linters['hack'] = ['hack', 'hhast']
let g:ale_fixers['hack'] = ['hhast']
let g:ale_hack_langserver_executable = ['hack']

nnoremap <silent> K :ALEHover<CR>
