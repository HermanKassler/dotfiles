return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  lazy = true,
  config = function()
    vim.keymap.set('n', '<leader>md', ':MarkdownPreview <CR>')
  end,
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
