return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = { "folke/snacks.nvim" },
  config = function()
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
