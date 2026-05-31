return {
  'snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      win = { style = 'terminal' },
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
