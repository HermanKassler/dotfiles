return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    init = function()
      -- Link to info regarding noice highlight groups:
      -- https://github.com/folke/noice.nvim/blob/bf67d70bd7265d075191e7812d8eb42b9791f737/doc/noice.nvim.txt#l799
      local colors = require('gruvbox').palette
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { fg = colors.bright_aqua, bg = colors.dark0 })
      vim.api.nvim_set_hl(0, 'NoiceCmdlineicon', { fg = colors.bright_aqua, bg = colors.dark0 })
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', { fg = colors.bright_yellow, bg = colors.dark0 })
      vim.api.nvim_set_hl(0, 'NoiceCmdlineiconSearch', { fg = colors.neutral_yellow, bg = colors.dark0 })
      --harpoon
      vim.api.nvim_set_hl(0, 'HarpoonBorder', { fg = colors.dark_red, bg = colors.dark_red })
      vim.api.nvim_set_hl(0, 'HarpoonWindow', { fg = colors.dark0, bg = colors.dark0 })

      -- Load the colorscheme here.
      require('gruvbox').setup {

        overrides = {
          -- fixes harpoon color issues
          NormalFloat = { fg = colors.light0, bg = colors.dark0 },
          FloatBorder = { fg = colors.light0, bg = colors.dark0 },
          SignColumn = { bg = colors.dark0 },
          CursorLineNr = { bg = colors.dark0 },
          FoldColumn = { bg = colors.dark0 },
          GruvboxYellowSign = { bg = colors.dark0 },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
    config = true,
    opts = {},
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'Mofiqul/dracula.nvim',
    enabled = false,
  },
  {
    'loctvl842/monokai-pro.nvim',
    enabled = false,
  },
  {
    'AlexvZyl/nordic.nvim',
    enabled = false,
  },
  {
    'maxmx03/dracula.nvim',
    enabled = false,
  },
}
