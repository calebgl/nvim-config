return {

  -- increase time for formatting (eslint)
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 10000,
      },
    },
  },

  -- add new formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.black,
          nls.builtins.formatting.prettier,
          -- nls.builtins.formatting.eslint,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
}
