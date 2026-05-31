return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    require('fff.download').download_or_build_binary()
  end,
  opts = {
    debug = {
      enabled = false,
      show_scores = false,
    },
    layout = {
      prompt_position = 'top',
      height = 0.9,
    },
  },
  lazy = false, -- the plugin lazy-initialises itself
  keys = {
    {
      '<leader>sf',
      function()
        require('fff').find_files()
      end,
      desc = 'Find files',
    },
    {
      '<leader>sg',
      function()
        require('fff').live_grep()
      end,
      desc = 'Live grep',
    },
    {
      '<leader>fz',
      function()
        require('fff').live_grep { grep = { modes = { 'fuzzy', 'plain' } } }
      end,
      desc = 'Live fuzy grep',
    },
    {
      '<leader>sc',
      function()
        require('fff').live_grep { query = vim.fn.expand '<cword>' }
      end,
      desc = 'Search current word',
    },
  },
}
