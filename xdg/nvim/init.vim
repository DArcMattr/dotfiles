lua <<LUA
vim.cmd([[
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
]])

local Plug = vim.fn['plug#']

-- TODO: switch to pure lua plugin loader
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('fatih/vim-go', { ['for'] = 'go', ['do'] = ':GoUpdateBinaries' })
Plug('hhvm/vim-hack', { ['for'] = 'hack' })
Plug('hilojack/vim-xt')
Plug('isRuslan/vim-es6', { ['for'] = { 'js', 'jsx', 'javascript.jsx', 'mjs' } })
Plug('jeffkreeftmeijer/vim-numbertoggle')
Plug('mattn/emmet-vim')
Plug('mfukar/robotframework-vim')
Plug('mfussenegger/nvim-dap')
Plug('mhinz/vim-signify')
Plug('nathanaelkane/vim-indent-guides')
Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('OmniSharp/omnisharp-vim', { ['for'] = { 'cs' }, ['do'] = ':OmniSharpInstall' })
Plug('rcarriga/nvim-dap-ui')
Plug('sheerun/vim-polyglot')
Plug('Shougo/denite.nvim', { ['do'] = ':UpdateRemotePlugins' })
-- Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
-- Plug('deoplete-plugins/deoplete-tag')
-- Plug('Shougo/deoplete-lsp')
Plug('Shougo/neco-syntax')
Plug('Shougo/neco-vim')
Plug('StanAngeloff/php.vim', {['for'] = 'php'})
Plug('tpope/vim-fugitive')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('Valloric/MatchTagAlways')
Plug('vim-airline/vim-airline')
Plug('vim-scripts/csv.vim')
Plug('vim-scripts/DirDiff.vim')
Plug('windwp/nvim-autopairs')
Plug('windwp/nvim-ts-autotag')
vim.call('plug#end')

local treesitter = package.loaded['nvim-treesitter']
local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  highlight = {
    additional_vim_regex_highlighting = true,
    disabled = {},
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "c_sharp",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "php",
    "phpdoc",
    "python",
    "sql",
    "vim",
  },
}
require'dapui'.setup {}
require'nvim-autopairs'.setup {}

vim.cmd.colorscheme('koehler')

vim.g.c_space_errors = 1
vim.g.editorconfig_enable = true
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_exclude_filetypes = {'help', 'man', 'netrw'}
vim.g.loaded_perl_provider = 0
vim.g.mapleader = ','
vim.g.maplocalleader = ' '

vim.fn.setenv('GIT_SSL_NO_VERIFY', 'true')

vim.opt.autoindent      = true
vim.opt.autoread        = true
vim.opt.background      = 'dark'
vim.opt.backspace       = { 'indent', 'eol', 'start' }
vim.opt.bomb            = false
vim.opt.colorcolumn     = '+1'
vim.opt.completeopt     = { 'menuone', 'longest' }
vim.opt.copyindent      = true
vim.opt.cursorcolumn    = true
vim.opt.cursorline      = true
vim.opt.diffopt         = 'filler,vertical,internal,indent-heuristic,algorithm:patience'
vim.opt.display         = 'lastline'
vim.opt.encoding        = 'utf-8'
vim.opt.expandtab       = true
vim.opt.exrc            = true
vim.opt.formatoptions   = 'nqr12j'
vim.opt.gdefault        = true
vim.opt.hidden          = true
vim.opt.hlsearch        = true
vim.opt.ignorecase      = true
vim.opt.incsearch       = true
vim.opt.joinspaces      = false
vim.opt.laststatus      = 2
vim.opt.lazyredraw      = true
vim.opt.list            = true
vim.opt.listchars       = 'eol:↲,precedes:«,extends:»,trail:·,tab:▸·,nbsp:¯'
vim.opt.matchtime       = 5
vim.opt.modeline        = true
vim.opt.mouse           = 'a'
vim.opt.number          = true
vim.opt.previewheight   = 20
vim.opt.pumheight       = 15
vim.opt.relativenumber  = true
vim.opt.scrolloff       = 3
vim.opt.sessionoptions  = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize' }
vim.opt.shiftround      = true
vim.opt.shiftwidth      = 2
vim.opt.shortmess       = 'acAIoOt'
vim.opt.showbreak       = '>'
vim.opt.showcmd         = true
vim.opt.showmatch       = true
vim.opt.showmode        = false
vim.opt.sidescrolloff   = 5
vim.opt.signcolumn      = 'yes'
vim.opt.smartcase       = true
vim.opt.smarttab        = true
vim.opt.softtabstop     = 2
vim.opt.splitbelow      = true
vim.opt.startofline     = false
vim.opt.swapfile        = false
vim.opt.synmaxcol       = 512
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.textwidth       = 80
vim.opt.timeout         = false
vim.opt.title           = true
vim.opt.titlestring     = [[%t%( [%R%M]%)]]
vim.opt.ttimeout        = true
vim.opt.undofile        = true
vim.opt.updatetime      = 300
vim.opt.virtualedit     = 'all'
vim.opt.visualbell      = true
vim.opt.wildmenu        = true
vim.opt.wildmode        = { 'list:longest', 'list:full' }
vim.opt.wrap            = false

vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.fillchars:append { stl = ' ', stlnc = '"' }
vim.opt.nrformats:remove { 'octal' }
vim.opt.wildignore:append {
  '*.png', '*.xpm', '*.gif', '*.pdf', '*.bak', '*.beam', '*.pyc', '.svn',
  'CVS', '.git', '*.o', '*.a', '*.class', '*.mo', '*.la', '*.so', '*.obj',
  '*.swp', '*.jpg', 'vendor/*', 'docs/*', 'node_modules/*', 'components/*',
  'build/*', 'dist/*'
}

vim.cmd.highlight('TermCursor', 'ctermfg=yellow guifg=yellow')
vim.cmd.highlight('LineNr',     'gui=bold guifg=#c6c6c6 guibg=#00005f')
vim.cmd.highlight('LineNr',     'gui=bold guifg=#c6c6c6 guibg=#00005f')
vim.cmd.highlight('LineNr',     'term=reverse cterm=bold ctermfg=251 ctermbg=17')
vim.cmd.highlight('NonText',    'ctermfg=235 guifg=#262626')
vim.cmd.highlight('OverLength', 'ctermbg=234 ctermfg=249 guibg=#1c1c1c guifg=#b2b2b2')
vim.cmd.highlight('SpellBad',   'term=standout,underline cterm=underline ctermfg=1 guifg=#800000 gui=undercurl')
vim.cmd.highlight('SpellCap',   'term=underline cterm=underline gui=undercurl')
vim.cmd.highlight('SpellLocal', 'term=underline cterm=underline gui=undercurl')
vim.cmd.highlight('SpellRare',  'term=underline cterm=underline gui=undercurl')

