setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal foldlevel=1
setlocal expandtab

try
  call LanguageClient_registerServerCommands({'json': [ 'vscode-json-languageservice' ]})
catch
  " do nothing
endtry
