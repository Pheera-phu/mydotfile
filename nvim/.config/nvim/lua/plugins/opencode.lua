return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = { "folke/snacks.nvim" },
  opts = {
    auto_fallback_to_embedded = false,
  },
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
