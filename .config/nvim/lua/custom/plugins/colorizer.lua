return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = { -- set to setup table
      RRGGBBAA = true,
      css = true,
      sass = { enable = true, parsers = { 'css' } },
      names = false,
      -- css_fn = true,
    },
  },
}
