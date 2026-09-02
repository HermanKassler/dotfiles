return {
  {
    'esmuellert/codediff.nvim',
    cmd = 'CodeDiff',
    opts = {
      explorer = {
        view_mode = 'tree',
        indent_markers = false,
      },
      highlights = {
        line_insert = '#2b3520',
        char_insert = 'DiffAdd',
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>hd', '<cmd>CodeDiff<cr>', { desc = 'git [d]iff' })
      vim.keymap.set('n', '<leader>hD', '<cmd>CodeDiff HEAD<cr>', { desc = 'git [d]iff against last index' })
    end,
  },
}
