return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load() -- โหลดชุดสไนเป็ตสำเร็จรูป (มี HTML, React, ฯลฯ)

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = false,
      })

      -- ปุ่มกระโดดในสไนเป็ต
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(1) then ls.jump(1) end
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { silent = true })
    end,
  },
}

