return {
  'snacks.nvim',
  opts = {
    gitbrowse = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
  },
}
