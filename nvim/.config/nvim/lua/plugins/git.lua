return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      vim.cmd [[highlight GitSignsAdd guifg=#98FB90]]
      vim.cmd [[highlight GitSignsChange guifg=#FFFF00]]
      vim.cmd [[highlight GitSignsDelete guifg=#FF0000]]
    end
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- config = function()
    --   vim.g.lazygit_floating_window_border_chars = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}
    -- end,
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "tpope/vim-fugitive",
  },
}