vim.keymap.set('i', '<C-b>',   '<Esc>gUiwi')
vim.keymap.set('i', '<Cr>',    function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<C-g>u<Cr>' end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-h>' end,      { expr = true })
vim.keymap.set('i', '<Tab>',   function() return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>' end,      { expr = true })

vim.keymap.set('n', '<C-PageDown>',   ':bp<Cr>')
vim.keymap.set('n', '<C-PageUp>',     ':bn<Cr>')
vim.keymap.set('n', '<C-d>',          '<C-d>zz')
vim.keymap.set('n', '<C-e>',          '3<C-e>')
vim.keymap.set('n', '<C-p>',          ':Denite file/rec<Cr>')
vim.keymap.set('n', '<C-u>',          '<C-u>zz')
vim.keymap.set('n', '<C-y>',          '3<C-y>')
vim.keymap.set('n', '<F10>',          function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<F2>',           function() require'dap'.step_over() end)
vim.keymap.set('n', '<F3>',           function() require'dap'.step_into() end)
vim.keymap.set('n', '<F4>',           function() require'dap'.step_out() end)
vim.keymap.set('n', '<F5>',           function() require'dap'.continue() end)
vim.keymap.set('n', '<Leader><C-k>',  function() vim.lsp.buf.signature_help() end)
vim.keymap.set('n', '<Leader><S-F5>', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader><S-b>',  'gUiw')
vim.keymap.set('n', '<Leader>a',      function() vim.opt.relativenumber = not(vim.opt.relativenumber:get()) end)
vim.keymap.set('n', '<Leader>b',      'guiw')
vim.keymap.set('n', '<Leader>d*',     ':DeniteCursorWord grep:.<Cr>')
vim.keymap.set('n', '<Leader>d/',     ':Denite grep:.<Cr>')
vim.keymap.set('n', '<Leader>dl',     function() require'dap'.run_last() end)
vim.keymap.set('n', '<Leader>do',     ':Denite outline<Cr>')
vim.keymap.set('n', '<Leader>dp',     function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true})
vim.keymap.set('n', '<Leader>dr',     function() require'dap'.repl.open() end)
vim.keymap.set('n', '<Leader>gb',     ':Git blame<Cr>')
vim.keymap.set('n', '<Leader>gc',     ':Git commit<Cr>')
vim.keymap.set('n', '<Leader>gd',     ':Gdiffsplit<Cr>')
vim.keymap.set('n', '<Leader>gl',     ':Git log -- %<Cr>')
vim.keymap.set('n', '<Leader>gp',     ':Git push<Cr>')
vim.keymap.set('n', '<Leader>gs',     ':Git<Cr>')
vim.keymap.set('n', '<Leader>l0',     function() vim.lsp.buf.document_symbol() end)
vim.keymap.set('n', '<Leader>lD',     function() vim.lsp.buf.implementation() end)
vim.keymap.set('n', '<Leader>lW',     function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set('n', '<Leader>ld',     function() vim.lsp.buf.declaration() end)
vim.keymap.set('n', '<Leader>lf',     function() vim.lsp.buf.format() end)
vim.keymap.set('n', '<Leader>lg',     function() vim.lsp.buf.type_definition() end)
vim.keymap.set('n', '<Leader>lk',     function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<Leader>lr',     function() vim.lsp.buf.references() end)
vim.keymap.set('n', '<Leader>o',      'i<Cr><Esc>')
vim.keymap.set('n', '<Leader>q',      ':nohlsearch<Cr>')
vim.keymap.set('n', '<Leader>t',      ':enew<Cr>')
vim.keymap.set('n', '<Leader><F7>',   function() vim.opt.spell = not(vim.opt.spell:get())  end, { silent = true })
vim.keymap.set('n', '<Left>',         ':bp<Cr>')
vim.keymap.set('n', '<M-i>',          'i<Space><Esc>')
vim.keymap.set('n', '<Right>',        ':bn<Cr>')
vim.keymap.set('n', 'A',              'zzA')
vim.keymap.set('n', 'H',              '^')
vim.keymap.set('n', 'I',              'zzI')
vim.keymap.set('n', 'J',              'mzJ`z')
vim.keymap.set('n', 'L',              '$')
vim.keymap.set('n', 'N',              'Nzz')
vim.keymap.set('n', 'Q',              'gq')
vim.keymap.set('n', 'Y',              'y$')
vim.keymap.set('n', 'a',              'zza')
vim.keymap.set('n', 'i',              'zzi')
vim.keymap.set('n', 'n',              'nzz')
vim.keymap.set('n', 'p',              'p`[')
vim.keymap.set('n', '{',              '{zz')
vim.keymap.set('n', '}',              '}zz')
vim.keymap.set('t', '<Leader><Esc>',  '<C-\\><C-n>')
vim.keymap.set('v', '*',              'y/<C-r>"<Cr>')
vim.keymap.set('v', '?',              'y?<C-r>"<Cr>')
vim.keymap.set('v', 'p',              '"_dP`]')
vim.keymap.set('v', 'y',              'y`]')
vim.keymap.set({'n', 'v'}, ':',       ';')
vim.keymap.set({'n', 'v'}, ';',       ':')
vim.keymap.set({'n', 'x'}, 'c',       '"xc')

local FocusEvents = vim.api.nvim_create_augroup('FocusEvents', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained' }, {
  pattern = '*',
  group = FocusEvents,
  callback = function(buf)
    vim.cmd.highlight('Normal', 'ctermbg=none guibg=none')
    vim.opt.cursorcolumn = true
    vim.opt.cursorline = true
  end
})
vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  pattern = '*',
  group = FocusEvents,
  callback = function(buf)
    vim.cmd.highlight('Normal', 'ctermbg=darkgrey guibg=#181818')
    vim.opt.cursorcolumn = false
    vim.opt.cursorline = false
  end
})

local QF = vim.api.nvim_create_augroup('QF', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType'}, {
  pattern = 'qf',
  group = QF,
  callback = function()
    vim.opt.buflisted = false
    vim.opt.hidden = true
  end
})

