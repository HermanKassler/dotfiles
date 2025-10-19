return {
  { -- Autocompletion
    'saghen/blink.cmp',
    -- enabled = false,
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
      'saghen/blink.compat',
      'archie-judd/blink-cmp-words',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',
        ['<C-f>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'fallback',
        },
        ['<TAB>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'fallback',
        },
        ['<C-J>'] = { 'snippet_forward', 'fallback' },
        ['<C-K>'] = { 'snippet_backward', 'fallback' },
        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      cmdline = {
        keymap = {
          ['<Tab>'] = { 'show_and_insert', 'select_and_accept' },
        },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      -- completion.menu.draw.columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = {
          draw = { columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } } },
        },
        ghost_text = {
          enabled = false,
          show_with_menu = true,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          dictionary = {
            name = 'blink-cmp-words',
            module = 'blink-cmp-words.dictionary',
            -- All available options
            opts = {
              -- The number of characters required to trigger completion.
              -- Set this higher if completion is slow, 3 is default.
              dictionary_search_threshold = 3,
              score_offset = -100,
              definition_pointers = { '!', '&', '^' },
            },
          },
          -- thesaurus = {
          --   name = 'blink-cmp-words',
          --   module = 'blink-cmp-words.thesaurus',
          --   opts = {
          --     score_offset = -10,
          --     -- Default pointers define the lexical relations listed under each definition,
          --     -- see Pointer Symbols below.
          --     -- Default is as below ("antonyms", "similar to" and "also see").
          --     definition_pointers = { '!', '&', '^' },
          --     -- The pointers that are considered similar words when using the thesaurus,
          --     -- see Pointer Symbols below.
          --     -- Default is as below ("similar to", "also see" }
          --     similarity_pointers = { '&', '^' },
          --     -- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
          --     -- 2 is similar words of similar words, etc. Increasing this may slow results.
          --     similarity_depth = 2,
          --   },
          -- },
        },
        per_filetype = {
          -- markdown = { inherit_defaults = true, 'dictionary' },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'prefer_rust' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
