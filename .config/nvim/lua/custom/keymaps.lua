--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, 'ö', ':', { desc = 'Open command' })

vim.keymap.set('n', '<leader>w', function()
  vim.cmd.write()
  vim.cmd.echo '"Saved Buffer"'
end, { desc = 'Save buffer' })

vim.keymap.set('n', '<leader>wa', function()
  vim.cmd.wall()
  vim.cmd.echo '"Saved All Buffers"'
end, { desc = 'Save all buffers' })

vim.keymap.set('i', '<M-BS>', '<c-w>', { desc = 'Delete whole word backwards' })
vim.keymap.set('n', '<leader>,', 'A;<Esc>', { desc = 'Add a ; at end of line' })
vim.keymap.set('v', '<leader>n', ':norm ', { desc = 'Start norm command' })
vim.keymap.set('v', '<leader>mm', '<cmd>make<cr>', { desc = '[M]ake' })
vim.keymap.set('n', '<s-tab>', '<C-6>', { desc = 'Alternate file' })

vim.keymap.set('n', '[c', function()
  require('treesitter-context').go_to_context(vim.v.count1)
end, { silent = true, desc = 'Go to context' })

vim.keymap.set({ 'n', 'v' }, '<leader>p', '"0p', { desc = 'Paste without replacing buffer' })

vim.keymap.set({ 'n', 'v' }, '<leader>cl', '<cmd>s/\\<./\\u&/g<enter><cmd>nohl<enter>', { desc = 'Title [C]apitalize each word in current [L]ine' })
vim.keymap.set('n', 'z1', '1z=]s', { desc = 'Select best spelling suggestion' })

-- Add some better navigation between panes
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Clear highlights on search when pressing <Esc> in normal modf-  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR><cmd>pwd<cr>', { desc = '[C][D] to directory of open file' })

-- QUICK FIX LIST
vim.keymap.set('n', '<leader>q', function()
  local is_open = vim.iter(vim.fn.getwininfo()):any(function(wininf)
    return wininf.quickfix == 1
  end)
  if is_open then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end, { desc = 'Toggle diagnostic [Q]uickfix list' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', 'k', '<Up><CR><C-w>p', { buffer = true, remap = false, desc = 'Navigate up quickfix' })
    vim.keymap.set('n', 'j', '<Down><CR><C-w>p', { buffer = true, remap = false, desc = 'Navigate down quickfix' })
    vim.keymap.set('n', 'K', '[<C-q><CR><C-w>p', { buffer = true, remap = false, desc = 'Navigate up quickfix' })
    vim.keymap.set('n', 'J', ']<C-q><CR><C-w>p', { buffer = true, remap = false, desc = 'Navigate down quickfix' })
  end,
})

vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Set [D]iagnostic [Q]uickfix list from buffer' })

vim.keymap.set('n', '<leader>cm', function()
  vim.cmd.set 'langmap=qq,ww,fe,pr,bt,jy,lu,ui,yo,öp,åå,aa,rs,sd,tf,gg,mh,nj,ek,il,oö,ää,zz,xx,cc,dv,vb,kn,hm'
end, { desc = 'Change langmap to colemak' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
