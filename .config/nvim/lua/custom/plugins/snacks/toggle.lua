return {
  'snacks.nvim',
  config = function()
    -- require('snacks.toggle').option('spell', { name = '󰓆 Spell Checking' }):map '<leader>ts' -- '<leader>ts'
    -- require('snacks.toggle').option('wrap', { name = '󰖶 Wrap Long Lines' }):map '<leader>tw'
    -- require('snacks.toggle').option('list', { name = '󱁐 List (Visible Whitespace)' }):map '<leader>tl'
  end,
  opts = {
    toggle = {
      enabled = false,
      -- enabled = true,
    },
  },
}
