return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,
      fast_wrap = { map = "<M-e>" },
      disable_filetype = { "TelescopePrompt", "vim" },
    })

    -- (ถ้าใช้ nvim-cmp) ให้กด <CR> แล้ว complete + ปิดวงเล็บสวย ๆ
    -- local ok, cmp = pcall(require, "cmp")
    -- if ok then
    --   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --   cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    -- end
  end,
}
