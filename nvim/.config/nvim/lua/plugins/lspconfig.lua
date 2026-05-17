return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "intelephense", 
          "eslint",
          "tailwindcss",
          "cssls",
          "html",
          "vue_ls"
        },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers  = { "tsserver", "eslint", "tailwindcss", "cssls" }

      vim.lsp.config("intelephense", {
        capabilities = capabilities,
      })
      vim.lsp.enable("intelephense")

      for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, { capabilities = capabilities })
        vim.lsp.enable(lsp)
      end

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "html", "blade" },
      })
      vim.lsp.enable("html")

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
        filetypes = { "vue", "javascript" },
        init_options = {
          vue = {
            hybridMode = true,
          }
        }
      })
      vim.lsp.enable("vue_ls")

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
    end,
  },
}