local InsertOutsert = vim.api.nvim_create_augroup('InsertOutsert', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  group = InsertOutsert,
  callback = function()
    vim.opt.list = false
    vim.opt.timeoutlen = 0
  end
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  group = InsertOutsert,
  callback = function()
    vim.opt.list = true
    vim.opt.timeoutlen = 200
  end
})
LUA

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1

" Denite
call denite#custom#option( 'default', {
\  'auto_resize': 1,
\  'prompt': '>',
\  'short': 1,
\  'split': 'floating_relative_cursor',
\})
call denite#custom#option( 'list', { 'mode': 'normal' } )

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m

	call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
else
  set grepprg=grep\ -nH\ $*
endif

" Deoplete
" call deoplete#enable()
" call deoplete#custom#option('sources', {
" \     '_': []
" \   })
" "call deoplete#enable_logging('DEBUG', $HOME . '/deoplete.log')

command! -nargs=1 Silent |
\   execute ':silent !'.<q-args> |
\   :redraw!<Cr>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
  \   | wincmd p | diffthis
endif

" from https://gist.github.com/tarruda/5158535
if exists('$TMUX')
  nnoremap <silent> <C-w>j :call funcs#TmuxMove('j')<Cr>
  nnoremap <silent> <C-w>k :call funcs#TmuxMove('k')<Cr>
  nnoremap <silent> <C-w>h :call funcs#TmuxMove('h')<Cr>
  nnoremap <silent> <C-w>l :call funcs#TmuxMove('l')<Cr>
  nnoremap <silent> <C-w><down> :silent call funcs#TmuxMove('j')<Cr>
  nnoremap <silent> <C-w><up> :silent call funcs#TmuxMove('k')<Cr>
  nnoremap <silent> <C-w><left> :silent call funcs#TmuxMove('h')<Cr>
  nnoremap <silent> <C-w><right> :silent call funcs#TmuxMove('l')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>j :silent call funcs#TmuxMove('j')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>k :silent call funcs#TmuxMove('k')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>h :silent call funcs#TmuxMove('h')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>l :silent call funcs#TmuxMove('l')<Cr>

  let g:clipboard = {
        \   'name': 'tmux override',
        \   'copy': {
        \      '+': ['tmux', 'load-buffer', '-'],
        \      '*': ['tmux', 'load-buffer', '-'],
        \    },
        \   'paste': {
        \      '+': ['tmux', 'save-buffer', '-'],
        \      '*': ['tmux', 'save-buffer', '-'],
        \   },
        \   'cache_enabled': 1,
        \ }
endif

augroup FugitiveStuffs
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd QuickFixCmdPost *log* cwindow
  autocmd QuickFixCmdPost *llog* lwindow
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

augroup CloseLocListWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

augroup OmniFunc
  autocmd!
  autocmd FileType *
  \ if &omnifunc == "" |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif
augroup END

" update diffs aggressively
" https://groups.google.com/forum/?fromgroups=#!topic/vim_use/ZNZcBAABDgE
augroup AutoDiffUpdate
  autocmd!
  autocmd FilterWritePre * call funcs#SetDiffColors()
  autocmd InsertLeave *
  \ if &diff |
  \   diffupdate |
  \   let b:old_changedtick = b:changedtick |
  \ endif
  autocmd CursorHold *
  \ if &diff &&
  \     (!exists('b:old_changedtick') || b:old_changedtick != b:changedtick) |
  \   let b:old_changedtick = b:changedtick |
  \     diffupdate |
  \ endif
augroup END

augroup StartupStuffs
  autocmd!
  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   execute "normal! g`\""                       |
  \ endif
  autocmd WinEnter,BufEnter,BufRead,FileType *
  \ if !&modifiable |
  \   setlocal scrolloff=999 |
  \ endif |
  \ call funcs#SetColorColumn()
  autocmd TermOpen *
  \ setlocal nonumber norelativenumber |
  \ startinsert
  autocmd VimResized * execute 'normal! \<C-w>='
augroup END

" left over FileType config below
" any project-specific settings should be included in the local config file placed
" in the root folder of that project

" Mercurial commit messages
autocmd BufNewFile,BufRead,BufEnter msg setfiletype hgcommit
autocmd FileType hgcommit setlocal textwidth=72
