" Default settings
set nocompatible
filetype off " required by vundle

let $GIT_SSL_NO_VERIFY = 'true'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'ludovicPelle/vim-xdebug'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'tpope/vim-vividchalk'
Bundle 'mattn/zencoding-vim'
Bundle 'krisajenkins/vim-postgresql-syntax'
Bundle 'krisajenkins/vim-pipe'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

filetype plugin indent on " also required by vundle

" Status line detail:
" %f    file path
" %y    file type between braces (if defined)
" %([%R%M]%)  read-only, modified and modifiable flags between braces
" %{'!'[&ff=='default_file_format']}
"      shows a '!' if the file format is not the platform
"      default
" %{'$'[!&list]}  shows a '*' if in list mode
" %{'~'[&pm=='']}  shows a '~' if in patchmode
" (%{synIDattr(synID(line('.'),col('.'),0),'name')})
"      only for debug : display the current syntax item name
" %=    right-align following items
" #%n    buffer number
" %l/%L,%c%V  line number, total number of lines, and column number
if has('statusline')
  function! SetStatusLineStyle()
    if &stl == '' || &stl =~ 'synID'
      let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
    else
      let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
    endif
  endfunc
  " Switch between the normal and vim-debug modes in the status line
  nmap _ds :call SetStatusLineStyle()<CR>
  call SetStatusLineStyle()
  " Window title
  if has('title')
    set titlestring=%t%(\ [%R%M]%)
  endif
endif

if has("win32")
  if has("gui_running")
    set guifont=consolas:h12
    autocmd GUIEnter * simalt ~x " start out maximized, otherwise, fit to the term
  endif
  " In order: increment a number, decrement a number, enter an extended
  " character
  noremap <C-kPlus> <C-A>
  noremap <C-kMinus> <C-X>
  noremap <C-K> <C-V>
  set shellslash

  set pheader=%<%f%h%m\ %40{strftime(\"%c\",getftime(expand(\"%%\")))}%=Page\ %N
  set printoptions=formfeed:y,paper:letter,portrait:n,number:y,left:5mm,right:5mm,top:10mm,bottom:5mm,syntax:y
  set printfont=Anonymous:w4h7

  set backupdir=C:\Windows\Temp
  set directory=C:\Windows\Temp
else " might could maybe be *nix
  set shellcmdflag=-ic
  if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 10
    set lines=999 columns=999
  endif
  set backupdir=/tmp
  set directory=/tmp
endif

"colo koehler
colo vividchalk
syntax on

set list
set guioptions=aegimrLt
set ruler
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set number
set diffopt=filler,horizontal
set encoding=utf-8
set smartindent
set incsearch
set hlsearch
set laststatus=2
set showmatch
set matchtime=5
set visualbell
set showbreak=>
set hidden
set history=1000
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set title
set grepprg=grep\ -nH\ $*
set backspace=indent,eol,start
set shortmess=atIA
set scrolloff=3
set t_Co=256
set cursorline
set cursorcolumn

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

autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm set makeprg=perl
autocmd BufNewFile,BufRead *.pl,*.pm compiler perl

" Lua
autocmd FileType lua   set            textwidth=80 shiftwidth=4 tabstop=4 softtabstop=4 smarttab noexpandtab
autocmd BufEnter *.lua set autoindent textwidth=80 shiftwidth=4 tabstop=4 softtabstop=4 smarttab noexpandtab formatoptions=croql

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set            textwidth=80 shiftwidth=4 tabstop=4 softtabstop=4 smarttab expandtab
autocmd BufEnter *.py   set autoindent textwidth=80 shiftwidth=4 tabstop=4 softtabstop=4 smarttab expandtab formatoptions=croql
autocmd FileType python :let b:vimpipe_command="python"
autocmd FileType python :let b:vimpipe_filetype="python"

" C
autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8 softtabstop=8
let c_space_errors=1

" hg commit messages
autocmd BufRead,BufNewFile /tmp/hgeditor*/msg setf hgcommit
autocmd FileType hgcommit set textwidth=72

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

