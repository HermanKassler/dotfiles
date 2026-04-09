return {
  {

    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'saghen/blink.cmp',
      'nvim-telescope/telescope.nvim',
    },
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      ui = { enable = false },
      workspaces = {
        {
          name = 'notes',
          path = '~/Documents/kth/notes',
        },
        {
          name = 'mtgn',
          path = '~/Documents/MTGN/notes/',
        },
      },
      link = {
        style = function(opts)
          local anchor = ''
          local header = ''
          if opts.anchor then
            anchor = opts.anchor.anchor
            header = string.format(' ❯ %s', opts.anchor.header)
          elseif opts.block then
            anchor = '#' .. opts.block.id
            header = '#' .. opts.block.id
          end

          if opts.label ~= opts.path then
            return string.format('[[%s%s|%s%s]]', opts.path, anchor, opts.label, header)
          else
            return string.format('[[%s%s]]', opts.path, anchor)
          end
        end,
      },

      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 1,
      },

      legacy_commands = false,
      -- wiki_link_func = 'prepend_note_path',

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local prefix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          prefix = title:gsub(' ', '_'):gsub('[^A-Za-z0-9-_]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            prefix = prefix .. string.char(math.random(65, 90))
          end
        end
        return prefix .. '-' .. tostring(os.time())
      end,
      -- attachments = {
      --   img_text_func = function(path)
      --     local name = vim.fs.basename(tostring(path))
      --     local encoded_name = require('obsidian.util').urlencode(path)
      --     return string.format('![%s](%s)', name, encoded_name)
      --   end,
      -- },
    },

    config = function(_, opts)
      vim.keymap.set('n', '<leader>og', '<CMD>Obsidian search<CR>')
      vim.keymap.set('n', '<leader>of', '<CMD>Obsidian quick_switch<CR>')
      vim.keymap.set('n', '<leader>ow', '<CMD>Obsidian workspace<CR>')
      vim.keymap.set('n', '<leader>ol', '<CMD>Obsidian links<CR>')
      vim.keymap.set('v', '<leader>ol', '<CMD>Obsidian link<CR>')
      vim.keymap.set('n', '<leader>or', '<CMD>Obsidian rename<CR>')
      vim.keymap.set('n', '<leader>oc', '<CMD>Obsidian toc<CR>')
      vim.keymap.set({ 'v', 'x' }, '<leader>on', '<CMD>Obsidian link_new<CR>')
      vim.keymap.set('n', '<leader>on', '<CMD>Obsidian new<CR>')
      vim.keymap.set('n', '<leader>ob', '<CMD>Obsidian backlinks<CR>')
      vim.keymap.set('n', '<leader>oo', '<CMD>Obsidian open<CR>')
      vim.keymap.set('v', '<leader>oe', ':Obsidian extract_note ')
      vim.keymap.set('n', '<leader>ot', '<CMD>Obsidian tags<CR>')
      vim.keymap.set('n', '<leader>op', '<CMD>Obsidian paste_img<CR>')
      vim.opt.conceallevel = 2

      vim.opt.makeprg = 'pandoc % -o ./ignored_files/%:t:r.pdf'
      require('obsidian').setup(opts)
    end,
  },
}
