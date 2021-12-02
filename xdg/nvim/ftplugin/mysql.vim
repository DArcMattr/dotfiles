lua <<LUA
require'lspconfig'.sqlls.setup{
  cmd = {"/home/darc/dotfiles/node_modules/sql-language-server/npm_bin/cli.js", "up", "--method", "stdio" };
}
LUA

