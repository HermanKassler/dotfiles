return {
  -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = true,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- 'rcarriga/nvim-notify',
    },
    opts = {
      -- add any options here
    },
    config = function()
      -- vim.keymap.set('n', '<leader>x', function()
      --   require('notify').dismiss { silent = true, pending = false }
      -- end, { desc = 'Dismiss notifications' })

      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          format = {
            cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
          },
        },
        messages = {
          enabled = true,
        },
        notify = {
          enabled = false,
        },
        routes = {
          {
            -- view = 'snacks',
            filter = { event = 'msg_showmode' },
          },
        },
      }
    end,
  },
}
