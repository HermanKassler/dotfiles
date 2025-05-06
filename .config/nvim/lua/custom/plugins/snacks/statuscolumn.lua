return {
  'snacks.nvim',
  opts = {
    statuscolumn = {
      -- enabled = false,
      left = { 'mark', 'sign', 'git' }, -- priority of signs on the left (high to low)
      right = { 'fold' }, -- priority of signs on the right (high to low)
      folds = {
        open = true, -- show open fold icons
        git_hl = true, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { 'GitSign' },
      },

      refresh = 50, -- refresh at most every 50ms
    },
  },
}
