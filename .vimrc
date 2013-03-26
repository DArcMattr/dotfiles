filetype off " required by vundle

let $GIT_SSL_NO_VERIFY = 'true'
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'krisajenkins/vim-pipe'
Bundle 'krisajenkins/vim-postgresql-syntax'
Bundle 'ludovicPelle/vim-xdebug'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'phleet/vim-mercenary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tsaleh/vim-matchit'

filetype plugin indent on " also required by vundle

if has("win32")
  if has("gui_running")
    set guifont=consolas:h12
    autocmd GUIEnter * simalt ~x " start out maximized, else, fit to term
  endif
  " In order: increment a number, decrement a number, enter an extended
  " character
  noremap <C-kPlus> <C-A>
  noremap <C-kMinus> <C-X>
  noremap <C-K> <C-V>
  set shellslash
  set printfont=consolas:h7

  set backupdir=%TEMP%
  set directory=%TEMP%
else " might could maybe be *nix
  set shellcmdflag=-ic
  set printfont=DejaVu\ Sans\ Mono\ 7
  if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 12
    set lines=999 columns=999
  endif

  set backupdir=/tmp
  set directory=/tmp
endif

colorscheme vividchalk
syntax on

set autoread
set backspace=indent,eol,start
set diffopt=filler,horizontal
set encoding=utf-8
set expandtab
set fillchars+=stl:\ ,stlnc:\
set grepprg=grep\ -nH\ $*
set guioptions=aegimrLt
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set matchtime=5
set nocompatible
set noshowmode
set number
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set ruler
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim
set scrolloff=3
set shiftwidth=2
set shortmess=atIA
set showbreak=>
set showmatch
set smartcase
set smartindent
set softtabstop=2
set t_Co=256
set tabstop=2
set title
set visualbell
set wildmenu
set wildmode=list:longest

" Window title
if has('title')
  set titlestring=%t%(\ [%R%M]%)
endif

" key remappings - toggle spell checking
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <C-o>:setlocal spell! spelllang=en_us<cr>

" almost removes an HTML tag pair
" map <C-F8> vat<Esc>`<df>`>F<df>

map <C-Tab> gt
map <C-S-Tab> gT

nmap j gj
nmap k gk

nnoremap ' `
nnoremap ` '
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

let mapleader = ","

" Trim whitespace from the end of lines
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm set makeprg=perl
autocmd BufNewFile,BufRead *.pl,*.pm compiler perl

" Lua
autocmd FileType lua set textwidth=80 shiftwidth=4 tabstop=4
  \ softtabstop=4 smarttab noexpandtab colorcolumn=+1
autocmd BufEnter *.lua set autoindent textwidth=80 shiftwidth=4
  \ tabstop=4 softtabstop=4 smarttab noexpandtab formatoptions=croql
  \ colorcolumn=+1

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set textwidth=80 shiftwidth=4 tabstop=4
  \ softtabstop=4 smarttab expandtab colorcolumn=+1
autocmd BufEnter *.py set autoindent textwidth=80 shiftwidth=4
  \ tabstop=4 softtabstop=4 smarttab expandtab formatoptions=croql
  \ colorcolumn=+1
autocmd FileType python :let b:vimpipe_command="python"
autocmd FileType python :let b:vimpipe_filetype="python"

" C
autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8
  \ softtabstop=8
let c_space_errors=1

" hg commit messages
autocmd BufRead,BufNewFile /tmp/hgeditor*/msg setf hgcommit
autocmd FileType hgcommit set textwidth=72 colorcolumn=+1

" PostgreSQL
autocmd BufNewFile,BufRead *.psql setf postgresql
autocmd FileType postgresql :let b:vimpipe_command="psql mydatabase"
autocmd FileType postgresql :let b:vimpipe_filetype="postgresql"

" Apache
autocmd BufNewFile,BufRead *.conf setf apache

autocmd BufRead *.aspx set filetype=html
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \  if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \  endif
endif
