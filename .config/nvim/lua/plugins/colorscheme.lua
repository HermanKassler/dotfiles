return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    init = function()
      vim.o.background = 'dark'
      -- Link to info regarding noice highlight groups:
      -- https://github.com/folke/noice.nvim/blob/bf67d70bd7265d075191e7812d8eb42b9791f737/doc/noice.nvim.txt#l799
      local colors = require('gruvbox').palette
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'GruvboxBg0' })
      vim.api.nvim_set_hl(0, 'NoiceCmdlineicon', { link = 'GruvboxBg0' })
      vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'GruvboxBg0' })
      vim.api.nvim_set_hl(0, 'SnacksIndentScope', { link = 'GruvboxGray' })

      -- Load the colorscheme here.
      require('gruvbox').setup {

        overrides = {
          -- fixes harpoon color issues
          NormalFloat = { fg = colors.light0, bg = colors.dark0 },
          Normal = { fg = colors.light0, bg = colors.dark0 },
          FloatBorder = { fg = colors.light0, bg = colors.dark0 },
          SignColumn = { bg = colors.dark0 },
          CursorLineNr = { bg = colors.dark0 },
          FoldColumn = { bg = colors.dark0 },
          GruvboxYellowSign = { bg = colors.dark0 },
          GruvboxRedSign = { bg = colors.dark0 },
          DiffText = { bg = colors.faded_yellow },
          DiffChange = { bg = colors.dark2 },
          DiffDelete = { bg = colors.dark_red_soft },
          DiffAdd = { bg = colors.dark_aqua_hard },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
    config = true,
    opts = {},
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, enabled = false },
}
