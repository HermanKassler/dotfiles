return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    -- lazy = false,
    version = '1.*',
    opts = {
      dependencies_bin = {
        ['tinymist'] = '/home/tore/.local/share/nvim/mason/bin/tinymist',
        ['websocat'] = '/bin/websocat',
      },
      open_cmd = 'zen-browser --new-window %s',
    }, -- lazy.nvim will implicitly calls `setup {}`
  },
}
