return {
  -- core LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim", -- ตัวจัดการ LSP/DAP/Linter
      "williamboman/mason-lspconfig.nvim", -- bridge ระหว่าง mason กับ lspconfig
      "hrsh7th/nvim-cmp", -- auto-completion
      "hrsh7th/cmp-nvim-lsp", -- source สำหรับ LSP
      "L3MON4D3/LuaSnip", -- snippets
    },
    config = function()
      -- init mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { -- ติดตั้ง LSP นี้อัตโนมัติ
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

      --PHP, LARAVEL
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
    end,
  },
}

