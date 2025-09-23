return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = 'VimEnter',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.move').setup()
      require('mini.align').setup {
        modifiers = {
          -- Use 'T' modifier to remove both whitespace and indent
          T = function(steps, _)
            table.insert(steps.pre_justify, require('mini.align').gen_step.trim('both', 'remove'))
          end,
        },
      }
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      local function macro_status()
        local reg = vim.fn.reg_recording()
        if reg == '' then
          return ''
        else
          return 'REC @' .. reg .. ' '
        end
      end
      --
      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return macro_status() .. '%2l:%-2v'
      end
      -- Function to show macro recording status

      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
