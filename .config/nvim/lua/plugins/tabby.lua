return {
  {
    'nanozuki/tabby.nvim',
    opts = {},
    event = 'UIEnter',
    config = function()
      local theme = {
        fill = 'TabLineFill',
        current_tab = 'TabLine',
        tab = 'NonText',
        line_sep = 'Cursor',
      }

      require('tabby.tabline').set(function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab

            -- this plugin uses the background color of the highlight groups as the foreground of the symbol for the separators
            local left_sep

            if tab.is_current() then
              left_sep = line.sep('▎', theme.line_sep, theme.current_tab)
            else
              left_sep = line.sep('▎', theme.fill, theme.fill)
            end

            return {
              left_sep,
              tab.number(),
              tab.name(),
              line.sep(' ', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          hl = theme.line_sep,
        }
      end)

      -- require('tabby').setup(opts)
      vim.api.nvim_set_keymap('n', '<leader><TAB>c', ':$tabnew<CR>', { noremap = true, desc = 'New tab' })
      vim.api.nvim_set_keymap('n', '<leader><TAB>x', ':tabclose<CR>', { noremap = true, desc = 'Close tab' })
      vim.api.nvim_set_keymap('n', '<leader><TAB>o', ':tabonly<CR>', { noremap = true, desc = 'Focus tab' })
      vim.api.nvim_set_keymap('n', '<leader><TAB>n', ':tabn<CR>', { noremap = true, desc = 'Next tab' })
      vim.api.nvim_set_keymap('n', '<leader><TAB>p', ':tabp<CR>', { noremap = true, desc = 'Prevoius Tab' })
    end,
  },
}
