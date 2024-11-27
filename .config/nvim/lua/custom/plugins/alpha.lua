return {
  {

    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      _Gopts = {
        position = 'center',
        hl = 'Type',
        wrap = 'overflow',
      }

      -- DASHBOARD HEADER

      local logo = [[


                                              
       ████ ██████           █████      ██
      ███████████             █████ 
      █████████ ███████████████████ ███   ███████████
     █████████  ███    █████████████ █████ ██████████████
    █████████ ██████████ █████████ █████ █████ ████ █████
  ███████████ ███    ███ █████████ █████ █████ ████ █████
 ██████  █████████████████████ ████ █████ █████ ████ ██████

      ]]

      dashboard.section.header.val = vim.split(logo, '\n')

      -- Split logo into lines
      local logoLines = {}
      for line in logo:gmatch '[^\r\n]+' do
        table.insert(logoLines, line)
      end

      dashboard.section.buttons.val = {
        dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  Find file', ':cd . | silent Telescope find_files hidden=true no_ignore=true <CR>'),
        dashboard.button('e', '╘  Open filetree', ':e .<CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('u', '󱐥  Update plugins', '<cmd>Lazy update<CR>'),
        dashboard.button('c', '  Config', ':e $HOME/.config/nvim/init.lua<CR>'),
        dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
      }

      -- local function footer()
      -- 	return "Footer Text"
      -- end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        desc = 'Add Alpha dashboard footer',
        once = true,
        callback = function()
          local stats = require('lazy').stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = { ' ', ' ', ' ', ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ' }
          dashboard.section.header.opts.hl = 'DashboardFooter'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
