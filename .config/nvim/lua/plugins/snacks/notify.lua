return {
  'snacks.nvim',
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- style = {
    --   notification = {
    --     border = 'rounded',
    --     zindex = 100,
    --     ft = 'markdown',
    --     wo = {
    --       winblend = 5,
    --       wrap = false,
    --       conceallevel = 2,
    --       colorcolumn = '',
    --     },
    --     bo = { filetype = 'snacks_notif' },
    --   },
    -- },
  },
  keys = {
    {
      '<leader>n',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>x',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
  },
}
