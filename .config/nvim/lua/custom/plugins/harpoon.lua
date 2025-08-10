return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      ---------------Telescope Setup---------------
      -- local conf = require('telescope.config').values
      -- local function toggle_telescope(harpoon_files)
      --   local file_paths = {}
      --   for _, item in ipairs(harpoon_files.items) do
      --     table.insert(file_paths, item.value)
      --   end
      --
      --   require('telescope.pickers')
      --     .new({}, {
      --       prompt_title = 'Harpoon',
      --       finder = require('telescope.finders').new_table {
      --         results = file_paths,
      --       },
      --       previewer = conf.file_previewer {},
      --       sorter = conf.generic_sorter {},
      --     })
      --     :find()
      -- end

      local toggle_opts = {
        title = ' Harpoon ',
        border = 'rounded',
        title_pos = 'center',
        ui_width_ratio = 0.40,
      }

      -- vim.api.nvim_create_autocmd({ 'filetype' }, {
      --   pattern = 'harpoon',
      --   callback = function()
      --     vim.cmd [[highlight HarpoonBorder guibg=#bf1111]]
      --     vim.cmd [[highlight HarpoonWindow guibg=#313132]]
      --   end,
      -- })

      -----------------Keymaps----------------------

      local function map(lhs, rhs, opts)
        vim.keymap.set('n', lhs, rhs, opts or {})
      end
      map('<leader>e', function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
      end)
      map('<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add buffer to Harpoon' })
      -- map('<leader>h', function()
      --   toggle_telescope(harpoon:list())
      -- end, { desc = 'Open harpoon window' })
      map('<m-a>', function()
        harpoon:list():select(1)
      end, { desc = 'Select buffer 1 in Harpoon' })
      map('<m-s>', function()
        harpoon:list():select(2)
      end, { desc = 'Select buffer 2 in Harpoon' })
      map('<m-d>', function()
        harpoon:list():select(3)
      end, { desc = 'Select buffer 3 in Harpoon' })
      map('<m-f>', function()
        harpoon:list():select(4)
      end, { desc = 'Select buffer 4 in Harpoon' })
      map('<m-g>', function()
        harpoon:list():select(5)
      end, { desc = 'Select buffer 5 in Harpoon' })
      map('<C-S-n>', function()
        harpoon:list():next()
      end, { desc = 'Select next buffer in Harpoon' })
      map('<C-S-p>', function()
        harpoon:list():prev()
      end, { desc = 'Select previous buffer in Harpoon' })
    end,
  },
}
