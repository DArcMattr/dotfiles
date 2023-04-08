if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'for': [ 'go' ], 'do': ':GoUpdateBinaries' }
Plug 'hhvm/vim-hack', { 'for': ['hack'] }
Plug 'hilojack/vim-xt'
Plug 'isRuslan/vim-es6', { 'for': [ 'js', 'jsx', 'javascript.jsx', 'mjs' ] }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'mfukar/robotframework-vim'
" Plug 'mfussenegger/nvim-dap'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'OmniSharp/omnisharp-vim', { 'for': [ 'cs' ], 'do': ':OmniSharpInstall' }
" Plug 'rcarriga/nvim-dap-ui'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' } | Plug 'deoplete-plugins/deoplete-tag' | Plug 'Shougo/deoplete-lsp'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-vdebug/vdebug'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
call plug#end()

lua <<LUA
local treesitter = package.loaded['nvim-treesitter']
local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()

require("nvim-autopairs").setup {}
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

vim.cmd.colorscheme("koehler")

vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.g.c_space_errors = 1

vim.opt.autoindent      = true
vim.opt.autoread        = true
vim.opt.background      = "dark"
vim.opt.backspace       = "indent,eol,start"
vim.opt.bomb            = false
vim.opt.colorcolumn     = "+1"
vim.opt.completeopt     = "menuone,longest"
vim.opt.copyindent      = true
vim.opt.cursorcolumn    = true
vim.opt.cursorline      = true
vim.opt.diffopt         = "filler,vertical,internal,indent-heuristic,algorithm:patience"
vim.opt.display         = "lastline"
vim.opt.encoding        = "utf-8"
vim.opt.expandtab       = true
vim.opt.exrc            = true
vim.opt.formatoptions   = "nqr12j"
vim.opt.gdefault        = true
vim.opt.hidden          = true
vim.opt.hlsearch        = true
vim.opt.ignorecase      = true
vim.opt.incsearch       = true
vim.opt.joinspaces      = false
vim.opt.laststatus      = 2
vim.opt.lazyredraw      = true
vim.opt.list            = true
vim.opt.matchtime       = 5
vim.opt.modeline        = true
vim.opt.mouse           = "a"
vim.opt.number          = true
vim.opt.previewheight   = 20
vim.opt.pumheight       = 15
vim.opt.relativenumber  = true
vim.opt.scrolloff       = 3
vim.opt.sessionoptions  = "blank,buffers,curdir,folds,help,tabpages,winsize"
vim.opt.shiftround      = true
vim.opt.shiftwidth      = 2
vim.opt.shortmess       = "acAIoOt"
vim.opt.showbreak       = ">"
vim.opt.showcmd         = true
vim.opt.showmatch       = true
vim.opt.showmode        = false
vim.opt.sidescrolloff   = 5
vim.opt.signcolumn      = "yes"
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
vim.opt.ttimeout        = true
vim.opt.undofile        = true
vim.opt.updatetime      = 300
vim.opt.virtualedit     = all
vim.opt.visualbell      = true
vim.opt.wildmenu        = true
vim.opt.wildmode        = "list:longest,list:full"
vim.opt.wrap            = false
vim.opt.listchars       = "eol:↲,precedes:«,extends:»,trail:·,tab:▸·,nbsp:¯"
vim.opt.titlestring     = [[%t%(\ [%R%M]%)]]

vim.opt.clipboard:append("unnamedplus")
vim.opt.fillchars:append { stl = " ", stlnc = "\"" }
vim.opt.nrformats:remove("octal")
vim.opt.wildignore:append("*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc")
vim.opt.wildignore:append(".svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg")
vim.opt.wildignore:append("vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*")

vim.g.editorconfig_enable = true
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
-- vim.g.netrw_list_hide= '.*\.swp$,\.DS_Store,*/tmp/*,*\.so,*\.swp,*\.zip,*\.git,^\.\.\=/\=,*\.log$'
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.g.netrw_silent = 1
vim.g.netrw_winsize = 25

vim.cmd.highlight("TermCursor", "ctermfg=yellow guifg=yellow")
vim.cmd.highlight("LineNr", "gui=bold guifg=#c6c6c6 guibg=#00005f")
vim.cmd.highlight("LineNr", "gui=bold guifg=#c6c6c6 guibg=#00005f")
vim.cmd.highlight("LineNr", "term=reverse cterm=bold ctermfg=251 ctermbg=17")
vim.cmd.highlight("NonText", "ctermfg=235 guifg=#262626")
vim.cmd.highlight("OverLength", "ctermbg=234 ctermfg=249 guibg=#1c1c1c guifg=#b2b2b2")
vim.cmd.highlight("SpellBad", "term=standout,underline cterm=underline ctermfg=1 guifg=#800000 gui=undercurl")
vim.cmd.highlight("SpellCap", "term=underline cterm=underline gui=undercurl")
vim.cmd.highlight("SpellLocal", "term=underline cterm=underline gui=undercurl")
vim.cmd.highlight("SpellRare", "term=underline cterm=underline gui=undercurl")
vim.cmd.highlight("link", "ALEErrorLine", "ErrorMsg")
vim.cmd.highlight("link", "ALEWarningLine", "WarningMsg")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Leader>l", ":set relativenumber!<Cr>")
vim.keymap.set("n", "<Leader>t", ":enew<Cr>")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "p", "p`[")
vim.keymap.set("i", "<C-b>", "<Esc>gUiwi")
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })
vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-h>"
end, { expr = true })
vim.keymap.set("i", "<Cr>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<C-g>u<Cr>"
end, { expr = true })
local FocusEvents = vim.api.nvim_create_augroup('FocusEvents', {clear = true})
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
LUA

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let $GIT_SSL_NO_VERIFY = 'true'

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_echo_msg_format = '[%linter%]% [code]% %s'
let g:ale_fixers = {
\   '*': []
\ }
let g:ale_floating_preview = 1
let g:ale_lint_delay = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_use_global_executables = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'man', 'netrw']

