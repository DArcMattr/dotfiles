autocmd BufNewFile *.html 0r ~/dotfiles/lang/html/index.html

let g:ale_linters['html'] = ['tidy']
let g:ale_fixers['html'] = ['tidy']
let g:ale_html_langserver_executable = 'vscode-html-languageservice'
let g:ale_html_tidy_options = '-config $HOME/dotfiles/helpers/htmltidy.cfg'

try
  call LanguageClient_registerServerCommands({'html': [ 'html-languageserver', '--stdio' ]})
catch
  " do nothing
endtry
