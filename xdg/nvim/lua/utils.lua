U.utils = {}

-- @link https://github.com/timtyrrell/dotfiles/blob/main/debugHelper.lua
-- global function that loads a dap config and prompts for input args
function U.utils.dapRunConfigWithArgs()
  local dap = require('dap')
  local ft = vim.bo.filetype
  if ft == "" then
      print("Filetype option is required to determine which dap configs are available")
      return
  end
  local configs = dap.configurations[ft]
  if configs == nil then
      print("Filetype \"" .. ft .. "\" has no dap configs")
      return
  end
  local mConfig = nil
  vim.ui.select(
      configs,
      {
          prompt = "Select config to run: ",
          format_item = function(config)
              return config.name
          end
      },
      function(config)
          mConfig = config
      end
  )

  -- redraw to make ui selector disappear
  vim.api.nvim_command("redraw")

  if mConfig == nil then
      return
  end
  vim.ui.input(
      {
          prompt = mConfig.name .." - with args: ",
      },
      function(input)
          if input == nil then
              return
          end
          local args = vim.split(input, ' ', true)
          mConfig.args = args
          dap.run(mConfig)
      end
  )
end

function U.utils.tmux_move(direction)
  local oldw = vim.fn.winnr()

  vim.cmd('silent! wincmd ' .. direction)
  local neww = vim.fn.winnr()

  -- Move back to original window
  vim.cmd('silent! ' .. oldw .. 'wincmd w')

  if oldw == neww then
    local tmux_commands = {
      j = "tmux select-pane -D",
      k = "tmux select-pane -U",
      h = "tmux select-pane -L",
      l = "tmux select-pane -R"
    }

    local cmd = tmux_commands[direction]
    if cmd then
      vim.fn.system(cmd)
    end
  else
    vim.cmd('wincmd ' .. direction)
  end
end
