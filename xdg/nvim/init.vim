if !1 | finish | endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'fatih/vim-go', { 'for': [ 'go' ], 'do': ':GoUpdateBinaries' }
Plug 'isRuslan/vim-es6', { 'for': [ 'js', 'jsx', 'javascript.jsx', 'mjs' ] }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'reedes/vim-wheel'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' } | Plug 'deoplete-plugins/deoplete-tag' | Plug 'Shougo/deoplete-lsp'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-vdebug/vdebug'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'dense-analysis/ale'
call plug#end()

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=+1
set completeopt=menuone,longest
set copyindent
set diffopt=filler,vertical,internal,indent-heuristic,algorithm:patience
set display+=lastline
set encoding=utf-8
set expandtab
set fillchars+=stl:\ ,stlnc:\
set formatoptions=nqr12j
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-
set laststatus=2
set lazyredraw
set list
set listchars=eol:↲,precedes:«,extends:»,trail:·,tab:▸·,nbsp:¯
set matchtime=5
set modeline
set mouse=a
set nobomb
set nojoinspaces
set noshowmode
set nostartofline
set noswapfile
set nowrap
set nrformats-=octal
set number
set previewheight=20
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set pumheight=15
set relativenumber
set scrolloff=3
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set shiftround
set shiftwidth=2
set shortmess=acAIoOt
set showbreak=>
set showcmd
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=2
set splitbelow
set synmaxcol=512
set tabstop=2
set termguicolors
set textwidth=80
set title
set titlestring=%t%(\ [%R%M]%)
set notimeout
set ttimeout
set undofile
set updatetime=300
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg
set wildignore+=*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*

colorscheme vividchalk

highlight clear SignColumn
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

highlight link ALEErrorLine ErrorMsg
highlight link ALEWarningLine WarningMsg

highlight Comment ctermfg=105 guifg=#8787ff
highlight CursorColumn cterm=reverse gui=reverse
highlight CursorLine cterm=underline gui=underline ctermbg=NONE guibg=NONE
highlight ErrorMsg ctermbg=NONE guibg=NONE
highlight LineNr gui=bold guifg=#c6c6c6 guibg=#00005f
highlight LineNr term=reverse cterm=bold ctermfg=251 ctermbg=17
highlight NonText ctermfg=235 guifg=#262626
highlight Normal ctermbg=NONE guibg=NONE
highlight OverLength ctermbg=234 ctermfg=249 guibg=#1c1c1c guifg=#b2b2b2
highlight Search ctermfg=222 guifg=#ffdf87
highlight SpecialKey ctermfg=235 guifg=#262626
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline guifg=#800000 gui=undercurl
highlight SpellCap term=underline cterm=underline gui=undercurl
highlight SpellLocal term=underline cterm=underline gui=undercurl
highlight SpellRare term=underline cterm=underline gui=undercurl
highlight TermCursor ctermfg=yellow guifg=yellow

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = ","
let maplocalleader = " "
let c_space_errors = 1
let $GIT_SSL_NO_VERIFY = 'true'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_fixers = {
\   '*': []
\ }
let g:ale_lint_delay = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_open_list = 1
let g:ale_set_balloons = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
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

noremap <C-d>     <C-d>zz
noremap <C-u>     <C-u>zz
noremap <Leader>l <Cmd>set rnu!<Cr>
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
nnoremap <C-PageDown>       <Cmd>bp<Cr>
nnoremap <C-PageUp>         <Cmd>bn<Cr>
nnoremap <C-e>              3<C-e>
nnoremap <C-i>              i<Space><Esc>
nnoremap <C-o>              i<Cr><Esc>
nnoremap <C-p>              <Cmd>Denite file/rec<Cr>
nnoremap <C-y>              3<C-y>
nnoremap <Leader>/          <Cmd>Denite grep:.<Cr>
nnoremap <Leader><F7>       <Cmd>setlocal spell! spell? spelllang=en_us<Cr>
nnoremap <Leader>gb         <Cmd>Gblame<Cr>
nnoremap <Leader>gc         <Cmd>Gcommit<Cr>
nnoremap <Leader>gd         <Cmd>Gdiff<Cr>
nnoremap <Leader>gl         <Cmd>Glog -- %<Cr>
nnoremap <Leader>gp         <Cmd>Gpush<Cr>
nnoremap <Leader>gs         <Cmd>Gstatus<Cr>
nnoremap <Leader>b          gUiw
nnoremap <Leader><S-b>      guiw
nnoremap <Leader>o          <Cmd>Denite outline<Cr>
nnoremap <Leader>q          <Cmd>nohlsearch<Cr>
nnoremap <Leader>*          <Cmd>DeniteCursorWord grep:.<Cr>
nnoremap <Expr>j            (v:count == 0 ? 'gj' : 'j')
nnoremap <Expr>k            (v:count == 0 ? 'gk' : 'k')
nnoremap <Right>            <Cmd>bn<Cr>
nnoremap <Left>             <Cmd>bp<Cr>
nnoremap <Silent><Leader>lk <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Silent>gD         <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <Silent><c-k>      <Cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <Silent>1gD        <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <Silent>gr         <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap <Silent>g0         <Cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <Silent>gW         <Cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <Silent>gd         <Cmd>lua vim.lsp.buf.declaration()<CR>

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

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep

  " Use ag in denite grep source.
  call denite#custom#var( 'grep', 'command',      ['ag'] )
  call denite#custom#var( 'grep', 'default_opts', ['-i', '--vimgrep'] )
  call denite#custom#var( 'grep', 'recursive_opts', [] )
  call denite#custom#var( 'grep', 'pattern_opt', [] )
  call denite#custom#var( 'grep', 'separator', ['--'] )
  call denite#custom#var( 'grep', 'final_opts', [] )
elseif executable('ack')
  set grepprg=ack\ -H\ --nogroup\ --nocolor

  " Use ack in denite grep source.
  call denite#custom#var( 'grep', 'command', ['ack'] )
  call denite#custom#var( 'grep', 'default_opts',
  \     ['--ackrc', $HOME.'/.ackrc', '-H',
  \      '--nopager', '--nocolor', '--nogroup', '--column'] )
  call denite#custom#var( 'grep', 'recursive_opts', [] )
  call denite#custom#var( 'grep', 'pattern_opt', ['--match'] )
  call denite#custom#var( 'grep', 'separator', ['--'] )
  call denite#custom#var( 'grep', 'final_opts', [] )
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

augroup FastEscape
  autocmd!
  autocmd InsertEnter * set timeoutlen=0
  autocmd InsertLeave * set timeoutlen=200
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

augroup CursorColumn
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorcolumn
  setlocal cursorcolumn
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  setlocal cursorline
augroup END

augroup ShowListChars
  autocmd!
  autocmd InsertEnter * set nolist
  autocmd InsertLeave * set list
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

if system('uname -r') =~ 'Microsoft'
  augroup WSL
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ', @")
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
