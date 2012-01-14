" Default settings
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

function InitBackupDir() 
  if has('win32') || has('win32unix') "windows/cygwin 
    let separator = "_" 
  else 
    let separator = "." 
  endif 

  let parent = $HOME .'/' . separator . 'vim/' 
  let backup = parent . 'backup/' 
  let tmp    = parent . 'tmp/' 

  if exists("*mkdir") 
    if !isdirectory(parent) 
      call mkdir(parent) 
    endif 
    if !isdirectory(backup) 
      call mkdir(backup) 
    endif 
    if !isdirectory(tmp) 
      call mkdir(tmp) 
    endif 
  endif 

  let missing_dir = 0 
  if isdirectory(tmp) 
    execute 'set backupdir=' . escape(backup, " ") . "/,." 
  else 
    let missing_dir = 1 
  endif 
  if isdirectory(backup) 
    execute 'set directory=' . escape(tmp, " ") . "/,." 
  else 
    let missing_dir = 1 
  endif 
   
  if missing_dir 
    echo "Warning: Unable to create backup directories: " . backup ." and " . tmp 
    echo "Try: mkdir -p " . backup 
    echo "and: mkdir -p " . tmp 
    set backupdir=. 
    set directory=. 
  endif   
endfunction 

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
  function SetStatusLineStyle()
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

if has("gui")
  set guifont=Liberation\ Mono\ 10
endif

if has("win32")
"  set backupdir=$VIM\\_backup\\,$TEMP\\_backup\\
"  set directory=$VIM\\_backup\\,$TEMP\\_backup\\
  if has("gui")
    " start out maximized, otherwise, fit to the term
    autocmd GUIEnter * simalt ~x
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
endif

colo koehler
" set guioptions=a
set ruler
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set number
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
set shortmess=atI
set scrolloff=3

call InitBackupDir()

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

autocmd BufNewFile,BufRead *.pl,*.pm set makeprg=perl
autocmd BufNewFile,BufRead *.pl,*.pm compiler perl
autocmd FileType python set omnifunc=pythoncomplete#Complete

" PostgreSQL 
autocmd BufNewFile,BufRead *.psql setf psql

autocmd BufRead *.aspx set filetype=html
filetype plugin on
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \  if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \  endif
endif
