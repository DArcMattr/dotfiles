autocmd BufNewFile *.html 0r ~/dotfiles/lang/html/index.html

let g:ale_linters['html'] = ['tidy']
let g:ale_fixers['html'] = ['tidy']
let g:ale_html_langserver_executable = 'vscode-html-languageservice'

try
  call LanguageClient_registerServerCommands({'html': [ 'vscode-html-languageservice', '--stdio' ]})
catch
  " do nothing
endtry
