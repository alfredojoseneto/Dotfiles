return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jayp0521/mason-null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-null-ls
    local mason_null_ls = require("mason-null-ls")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels",
        "bashls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "html",
        "lua_ls",
        "pyright",
        -- "pylsp",
        -- "jedi_language_server",
        "sqlls",
        "tailwindcss",
        "tsserver",
        "yamlls",
        -- "graphql",
        -- "prismals",
        -- "svelte",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        -- "prettier", -- ts/js formatter
        "prettierd",
        "stylua",   -- lua formatter
        "eslint_d", -- ts/js linter
        "black",    -- python formatter
        "pylint",   -- python linter
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
