return {
  'snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
    },
  },

  keys = {
    {
      '<M-t>',
      function()
        require('snacks').terminal.toggle()
      end,
      mode = { 'n', 'v', 't' },
      desc = 'Snacks terminal',
    },
  },
}
