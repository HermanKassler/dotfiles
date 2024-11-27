return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- opts = {
    -- columns = {
    --   'icon',
    --   'size',
    -- },
    -- delete_to_trash = true,
    -- Optional dependencies
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    -- },
    config = function()
      vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      require('oil').setup {
        delete_to_trash = true,
        columns = {
          'icon',
          'size',
        },
        view_options = {
          show_hidden = true,
        },
      }
    end,
  },
}
