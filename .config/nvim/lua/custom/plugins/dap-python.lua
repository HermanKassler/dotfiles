return {
  {
    'mfussenegger/nvim-dap-python',
    event = 'VeryLazy',
    config = function()
      require('dap-python').setup '/usr/bin/python3' -- XXX: Replace this with your preferred Python, if wanted
      -- An example configuration to launch any Python file, via Houdini
      -- table.insert(
      --     require("dap").configurations.python,
      --     {
      --         type = "python",
      --         request = "launch",
      --         name = "Launch Via hython",
      --         program = "${file}",
      --         python = "/opt/hfs19.5.569/bin/hython"
      --         -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      --     }
      -- )
    end,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
