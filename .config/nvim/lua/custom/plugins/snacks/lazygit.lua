return {
  'snacks.nvim',
  opts = {
    lazygit = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
  },
}
