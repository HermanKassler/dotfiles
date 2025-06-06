--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, 'ö', ':', { desc = 'Open command' })

vim.keymap.set('i', '<M-BS>', '<c-w>', { desc = 'Delete whole word backwards' })
-- vim.keymap.set('n', '<leader>fb', ':Telescope file_browser <CR>')

vim.keymap.set('n', '<TAB>j', '<cmd>bp<CR>')
vim.keymap.set('n', '<TAB>k', '<cmd>bn<CR>')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '_')
vim.keymap.set('n', '<leader>,', 'A;<Esc>')
-- vim.keymap.set('n', '<leader>tr', '<C-w>v<cmd>term<CR>', { desc = 'Pause Neovim (open terminal)' })
vim.keymap.set('n', '<leader>md', ':MarkdownPreview <CR>')

-- require('snacks.toggle').option('wrap', { name = '󰖶 Wrap Long Lines' }):map '<leader>tw'
-- vim.keymap.set('n', '<C-U>', '<C-U>zz')
--
-- vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '[c', function()
  require('treesitter-context').go_to_context(vim.v.count1)
end, { silent = true, desc = 'Go to context' })

vim.keymap.set('n', '<leader>p', '"0p', { desc = 'Paste without replacing buffer' })
-- -----------Kickstart Default Binds----------------
--  See `:help vim.keymap.set()`
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- Clear highlights on search when pressing <Esc> in normal modf-  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR><cmd>pwd<cr>', { desc = 'CD to directory of open file' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
