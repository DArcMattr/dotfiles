setlocal keywordprg=pman
setlocal iskeyword+=$
setlocal suffixesadd+=.php
" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |

let g:ale_fixers['php'] = ['phpcbf']
let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_php_langserver_executable = 'intelephense'
let g:mta_filetypes['php'] = 1

lua <<LUA
require'lspconfig'.intelephense.setup{}
--[[
local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/contrib/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug',
      port = 9003
  }
}
]]
LUA
