return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
      lazy_load = true,
      RRGGBBAA = true,
      css = true,
      sass = { enable = true, parsers = { 'css' } },
      -- css_fn = true,
    },
  },
}
