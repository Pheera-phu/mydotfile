-- LazyVimSetup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

do
  local ts = vim.treesitter
  local get_range = ts.get_range

  -- Neovim 0.12 can occasionally ask for a range from a missing TS node while
  -- running highlight/decorations. Return a harmless empty range instead of
  -- aborting buffer open/redraw with `node:range()` errors.
  ts.get_range = function(node, source, metadata)
    if node == nil then
      if metadata and metadata.range then
        return ts._range.add_bytes(assert(source), metadata.range)
      end
      return { 0, 0, 0, 0 }
    end
    return get_range(node, source, metadata)
  end
end

require("vim-options")
require("lazy").setup("plugins")














