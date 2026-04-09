return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = true,
  -- lazy = true,
  event = 'VeryLazy',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { 'markdown' },
    heading = {},
    latex = { enabled = false },
    -- indent = { enabled = true, per_level = 2 },
    quote = { repeat_linebreak = true },
    win_options = {
      showbreak = {
        default = '',
        rendered = '  ',
      },
      breakindent = {
        default = false,
        rendered = true,
      },
      breakindentopt = {
        default = '',
        rendered = '',
      },
    },
    callout = {
      theorem = { raw = '[!theorem]', rendered = '󰨸 Theorem', highlight = 'RenderMarkdownInfo', category = 'obsidian' },
      definition = { raw = '[!definition]', rendered = '󰅾  Definition', highlight = 'RenderMarkdownWarn', category = 'obsidian' },
      proof = { raw = '[!proof]', rendered = '󰄬 Proof', highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
    },
  },
}
