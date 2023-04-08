" vim:et sw=2 ts=2

lua <<LUA
vim.fn.setenv('PROJECT_ROOT', '/var/www/vhosts/local.test')

require'lspconfig'.intelephense.setup{
  settings = {
    intelephense = {
      environment = { version = "8.1.0" },
    }
  }
}
LUA

let g:ale_css_stylelint_options = ""
let g:ale_php_phpcs_standard = 'PSR2R'
let g:ale_php_phpcs_options = '--runtime-set php_version 80100'
let g:ale_php_phpcbf_standard = 'PSR2R'
let g:ale_javascript_eslint_use_global = 0
let g:php_version_id = 80100

augroup project
  autocmd!

  autocmd BufNewFile,BufEnter * setlocal path=$PROJECT_ROOT/htdocs/web,$PROJECT_ROOT/htdocs/,.

  autocmd BufNewFile,BufEnter *.php setlocal tags=$PROJECT_ROOT/php.tags
  autocmd BufNewFile,BufEnter *.php setlocal foldmarker='-[[[-,-]]]-'

  autocmd BufNewFile,BufEnter *.js setlocal tags=$PROJECT_ROOT/js.tags

  autocmd BufNewFile,BufEnter *.yml setlocal path+=$PROJECT_ROOT/htdocs/src/LIMS/
augroup END

set includeexpr=substitute(v:fname,'^/','','')