if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.break_on_open = 0

nnoremap : ;
nnoremap ; :
nnoremap A zzA
nnoremap H ^
nnoremap I zzI
nnoremap J mzJ`z
nnoremap L $
nnoremap Q gq
nnoremap Y y$
nnoremap _ :Lex<Cr>
nnoremap a zza
nnoremap c "xc
nnoremap gj j
nnoremap gk k
nnoremap i zzi
nnoremap { {zz
nnoremap } }zz
nnoremap <C-PageDown>  :bp<Cr>
nnoremap <C-PageUp>    :bn<Cr>
nnoremap <C-e>         3<C-e>
nnoremap <C-p>         :Denite file/rec<Cr>
nnoremap <C-y>         3<C-y>
nnoremap <Expr>j       (v:count == 0 ? 'gj' : 'j')
nnoremap <Expr>k       (v:count == 0 ? 'gk' : 'k')
nnoremap <Leader>1gD   :lua vim.lsp.buf.type_definition()<Cr>
nnoremap <Leader><C-k> :lua vim.lsp.buf.signature_help()<Cr>
nnoremap <Leader><F7>  :setlocal spell! spell? spelllang=en_us<Cr>
nnoremap <Leader><S-b> guiw
nnoremap <Leader>af    :ALEFix<Cr>
nnoremap <Leader>b     gUiw
nnoremap <Leader>d*    :DeniteCursorWord grep:.<Cr>
nnoremap <Leader>d/    :Denite grep:.<Cr>
nnoremap <Leader>do    :Denite outline<Cr>
nnoremap <Leader>gD    :lua vim.lsp.buf.implementation()<Cr>
nnoremap <Leader>gb    :Git blame<Cr>
nnoremap <Leader>gc    :Git commit<Cr>
nnoremap <Leader>gd    :GdiffSplit<Cr>
nnoremap <Leader>gl    :Git log -- %<Cr>
nnoremap <Leader>gp    :Git push<Cr>
nnoremap <Leader>gs    :Git<Cr>
nnoremap <Leader>l0    :lua vim.lsp.buf.document_symbol()<Cr>
nnoremap <Leader>lW    :lua vim.lsp.buf.workspace_symbol()<Cr>
nnoremap <Leader>ld    :lua vim.lsp.buf.declaration()<Cr>
nnoremap <Leader>lk    :lua vim.lsp.buf.hover()<Cr>

nnoremap <Leader>lr    :lua vim.lsp.buf.references()<Cr>
nnoremap <Leader>o     i<Cr><Esc>
nnoremap <Leader>q     :nohlsearch<Cr>
nnoremap <Left>        :bp<Cr>
nnoremap <M-i>         i<Space><Esc>
nnoremap <Right>       :bn<Cr>
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F2> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F3> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F4> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <F10> :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <Leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <Leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <Leader>dl :lua require'dap'.run_last()<CR>

tnoremap <Leader><Esc> <C-\><C-n>

vnoremap y y`]
vnoremap p "_dP`]
vnoremap ; :
vnoremap : ;
vnoremap * y/<C-r>"<Cr>
vnoremap ? y?<C-r>"<Cr>

xnoremap c "xc

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
call deoplete#enable()
call deoplete#custom#option('sources', {
\     '_': []
\   })
"call deoplete#enable_logging('DEBUG', $HOME . '/deoplete.log')

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

augroup InsertOutsert
  autocmd!
  autocmd InsertEnter * set nolist timeoutlen=0
  autocmd InsertLeave * set list   timeoutlen=200
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

if system('uname -r') =~? 'microsoft'
  augroup WSL
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe ', @")
  augroup END
endif

" left over FileType config below
" any project-specific settings should be included in the local config file placed
" in the root folder of that project

" Lisp
autocmd FileType lisp,scheme,art setlocal equalprg=~/dotfiles/helpers/scmindent.rkt

" Mercurial commit messages
autocmd BufNewFile,BufRead,BufEnter msg setfiletype hgcommit
autocmd FileType hgcommit setlocal textwidth=72

augroup QF
  autocmd!
  autocmd FileType qf set nobuflisted |
  \ set hidden
augroup END
