return {
  {
    'catgoose/nvim-colorizer.lua',
    -- event = 'VeryLazy',
    ft = { 'css', 'html' },
    opts = { -- set to setup table
      RRGGBBAA = true,
      css = true,
      sass = { enable = true, parsers = { 'css' } },
      names = false,
      -- css_fn = true,
    },
  },
}
