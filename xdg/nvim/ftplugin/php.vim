setlocal keywordprg=pman
setlocal iskeyword+=$
setlocal suffixesadd+=.php

let g:ale_fixers['php'] = ['phpcbf']
let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_php_langserver_executable = 'intelephense'
let g:ale_php_langserver_use_global = 1
let g:mta_filetypes['php'] = 1

lua <<LUA
require'nvim_lsp'.intelephense.setup{
--[==[ not sure how settings are supposed to translate
  settings = [[{
    intelephense = {
      environment = {
        version = "5.6.0";
      };
    };
  }]]
  ]==]
}
LUA

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |
