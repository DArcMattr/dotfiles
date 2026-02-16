U = {}
require('utils')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.c_space_errors = 1
vim.g.editorconfig_enable = true
vim.g.loaded_perl_provider = 0
vim.g.mapleader = ','
vim.g.maplocalleader = ' '
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['_'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- load LSP servers which cover more than one filetype
vim.lsp.enable('docker-language-server')
vim.lsp.enable('html')
vim.lsp.enable('ts_ls')

local indent_highlights = {
  'Whitespace',
  'NormalFloat',
}

local lazyvim_plugins = {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    ensure_installed = {
      'bash',
      'c',
      'c_sharp',
      'comment',
      'css',
      'diff',
      'gitcommit',
      'go',
      'gomod',
      'gosum',
      'gotmpl',
      'gowork',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'php',
      'phpdoc',
      'python',
      'rst',
      'sql',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
    },
    sync_install = false,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    dependencies = {
      {
        'windwp/nvim-ts-autotag',
        opts = {},
      },
      {
        'stevearc/aerial.nvim',
        event = { 'VeryLazy' },
        keys = {
          { '<Leader>do', '<Cmd>AerialToggle!<Cr>', { silent = true } },
        },
        opts = {
          layout = {
            min_width = { 20, .1 },
            resize_to_content = true,
            default_direction = 'prefer_left',
            win_opts = {
              signcolumn = 'no',
              statuscolumn = ' ',
            },
          },
        },
      },
      {
        'ray-x/go.nvim',
        event = { 'CmdLineEnter' },
        ft = { 'go', 'gomod' },
        build = ':lua require("go.install").update_all_sync()',
        dependencies = { 'nvim-neotest/nvim-nio' },
        config = function()
          require('go').setup()
        end,
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'delphinus/cmp-ctags',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    event = { 'InsertEnter', },
    opts = function()
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()
      return {
        mapping = cmp.mapping.preset.insert({
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          ['<Cr>']      = cmp.mapping.confirm({ select = true }),
          ['<S-Cr>']    = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<C-Cr>'] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sorting = defaults.sorting,
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          {
            name = 'ctags',
            option = {
              trigger_characters_ft = {
                php = {
                  '->', '::',
                },
              },
            },
          },
        },
        window = {
          completion = cmp.config.window.bordered()
        },
      }
    end,
    version = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = { 'VeryLazy' },
    keys = function()
      local builtin = require('telescope.builtin')
      return {
        { '<C-p>',      builtin.find_files },
        { '<Leader>d*', builtin.grep_string, mode = { 'n', 'v'}, },
        { '<Leader>d/', builtin.live_grep },
        { '<Leader>ds', builtin.lsp_document_symbols },
        { '<Leader>ls', builtin.buffers },
      }
    end,
  },
  { 'Valloric/MatchTagAlways' },
  { 'jeffkreeftmeijer/vim-numbertoggle' },
  { 'mattn/emmet-vim' },
  {
    'hat0uma/csvview.nvim', config = function()
      require('csvview').setup()
    end
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
       {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('nvim-dap-virtual-text').setup()
        end
      },
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        },
      },
    },
    keys = function()
      local dap = require('dap')
      local dapui = require('dapui')
      return {
        { '<F2>',  dap.step_over, desc = 'Step Over', },
        { '<F3>',  dap.step_into, desc = 'Step Into', },
        { '<F4>',  dap.step_out, },
        { '<F5>',  dap.continue, },
        { '<F6>',  function() dap.terminate(); dapui.close() end, },
        { '<F9>',  dap.toggle_breakpoint, },
        { '<F11>', function() dap.set_exception_breakpoints('Exception') end,},
        { '<F12>', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,},
        { '<Leader>drl', dap.run_last, },
        { '<Leader>dro', dap.repl.open, },
        { '<Leader>dlc', U.utils.dapRunConfigWithArgs, },
        { '<F21>', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { silent = true},},
      }
    end,
    config = function()
      local dap   = require('dap')
      local dapui = require('dapui')

      U.dap = dap
      U.dapui = dapui

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.after.event_terminated['dapui_config']  = dapui.close
      dap.listeners.after.event_exited['dapui_config']      = dapui.close

      dapui.setup({
        icons = {
          expanded = '▾',
          collapsed = '▸',
          current_frame = '»'
        },
        layouts = {
            {
              elements = {
                'watches',
                { id = 'scopes', size = 0.5 },
                { id = 'stacks', size = 0.25 },
                { id = 'breakpoints', size = 0.1 },
                { id = 'console', size = 0.15 },
              },
              size = 79,
              position = 'right',
          },
          {
            elements = {
              'repl',
            },
            size = 0.15,
            position = 'bottom',
          },
        },
        controls = {
          enabled = true,
          element = 'repl',
          icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '↻',
            terminate = '□',
          },
        },
      })

      vim.fn.sign_define('DapBreakpoint',
        { text = '●', texthl = '', linehl = 'debugBreakpoint', numhl = 'debugBreakpoint' }
      )
      vim.fn.sign_define('DapBreakpointCondition',
        { text = '◆', texthl = '', linehl = 'debugBreakpoint', numhl = 'debugBreakpoint' }
      )
      vim.fn.sign_define('DapStopped',
        { text = '▶', texthl = '', linehl = 'debugPC', numhl = 'debugPC' }
      )
    end,
  },
  { 'mhinz/vim-signify' },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        highlight = indent_highlights,
        char = '',
      },
      whitespace = {
        highlight = indent_highlights,
        remove_blankline_trail = false,
      },
      scope = { enabled = false, },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'powerline'
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          },
          'aerial',
        },
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            mode = 4,
          },
        },
        lualine_z = { 'tabs' },
      },
    },
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = { 'dap-repl' },
      }
    end,
  },
  {
    'OmniSharp/omnisharp-vim',
    ft = { 'cs' },
    build = ':OmniSharpInstall'
  },
}

require('lazy').setup(
  vim.list_extend(
    vim.list_extend({}, lazyvim_plugins),
    U.utils.loadLocalPlugins()
  )
)

-- Globals live in U namespace
U.capabilities = require'cmp_nvim_lsp'.default_capabilities()
U.dap          = require'dap'

vim.opt.autoindent      = true
vim.opt.autoread        = true
vim.opt.background      = 'dark'
vim.opt.backspace       = { 'indent', 'eol', 'start' }
vim.opt.bomb            = false
vim.opt.cinoptions      = { 't0', '+4', '(4', 'u4', 'w1' }
vim.opt.colorcolumn     = '+1'
vim.opt.completeopt     = { 'menuone', 'longest' }
vim.opt.copyindent      = true
vim.opt.cursorcolumn    = true
vim.opt.cursorline      = true
vim.opt.cursorlineopt   = 'both'
vim.opt.diffopt         = { 'filler', 'vertical', 'internal', 'indent-heuristic', 'algorithm:patience' }
vim.opt.display         = 'lastline'
vim.opt.encoding        = 'utf-8'
vim.opt.expandtab       = true
vim.opt.exrc            = true
vim.opt.formatoptions   = 'nqr12j'
vim.opt.gdefault        = true
vim.opt.guicursor       = 'n-v-i-c:ver50-Cursor'
vim.opt.hidden          = true
vim.opt.hlsearch        = true
vim.opt.ignorecase      = true
vim.opt.incsearch       = true
vim.opt.joinspaces      = false
vim.opt.laststatus      = 2
vim.opt.lazyredraw      = true
vim.opt.list            = true
vim.opt.listchars       = { eol='↲', precedes='«', extends='»', trail='·', tab='▸·', nbsp='¯' }
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
vim.opt.signcolumn      = 'auto:2'
vim.opt.smartcase       = true
vim.opt.smarttab        = true
vim.opt.softtabstop     = 2
vim.opt.splitbelow      = true
vim.opt.startofline     = false
vim.opt.swapfile        = false
vim.opt.synmaxcol       = 512
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.timeout         = false
vim.opt.title           = true
vim.opt.titlestring     = '%t%( [%R%M]%)'
vim.opt.ttimeout        = true
vim.opt.undofile        = true
vim.opt.updatetime      = 300
vim.opt.virtualedit     = 'all'
vim.opt.visualbell      = true
vim.opt.wildmenu        = true
vim.opt.wildmode        = { 'list:longest', 'list:full' }
vim.opt.winborder       = 'rounded'
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

if vim.g.neovide then
  vim.o.guifont = 'Cascadia Code PL Light:h9'
end

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg='rg --vimgrep --no-heading --smart-case'
  vim.opt.grepformat='%f:%l:%c:%m,%f:%l:%m'
else
  vim.opt.grepprg='grep -nH $*'
end

vim.keymap.set('i', '<C-b>',   '<Esc>gUiwi')
vim.keymap.set('i', '<Cr>',    function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<C-g>u<Cr>' end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-h>' end,      { expr = true })
vim.keymap.set('i', '<Tab>',   function() return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>' end,      { expr = true })
vim.keymap.set('n', '<C-PageDown>',   ':bp<Cr>')
vim.keymap.set('n', '<C-PageUp>',     ':bn<Cr>')
vim.keymap.set('n', '<C-b>',          '<C-b>zz')
vim.keymap.set('n', '<C-d>',          '<C-d>zz')
vim.keymap.set('n', '<C-e>',          '3<C-e>')
vim.keymap.set('n', '<C-f>',          '<C-f>zz')
vim.keymap.set('n', '<C-u>',          '<C-u>zz')
vim.keymap.set('n', '<C-y>',          '3<C-y>')
vim.keymap.set('n', '<Leader><S-b>',  'gUiw')
vim.keymap.set('n', '<Leader>ss',     function() vim.opt.spell = not vim.api.nvim_get_option_value('spell', {}) end, { silent = true })
vim.keymap.set('n', '<Leader>[',      function() vim.diagnostic.jump({count = 1}) end)
vim.keymap.set('n', '<Leader>]',      function() vim.diagnostic.jump({count = -1}) end)
vim.keymap.set('n', '<Leader>a',      function() vim.opt.relativenumber = not vim.api.nvim_get_option_value('relativenumber', {}) end)
vim.keymap.set('n', '<Leader>b',      'guiw')
vim.keymap.set('n', '<Leader>gb',     ':Git blame<Cr>')
vim.keymap.set('n', '<Leader>gc',     ':Git commit<Cr>')
vim.keymap.set('n', '<Leader>gd',     ':Gdiffsplit<Cr>')
vim.keymap.set('n', '<Leader>gl',     ':Git log -- %<Cr>')
vim.keymap.set('n', '<Leader>gp',     ':Git push<Cr>')
vim.keymap.set('n', '<Leader>gs',     ':Git<Cr>')
vim.keymap.set('n', '<Leader>il',     vim.diagnostic.setloclist)
vim.keymap.set('n', '<Leader>io',     vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>o',      'i<Cr><Esc>')
-- vim.keymap.set('n', '<Leader>q',      '<Cmd>nohlsearch<Cr>')
vim.keymap.set('n', '<Leader>t',      ':enew<Cr>')
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
    local id = vim.tbl_get(ev, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)

    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', '<Leader>l<C-k>', vim.lsp.buf.signature_help,       opts)
    vim.keymap.set('n', '<Leader>l<S-d>', vim.lsp.buf.implementation,       opts)
    vim.keymap.set('n', '<Leader>l<S-w>', vim.lsp.buf.workspace_symbol,     opts)
    vim.keymap.set('n', '<Leader>la',     vim.lsp.buf.code_action,          opts)
    vim.keymap.set('n', '<Leader>ld',     vim.lsp.buf.declaration,          opts)
    vim.keymap.set('n', '<Leader>lf',     vim.lsp.buf.format,               opts)
    vim.keymap.set('n', '<Leader>lg',     vim.lsp.buf.type_definition,      opts)
    vim.keymap.set('n', '<Leader>lk',     vim.lsp.buf.hover,                opts)
    vim.keymap.set('n', '<Leader>lm',     vim.lsp.buf.format,               opts)
    vim.keymap.set('n', '<Leader>lo',     vim.lsp.buf.document_symbol,      opts)
    vim.keymap.set('n', '<Leader>lr',     vim.lsp.buf.references,           opts)
    vim.keymap.set('n', '<Leader>le',     vim.lsp.buf.definition,           opts)
    vim.keymap.set('n', '<Leader>l1',     vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>l2',     function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<Leader>l3',     vim.lsp.buf.rename, opts)
    if client == nil or not client:supports_method('textDocument/inlayHint') then
      return
    end

    -- warning: this api is not stable yet
    vim.lsp.inlay_hint.enable(true)
    vim.cmd.highlight('LspInlayHint', 'guifg=gray')
  end
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
  virtual_text = { current_line = true },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.buf.hover({border = 'rounded'})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.buf.signature_help({border = 'rounded'})

local ModeEvents = vim.api.nvim_create_augroup('ModeEvents', { clear = true })
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = {'n:i', 'v:s'},
  group = ModeEvents,
  desc = 'Disable diagnostics in insert and select mode',
  callback = function() vim.diagnostic.enable(false) end
})
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = 'i:n',
  group = ModeEvents,
  desc = 'Enable diagnostics when leaving insert mode',
  callback = function() vim.diagnostic.enable() end
})

local FocusEvents = vim.api.nvim_create_augroup('FocusEvents', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained' }, {
  pattern = '*',
  group = FocusEvents,
  callback = function()
    vim.opt.winhighlight = 'Normal:Normal,EndOfBuffer:Normal'
    vim.opt.cursorcolumn = true
    vim.opt.cursorline = true
  end
})
vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  pattern = '*',
  group = FocusEvents,
  callback = function()
    vim.opt.winhighlight = 'Normal:NormalNC,EndOfBuffer:NormalNC'
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
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  group = InsertOutsert,
  callback = function()
    vim.opt.list = true
    vim.opt.timeoutlen = 200
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end
})

local FugitiveStuffs = vim.api.nvim_create_augroup('FugitiveStuffs', { clear = true })
vim.api.nvim_create_autocmd({'QuickFixCmdPost'}, {
  group = FugitiveStuffs,
  pattern = { '*grep*' },
  command = 'cwindow',
})
vim.api.nvim_create_autocmd({'QuickFixCmdPost'}, {
  group = FugitiveStuffs,
  pattern = { '*llog*' },
  command = 'cwindow',
})
vim.api.nvim_create_autocmd({'QuickFixCmdPost'}, {
  group = FugitiveStuffs,
  pattern = { '*log*' },
  command = 'lwindow',
})
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  group = FugitiveStuffs,
  pattern = { 'fugitive://*' },
  callback = function()
      vim.opt.bufhidden = 'delete'
    end
})

local StartupStuffs = vim.api.nvim_create_augroup('StartupStuffs', { clear = true})

vim.api.nvim_create_autocmd('BufRead', {
  group = StartupStuffs,
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local bt = vim.bo[opts.buf].buftype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]

        if
          not (ft:match('commit') and ft:match('rebase'))
          and not (bt:match('quickfix') and bt:match('nofile') and bt:match('help'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
})

vim.api.nvim_create_autocmd({'WinEnter','BufEnter','BufRead','FileType'}, {
  callback = function()
    local modifiable = vim.api.nvim_get_option_value('modifiable', { scope = 'local' })

    if not(modifiable) then
      vim.opt_local.scrolloff=999
    end
    vim.api.nvim_call_function('funcs#SetColorColumn', {})
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = StartupStuffs,
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd.startinsert()
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  group = StartupStuffs,
  pattern = '*',
  command = 'normal! <C-w>='
})

vim.api.nvim_create_autocmd('QuitPre', {
  group = StartupStuffs,
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' then
      vim.cmd.lclose()
    end
  end
})

vim.api.nvim_create_user_command(
  'Silent',
  U.utils.silent_execute_shell,
  { nargs = 1, complete = 'shellcmd', }
)

vim.api.nvim_create_user_command(
  'DiffOrig',
  U.utils.diff_orig,
  {
    nargs = 0,
    desc = 'Diff the current buffer against the file on disk'
  }
)

-- adapted from https://gist.github.com/tarruda/5158535
if vim.env.TMUX then
  vim.keymap.set('n', '<C-w>h',            function() U.utils.tmux_move('h') end, { desc = 'Move Left (tmux aware)',  silent = true })
  vim.keymap.set('n', '<C-w>j',            function() U.utils.tmux_move('j') end, { desc = 'Move Down (tmux aware)',  silent = true })
  vim.keymap.set('n', '<C-w>k',            function() U.utils.tmux_move('k') end, { desc = 'Move Up (tmux aware)',    silent = true })
  vim.keymap.set('n', '<C-w>l',            function() U.utils.tmux_move('l') end, { desc = 'Move Right (tmux aware)', silent = true })
  vim.keymap.set('n', '<C-w>left',         function() U.utils.tmux_move('h') end, { desc = 'Move Left (tmux aware)',  silent = true })
  vim.keymap.set('n', '<C-w>up',           function() U.utils.tmux_move('k') end, { desc = 'Move Up (tmux aware)',    silent = true })
  vim.keymap.set('n', '<C-w>down',         function() U.utils.tmux_move('j') end, { desc = 'Move Down (tmux aware)',  silent = true })
  vim.keymap.set('n', '<C-w>right',        function() U.utils.tmux_move('l') end, { desc = 'Move Right (tmux aware)', silent = true })
  vim.keymap.set('t', '<C-\\><C-N><C-w>h', function() U.utils.tmux_move('h') end, { desc = 'Move Left (tmux aware)',  silent = true })
  vim.keymap.set('t', '<C-\\><C-N><C-w>j', function() U.utils.tmux_move('j') end, { desc = 'Move Down (tmux aware)',  silent = true })
  vim.keymap.set('t', '<C-\\><C-N><C-w>k', function() U.utils.tmux_move('k') end, { desc = 'Move Up (tmux aware)',    silent = true })
  vim.keymap.set('t', '<C-\\><C-N><C-w>l', function() U.utils.tmux_move('l') end, { desc = 'Move Right (tmux aware)', silent = true })
end

vim.cmd([[
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
  \   | wincmd p | diffthis
endif
]])

vim.cmd.colorscheme('koehler')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Cursor', { })
vim.api.nvim_set_hl(0, 'TermCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
vim.api.nvim_set_hl(0, 'CursorColumn', { reverse = true, blend = 50 })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NonText', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#111111' })

vim.cmd.highlight('LineNr',     'gui=bold guifg=#c6c6c6 guibg=#00005f term=reverse cterm=bold ctermfg=251 ctermbg=17')
vim.cmd.highlight('SpellBad',   'term=standout,undercurl cterm=undercurl ctermfg=1 guifg=#800000 gui=undercurl guisp=#8080f0')
vim.cmd.highlight('SpellCap',   'term=undercurl cterm=undercurl gui=undercurl')
vim.cmd.highlight('SpellLocal', 'term=undercurl cterm=undercurl gui=undercurl')
vim.cmd.highlight('SpellRare',  'term=undercurl cterm=undercurl gui=undercurl')
vim.cmd.highlight('NormalNC',   'ctermbg=darkgrey guibg=#181818')
