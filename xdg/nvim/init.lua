U = {}
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
-- Plug('Shougo/deoplete-lsp')
-- Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
-- Plug('deoplete-plugins/deoplete-tag')
Plug('OmniSharp/omnisharp-vim', { ['for'] = { 'cs' }, ['do'] = ':OmniSharpInstall' })
Plug('Shougo/denite.nvim', { ['do'] = ':UpdateRemotePlugins' })
Plug('Shougo/neco-syntax')
Plug('Shougo/neco-vim')
Plug('StanAngeloff/php.vim', {['for'] = 'php'})
Plug('Valloric/MatchTagAlways')
Plug('akinsho/bufferline.nvim')
Plug('fatih/vim-go', { ['for'] = 'go', ['do'] = ':GoUpdateBinaries' })
Plug('hhvm/vim-hack', { ['for'] = 'hack' })
Plug('hilojack/vim-xt')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('isRuslan/vim-es6', { ['for'] = { 'js', 'jsx', 'javascript.jsx', 'mjs' } })
Plug('jeffkreeftmeijer/vim-numbertoggle')
Plug('mattn/emmet-vim')
Plug('mfukar/robotframework-vim')
Plug('mfussenegger/nvim-dap')
Plug('mhinz/vim-signify')
Plug('nathanaelkane/vim-indent-guides')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('rcarriga/nvim-dap-ui')
Plug('sheerun/vim-polyglot')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('vim-scripts/DirDiff.vim')
Plug('vim-scripts/csv.vim')
Plug('windwp/nvim-autopairs')
Plug('windwp/nvim-ts-autotag')
vim.call('plug#end')

local cmp = require'cmp'
local lspconfig = require'lspconfig'
local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
local treesitter = package.loaded['nvim-treesitter']

require'bufferline'.setup {}
require'dapui'.setup {}
require'lualine'.setup {
  options = { theme = 'powerline' }
}
require'nvim-autopairs'.setup {}
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
vim.keymap.set('n', '<F10>',          require'dap'.toggle_breakpoint)
vim.keymap.set('n', '<F2>',           require'dap'.step_over)
vim.keymap.set('n', '<F3>',           require'dap'.step_into)
vim.keymap.set('n', '<F4>',           require'dap'.step_out)
vim.keymap.set('n', '<F5>',           require'dap'.continue)
vim.keymap.set('n', '<Leader><S-F5>', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader><S-b>',  'gUiw')
vim.keymap.set('n', '<Leader>a',      function() vim.opt.relativenumber = not(vim.opt.relativenumber:get()) end)
vim.keymap.set('n', '<Leader>b',      'guiw')
vim.keymap.set('n', '<Leader>d*',     ':DeniteCursorWord grep:.<Cr>')
vim.keymap.set('n', '<Leader>d/',     ':Denite grep:.<Cr>')
vim.keymap.set('n', '<Leader>dl',     require'dap'.run_last)
vim.keymap.set('n', '<Leader>do',     ':Denite outline<Cr>')
vim.keymap.set('n', '<Leader>dp',     function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { silent = true})
vim.keymap.set('n', '<Leader>dr',     require'dap'.repl.open)
vim.keymap.set('n', '<Leader>gb',     ':Git blame<Cr>')
vim.keymap.set('n', '<Leader>gc',     ':Git commit<Cr>')
vim.keymap.set('n', '<Leader>gd',     ':Gdiffsplit<Cr>')
vim.keymap.set('n', '<Leader>gl',     ':Git log -- %<Cr>')
vim.keymap.set('n', '<Leader>gp',     ':Git push<Cr>')
vim.keymap.set('n', '<Leader>gs',     ':Git<Cr>')
vim.keymap.set('n', '<Leader>il',     vim.diagnostic.setloclist)
vim.keymap.set('n', '<Leader>io',     vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>[',      vim.diagnostic.goto_prev)
vim.keymap.set('n', '<Leader>]',      vim.diagnostic.goto_next)
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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', '<Leader>l0',     vim.lsp.buf.document_symbol,      opts)
    vim.keymap.set('n', '<Leader>l<C-k>', vim.lsp.buf.signature_help,       opts)
    vim.keymap.set('n', '<Leader>l<S-d>', vim.lsp.buf.implementation,       opts)
    vim.keymap.set('n', '<Leader>l<S-w>', vim.lsp.buf.workspace_symbol,     opts)
    vim.keymap.set('n', '<Leader>ld',     vim.lsp.buf.declaration,          opts)
    vim.keymap.set('n', '<Leader>lf',     vim.lsp.buf.format,               opts)
    vim.keymap.set('n', '<Leader>lg',     vim.lsp.buf.type_definition,      opts)
    vim.keymap.set('n', '<Leader>lk',     vim.lsp.buf.hover,                opts)
    vim.keymap.set('n', '<Leader>lr',     vim.lsp.buf.references,           opts)
    vim.keymap.set('n', '<Leader>le',     vim.lsp.buf.definition,           opts)
    vim.keymap.set('n', '<Leader>l1',     vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>l2',    function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
    vim.keymap.set('n', '<Leader>l3',     vim.lsp.buf.rename, opts)
  end
})

cmp.setup({
	window = {
		completion = cmp.config.window.bordered()
	},
	mapping = {
		['<C-b>']     = cmp.mapping.scroll_docs(-4),
		['<C-f>']     = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>']     = cmp.mapping.abort(),
		['<CR>']      = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp'},
		{ name = 'buffer'},
	}
})
U.capabilities = require'cmp_nvim_lsp'.default_capabilities()

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

vim.cmd([[
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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
]])
