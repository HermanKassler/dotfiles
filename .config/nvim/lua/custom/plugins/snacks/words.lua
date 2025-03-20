return {
  'snacks.nvim',
  opts = {
    words = { enabled = false },
  },
  keys = {
    {
      ']n',
      function()
        require('snacks').words.jump(1, true)
      end,
      desc = 'Jump to next reference',
    },
    {
      '[n',
      function()
        require('snacks').words.jump(-1, true)
      end,
      desc = 'Jump to previous reference',
    },
  },
}
