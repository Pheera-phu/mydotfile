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
  local ts_start = ts.start

  local function ts_disabled_for(buf, lang)
    buf = vim._resolve_bufnr(buf)
    lang = lang or ts.language.get_lang(vim.bo[buf].filetype) or vim.bo[buf].filetype

    if lang == "markdown" or lang == "markdown_inline" then
      return true
    end

    local name = vim.api.nvim_buf_get_name(buf)
    local runtime = vim.env.VIMRUNTIME or ""
    return lang == "lua" and runtime ~= "" and vim.startswith(name, runtime .. "/")
  end

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

  ts.start = function(buf, lang)
    if ts_disabled_for(buf or 0, lang) then
      pcall(ts.stop, buf or 0)
      return
    end
    return ts_start(buf, lang)
  end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
  callback = function(args)
    local name = vim.api.nvim_buf_get_name(args.buf)
    local runtime = vim.env.VIMRUNTIME or ""
    local ft = vim.bo[args.buf].filetype
    if ft == "markdown" or ft == "lua" and runtime ~= "" and vim.startswith(name, runtime .. "/") then
      pcall(vim.treesitter.stop, args.buf)
    end
  end,
})

require("vim-options")
require("lazy").setup("plugins")












