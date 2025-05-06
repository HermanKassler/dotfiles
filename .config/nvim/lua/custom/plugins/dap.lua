return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()

      require('nvim-dap-virtual-text').setup()

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
      vim.keymap.set('n', '<space>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<space>gb', dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set('n', '<space>d?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<F1>', dap.continue)
      vim.keymap.set('n', '<F2>', dap.step_into)
      vim.keymap.set('n', '<F3>', dap.step_over)
      vim.keymap.set('n', '<F4>', dap.step_out)
      vim.keymap.set('n', '<F5>', dap.step_back)
      vim.keymap.set('n', '<F6>', dap.terminate)
      vim.keymap.set('n', '<F13>', dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      -- dap.adapters.gdb = {
      --   type = 'executable',
      --   command = 'gdb',
      --   args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
      -- }

      require('dap-python').setup 'python3'

      -- dap.configurations.java = {
      --   {
      --     type = 'java_language_server',
      --     request = 'attach',
      --     name = 'Debug (Attach) - Remote',
      --     hostName = '127.0.0.1',
      --     port = 5005,
      --   },
      -- }

      dap.adapters.codelldb = {
        type = 'executable',
        command = os.getenv 'HOME' .. '.local/share/nvim/mason/opt/bin/lldb', -- adjust as needed, must be absolute path
        name = 'lldb',
      }

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        ensure_installed = { 'debugpy', 'codelldb' },
        handlers = {},
      }
    end,
  },
}
