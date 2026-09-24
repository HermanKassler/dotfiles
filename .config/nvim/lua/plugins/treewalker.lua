return {
  {
    'aaronik/treewalker.nvim',
    event = 'VeryLazy',

    opts = {
      preset = 'modern',
      -- Whether to briefly highlight the node after jumping to it
      highlight = true,
      highlight_duration = 100,
      highlight_group = 'CursorLine',
    },
    config = function()
      -- movement
      vim.keymap.set('n', '<S-M-k>', '<cmd>Treewalker Up<cr>', { silent = true })
      vim.keymap.set('n', '<S-M-h>', '<cmd>Treewalker Left<cr>', { silent = true })
      vim.keymap.set('n', '<S-M-j>', '<cmd>Treewalker Down<cr>', { silent = true })
      vim.keymap.set('n', '<S-M-l>', '<cmd>Treewalker Right<cr>', { silent = true })
      --
      -- swapping
      vim.keymap.set({ 'n', 'v' }, '<M-C-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
      vim.keymap.set({ 'n', 'v' }, '<M-C-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
      vim.keymap.set({ 'n', 'v' }, '<M-C-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
      vim.keymap.set({ 'n', 'v' }, '<M-C-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })
    end,
  },
}
