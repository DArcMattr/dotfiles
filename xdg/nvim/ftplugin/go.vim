" Golang

try
  call LanguageClient_registerServerCommands({'go': [ 'go-langserver' ]})
catch
  " do nothing
endtry
