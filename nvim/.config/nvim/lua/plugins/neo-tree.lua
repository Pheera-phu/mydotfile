return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        popup = { 
          size = { height = "80%", width = "50%" },
          position = "50%",
          border = {
            style = "double",
            padding = { 0, 1 },
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      }
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  end,
}
