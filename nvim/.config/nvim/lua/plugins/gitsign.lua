return {
  "lewis6991/gitsigns.nvim",
  config = function()
    vim.cmd [[highlight GitSignsAdd guifg=#98FB90]]
    vim.cmd [[highlight GitSignsChange guifg=#FFFF00]]
    vim.cmd [[highlight GitSignsDelete guifg=#FF0000]]
  end
}
