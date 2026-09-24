return {
  {
    'echasnovski/mini.nvim',
    event = 'VimEnter',
    config = function()
      vim.api.nvim_create_autocmd('UIEnter', {
        once = true,
        callback = function()
          require('mini.ai').setup { n_lines = 500 }
          require('mini.surround').setup()
          require('mini.move').setup()
          require('mini.operators').setup {
            exchange = {
              prefix = 'ge',
            },
            replace = {
              prefix = 'gp',
              -- Whether to reindent new text to match previous indent
              reindent_linewise = true,
            },
          }
          require('mini.align').setup {
            modifiers = {
              -- Use 'T' modifier to remove both whitespace and indent
              T = function(steps, _)
                table.insert(steps.pre_justify, require('mini.align').gen_step.trim('both', 'remove'))
              end,
            },
          }
        end,
      })

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- Function to show macro recording status
      local function macro_status()
        local reg = vim.fn.reg_recording()
        if reg == '' then
          return ''
        else
          return 'REC @' .. reg .. ' '
        end
      end

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return macro_status() .. '%2l:%-2v'
      end
    end,
  },
}
