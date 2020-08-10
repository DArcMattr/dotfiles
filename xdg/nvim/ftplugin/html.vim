let g:ale_linters['html'] = ['tidy']
let g:ale_fixers['html'] = ['tidy']
let g:ale_html_langserver_executable = 'vscode-html-languageservice'
let g:ale_html_tidy_options = '-config ~/dotfiles/helpers/htmltidy.cfg'
let g:LanguageClient_serverCommands['html'] = ['html-languageserver', '--stdio']
