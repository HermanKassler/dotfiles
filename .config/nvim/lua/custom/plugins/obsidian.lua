return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
      'telescope.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'notes',
          path = '~/Documents/notes',
        },
      },
      completion = {
        -- nvim_cmp = false,
        cmp = true,
        -- blink = true,
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ['<leader>ch'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = 'telescope.nvim',
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {
          -- Create a new note from your query.
          new = '<C-x>',
          -- Insert a link to the selected note.
          insert_link = '<C-l>',
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = '<C-x>',
          -- Insert a tag at the current location.
          insert_tag = '<C-l>',
        },
      },
      wiki_link_func = 'prepend_note_path',

      -- Optional, customize how note file names are generated given the ID, target directory, and title.
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local title = spec.title:gsub(' ', '_')
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix '.md'
      end,

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '_'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
    },

    config = function(_, opts)
      vim.keymap.set('n', '<leader>og', '<CMD>ObsidianSearch<CR>')
      vim.keymap.set('n', '<leader>of', '<CMD>ObsidianQuickSwitch<CR>')
      vim.keymap.set('n', '<leader>ow', '<CMD>ObsidianWorkspace<CR>')
      vim.keymap.set('n', '<leader>ol', '<CMD>ObsidianLinks<CR>')
      vim.keymap.set('n', '<leader>or', '<CMD>ObsidianRename<CR>')
      vim.keymap.set({ 'v', 'x' }, '<leader>on', '<CMD>ObsidianLinkNew<CR>')
      vim.keymap.set('n', '<leader>on', '<CMD>ObsidianNew<CR>')
      vim.keymap.set('n', '<leader>ob', '<CMD>ObsidianBacklink<CR>')
      vim.keymap.set('n', '<leader>oo', '<CMD>ObsidianOpen<CR>')
      vim.keymap.set('v', '<leader>oe', '<CMD>ObsidianExtractNote<CR>')
      vim.keymap.set('n', '<leader>ot', '<CMD>ObsidianTags<CR>')
      vim.keymap.set('n', '<leader>op', '<CMD>ObsidianPasteImg<CR>')
      vim.opt.conceallevel = 2
      require('obsidian').setup(opts)
    end,
  },
}
