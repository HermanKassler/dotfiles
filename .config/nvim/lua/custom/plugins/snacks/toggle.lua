return {
  'snacks.nvim',
  config = function(_, opts)
    Snacks.toggle.option('spell', { name = '󰓆 Spell Checking' }):map '<leader>ts' -- '<leader>ts'
    Snacks.toggle.option('wrap', { name = '󰖶 Wrap Long Lines' }):map '<leader>tw'
    Snacks.toggle.option('list', { name = '󱁐 List (Visible Whitespace)' }):map '<leader>tl'

    Snacks.toggle
      .new({
        id = 'diag_virtual_text',
        name = ' Diagnostics Virtual Text',
        get = function()
          return vim.diagnostic.config().virtual_text ~= false
        end,
        set = function(state)
          if state then
            -- NOTE: keep in sync with default in `lsp.lua`
            vim.diagnostic.config {
              virtual_text = true,
              virtual_lines = false,
            }
          else
            vim.diagnostic.config {
              virtual_text = false,
              virtual_lines = true,
            }
          end
        end,
      })
      :map '<leader>td'
    Snacks.toggle
      .new({
        id = 'relativenumber',
        name = ' Relative Line Numbers',
        get = function()
          return vim.wo.relativenumber
        end,
        set = function(state)
          -- if state then
          --   vim.wo.number = false
          -- end
          vim.wo.relativenumber = state
        end,
      })
      :map '<leader>tn'

    Snacks.toggle
      .new({
        id = 'format_on_save',
        name = '󰊄 Format on Save (global)',
        get = function()
          return not vim.g.disable_autoformat
        end,
        set = function(state)
          vim.g.disable_autoformat = not state
        end,
      })
      :map '<leader>tf'

    Snacks.toggle
      .new({
        id = 'format_on_save_buffer',
        name = '󰊄 Format on Save (buffer)',
        get = function()
          return not vim.b.disable_autoformat
        end,
        set = function(state)
          vim.b.disable_autoformat = not state
        end,
      })
      :map '<leader>tF'
    require('snacks').setup(opts)
  end,

  opts = {
    toggle = {
      -- which_key = false,
      -- enabled = false,
      -- enabled = true,
    },
  },
}
