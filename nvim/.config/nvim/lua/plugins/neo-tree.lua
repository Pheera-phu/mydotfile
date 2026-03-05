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
        position = "float", 
        width = 30,
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
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
        },
      }
    })

    -- map key สำหรับ toggle
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
  end,
}
