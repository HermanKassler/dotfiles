-- See `:help vim.opt`
-- [[ Setting options ]]
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

require 'custom.keybinds'
require 'custom.set'
-- [[Install lazy.nvim]]
require 'lazy-bootstrap'
-- [[ Configure and install plugins ]]
require 'lazy-plugins'
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
