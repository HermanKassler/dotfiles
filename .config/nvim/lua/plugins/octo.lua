return {
  {
    'pwntester/octo.nvim',
    enabled = false,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup() {
        mappings = { -- mappings for the pickers
          open_in_browser = { lhs = '<C-b>', desc = 'open issue in browser' },
          copy_url = { lhs = '<C-y>', desc = 'copy url to system clipboard' },
          checkout_pr = { lhs = '<C-o>', desc = 'checkout pull request' },
          merge_pr = { lhs = '<C-r>', desc = 'merge pull request' },
        },
      }
    end,
  },
}
