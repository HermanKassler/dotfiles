return {
  'folke/snacks.nvim',
  enabled = true,
  priority = 1000,
  lazy = false,
  ---@type Snacks.Config
  opts = {},
  import = 'custom.plugins.snacks',
  config = function(_, opts)
    require('snacks').setup(opts)
  end,
}
