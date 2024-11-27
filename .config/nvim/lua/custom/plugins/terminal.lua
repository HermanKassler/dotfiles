return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'VimEnter',
    config = function()
      local term = require 'toggleterm'
      term.setup {
        open_mapping = [[<c-t>]],
        insert_mappings = false,
        direction = 'vertical',
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
      }
    end,
  },
}
