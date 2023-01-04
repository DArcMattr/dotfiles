if !1 | finish | endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'embear/vim-localvimrc'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'for': [ 'go' ], 'do': ':GoUpdateBinaries' }
Plug 'hhvm/vim-hack', { 'for': ['hack'] }
Plug 'hilojack/vim-xt'
Plug 'isRuslan/vim-es6', { 'for': [ 'js', 'jsx', 'javascript.jsx', 'mjs' ] }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mfukar/robotframework-vim'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'OmniSharp/omnisharp-vim', { 'for': [ 'cs' ], 'do': ':OmniSharpInstall' }
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
call plug#end()

set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=+1
set completeopt=menuone,longest
set diffopt=filler,vertical,internal,indent-heuristic,algorithm:patience
set fillchars+=stl:\ ,stlnc:\
set formatoptions=nqr12j
set listchars=eol:↲,precedes:«,extends:»,trail:·,tab:▸·,nbsp:¯
set nrformats-=octal
set previewheight=20
set pumheight=15
set scrolloff=3
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set shortmess=acAIoOt
set showbreak=>
set sidescrolloff=5
set signcolumn=yes
set synmaxcol=512
set titlestring=%t%(\ [%R%M]%)
set updatetime=300
set virtualedit=all
set wildignore+=*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*
set wildmode=list:longest,list:full

setlocal cursorcolumn
setlocal cursorline

highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

highlight link ALEErrorLine ErrorMsg
highlight link ALEWarningLine WarningMsg

highlight LineNr     gui=bold       guifg=#c6c6c6   guibg=#00005f
highlight LineNr     term=reverse   cterm=bold      ctermfg=251    ctermbg=17
highlight NonText    ctermfg=235    guifg=#262626
highlight OverLength ctermbg=234    ctermfg=249     guibg=#1c1c1c  guifg=#b2b2b2
highlight SpellBad   term=standout,underline        cterm=underline ctermfg=1 guifg=#800000 gui=undercurl
highlight SpellCap   term=underline cterm=underline gui=undercurl
highlight SpellLocal term=underline cterm=underline gui=undercurl
highlight SpellRare  term=underline cterm=underline gui=undercurl
highlight TermCursor ctermfg=yellow guifg=yellow

augroup FocusEvents
  autocmd!
  autocmd FocusGained * highlight Normal ctermbg=none     guibg=none
  autocmd FocusGained * setlocal cursorcolumn cursorline
  autocmd FocusLost   * highlight Normal ctermbg=darkgrey guibg=#181818
  autocmd FocusLost   * setlocal nocursorcolumn nocursorline
