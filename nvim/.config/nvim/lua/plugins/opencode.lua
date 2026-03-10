return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = { "folke/snacks.nvim" },
  config = function()
    vim.g.opencode_opts = {
      -- กำหนด port คงที่เพื่อให้ Neovim หา server เจอข้าม window/session
      -- และจะไม่สร้าง split ใหม่ถ้าพบว่ามี server รันอยู่ที่ port นี้แล้ว
      -- port = 31337,
    }
    vim.o.autoread = true
  end,
  keys = {
    {
      "<leader>oa",
      function()
        require("opencode").ask()
      end,
      desc = "Ask opencode",
      mode = "n",
    },
    {
      "<leader>oa",
      function()
        require("opencode").ask("@this: ", { submit = true }) 
      end,
      desc = "Ask opencode about selection",
      mode = "v",
    },
  }
}
