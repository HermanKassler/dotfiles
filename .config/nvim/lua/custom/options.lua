vim.g.have_nerd_font = true

-- Sign Column
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Status/command line
vim.opt.showmode = false -- Disable since it's shown in the status line
vim.o.cmdheight = 0 --Remove command line to mesh better with noice

vim.opt.autoread = true -- Update buffer if it is changed from another source

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.breakindent = true -- Enable break indent
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Search behaviour
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split' -- Preview substitutions live

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- Displays which-key popup sooner

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- vim.opt.spelllang = 'en,se'

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true
-- Open help pages in vertical mode
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('help_window_right', { clear = true }),
  pattern = '*.txt',
  callback = function()
    if vim.bo.filetype == 'help' or vim.bo.filetype == 'man' then
      vim.cmd.wincmd 'L'
    end
  end,
})

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.diagnostic.config {
  virtual_lines = false,
  virtual_text = true,
}
