return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        c = { 'custom_clang' },
        -- Conform can also run multiple formatters sequentially
        python = { 'black', 'autoflake' },
        javascript = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        typescript = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'prettier' },
        -- java = { 'clang-format' },
        cpp = { 'custom_clang' },
        cuda = { 'custom_clang' },
        cs = { 'custom_clang' },
        java = { 'google_java_format' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        custom_clang = {
          command = 'clang-format',
          args = '--style="{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 100}"',
        },
        custom_google = {
          command = 'google-java-format',
          args = 'aosp = true',
        },
        custom_prettier = {
          command = 'prettier',
          args = 'prettier.tabWidth: 4',
        },
      },
    },
  },
}
