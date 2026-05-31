return {
  {
    'stevearc/oil.nvim',
    -- priority = 500,
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- event = 'VimEnter',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    event = { 'VimEnter */*,.*', 'BufNew */*,.*', 'VeryLazy' },
    config = function()
      vim.keymap.set('n', '\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
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