augroup END

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = ","
let maplocalleader = " "
let c_space_errors = 1
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
let g:AutoPairsShortcutToggle = '<Leader>ap'
let g:AutoPairsShortcutFastWrap = '<Leader>ae'
let g:AutoPairsShortcutJump = '<Leader>an'
let g:AutoPairsShortcutBackInsert = '<Leader>ab'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'man', 'netrw']
let g:localvimrc_persistent = 1
let g:localvimrc_sandbox = 0
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,*/tmp/*,*\.so,*\.swp,*\.zip,*\.git,^\.\.\=/\=,*\.log$'
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_silent = 1
let g:netrw_winsize = 25

if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.break_on_open = 0

noremap <C-d>     <C-d>zz
noremap <C-u>     <C-u>zz
noremap <Leader>l <Cmd>set relativenumber!<Cr>
noremap <Leader>t <Cmd>enew<Cr>
noremap N         Nzz
noremap n         nzz
noremap p         p`[

inoremap <C-b>         <Esc>gUiw
inoremap <Expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <Expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <Expr><Cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<Cr>"

nnoremap : ;
nnoremap ; :
nnoremap A zzA
nnoremap H ^
nnoremap I zzI
nnoremap J mzJ`z
nnoremap L $
nnoremap Q gq
nnoremap Y y$
nnoremap _ <Cmd>Lex<Cr>
nnoremap a zza
nnoremap c "xc
nnoremap gj j
nnoremap gk k
nnoremap i zzi
nnoremap { {zz
nnoremap } }zz
nnoremap <C-PageDown>  <Cmd>bp<Cr>
nnoremap <C-PageUp>    <Cmd>bn<Cr>
nnoremap <C-e>         3<C-e>
nnoremap <C-p>         <Cmd>Denite file/rec<Cr>
nnoremap <C-y>         3<C-y>
nnoremap <Expr>j       (v:count == 0 ? 'gj' : 'j')
nnoremap <Expr>k       (v:count == 0 ? 'gk' : 'k')
nnoremap <Leader>1gD   <Cmd>lua vim.lsp.buf.type_definition()<Cr>
nnoremap <Leader><C-k> <Cmd>lua vim.lsp.buf.signature_help()<Cr>
nnoremap <Leader><F7>  <Cmd>setlocal spell! spell? spelllang=en_us<Cr>
nnoremap <Leader><S-b> guiw
nnoremap <Leader>af    <Cmd>ALEFix<Cr>
nnoremap <Leader>b     gUiw
nnoremap <Leader>d*    <Cmd>DeniteCursorWord grep:.<Cr>
nnoremap <Leader>d/    <Cmd>Denite grep:.<Cr>
nnoremap <Leader>do    <Cmd>Denite outline<Cr>
nnoremap <Leader>gD    <Cmd>lua vim.lsp.buf.implementation()<Cr>
nnoremap <Leader>gb    <Cmd>Git blame<Cr>
nnoremap <Leader>gc    <Cmd>Git commit<Cr>
nnoremap <Leader>gd    <Cmd>GdiffSplit<Cr>
nnoremap <Leader>gl    <Cmd>Git log -- %<Cr>
nnoremap <Leader>gp    <Cmd>Git push<Cr>
nnoremap <Leader>gs    <Cmd>Git<Cr>
nnoremap <Leader>l0    <Cmd>lua vim.lsp.buf.document_symbol()<Cr>
nnoremap <Leader>lW    <Cmd>lua vim.lsp.buf.workspace_symbol()<Cr>
nnoremap <Leader>ld    <Cmd>lua vim.lsp.buf.declaration()<Cr>
nnoremap <Leader>lk    <Cmd>lua vim.lsp.buf.hover()<Cr>
nnoremap <Leader>lr    <Cmd>lua vim.lsp.buf.references()<Cr>
nnoremap <Leader>o     i<Cr><Esc>
nnoremap <Leader>q     <Cmd>nohlsearch<Cr>
nnoremap <Left>        <Cmd>bp<Cr>
nnoremap <M-i>         i<Space><Esc>
nnoremap <Right>       <Cmd>bn<Cr>

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
\   execute '<Cmd>silent !'.<q-args> |
\   <Cmd>redraw!<Cr>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
  \   | wincmd p | diffthis
endif

" from https://gist.github.com/tarruda/5158535
if exists('$TMUX')
  nnoremap <silent> <C-w>j <Cmd>call funcs#TmuxMove('j')<Cr>
  nnoremap <silent> <C-w>k <Cmd>call funcs#TmuxMove('k')<Cr>
  nnoremap <silent> <C-w>h <Cmd>call funcs#TmuxMove('h')<Cr>
  nnoremap <silent> <C-w>l <Cmd>call funcs#TmuxMove('l')<Cr>
  nnoremap <silent> <C-w><down> <Cmd>silent call funcs#TmuxMove('j')<Cr>
  nnoremap <silent> <C-w><up> <Cmd>silent call funcs#TmuxMove('k')<Cr>
  nnoremap <silent> <C-w><left> <Cmd>silent call funcs#TmuxMove('h')<Cr>
  nnoremap <silent> <C-w><right> <Cmd>silent call funcs#TmuxMove('l')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>j <Cmd>silent call funcs#TmuxMove('j')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>k <Cmd>silent call funcs#TmuxMove('k')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>h <Cmd>silent call funcs#TmuxMove('h')<Cr>
  tnoremap <silent> <C-\><C-N><C-w>l <Cmd>silent call funcs#TmuxMove('l')<Cr>

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
" any project-specific settings should be included in the .lvimrc file placed
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

lua <<LUA
local treesitter = package.loaded['nvim-treesitter']
local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()

require'nvim-treesitter.configs'.setup {
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

vim.o.autoindent      = true
vim.o.autoread        = true
vim.o.background      = "dark"
vim.o.bomb            = false
vim.o.copyindent      = true
vim.o.display         = "lastline"
vim.o.encoding        = "utf-8"
vim.o.expandtab       = true
vim.o.gdefault        = true
vim.o.hidden          = true
vim.o.hlsearch        = true
vim.o.ignorecase      = true
vim.o.incsearch       = true
vim.o.joinspaces      = false
vim.o.laststatus      = 2
vim.o.lazyredraw      = true
vim.o.list            = true
vim.o.matchtime       = 5
vim.o.modeline        = true
vim.o.mouse           = "a"
vim.o.number          = true
vim.o.relativenumber  = true
vim.o.shiftround      = true
vim.o.shiftwidth      = 2
vim.o.showcmd         = true
vim.o.showmatch       = true
vim.o.showmode        = false
vim.o.smartcase       = true
vim.o.smarttab        = true
vim.o.softtabstop     = 2
vim.o.splitbelow      = true
vim.o.startofline     = false
vim.o.swapfile        = false
vim.o.tabstop         = 2
vim.o.termguicolors   = true
vim.o.textwidth       = 80
vim.o.timeout         = false
vim.o.title           = true
vim.o.ttimeout        = true
vim.o.undofile        = true
vim.o.visualbell      = true
vim.o.wildmenu        = true
vim.o.wrap            = false

vim.g.editorconfig_enable = true
LUA
