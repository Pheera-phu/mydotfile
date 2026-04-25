return {
  {
    "bjarneo/vantablack.nvim",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "bluz71/vim-moonfly-colors", 
    name = "moonfly", 
    lazy = false, 
    priority = 1000, 
  },
  {
    'everviolet/nvim', name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'bg0',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    },
    config = function()
      require 'evergarden'.setup {
        theme = {
          variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
          accent = 'bg0',
        },
        editor = {
          transparent_background = false,
          override_terminal = true,
          sign = { color = 'none' },
          float = {
            color = 'mantle',
            solid_border = false,
          },
          completion = {
            color = 'surface0',
          },
        },
        style = {
          tabline = { 'reverse' },
          search = { 'italic', 'reverse' },
          incsearch = { 'italic', 'reverse' },
          types = { 'italic' },
          keyword = { 'italic' },
          comment = { 'italic' },
        },
        overrides = {
          Normal = {
            '#fddce3',
            '#1d2021',
            style = { 'bold', 'italic' }
          },
        },
        color_overrides = {},
        integrations = {
          blink_cmp = true,
          cmp = true,
          fzf_lua = true,
          gitsigns = true,
          indent_blankline = { enable = true, scope_color = 'green' },
          mini = {
            enable = true,
            animate = true,
            clue = true,
            completion = true,
            cursorword = true,
            deps = true,
            diff = true,
            files = true,
            hipatterns = true,
            icons = true,
            indentscope = true,
            jump = true,
            jump2d = true,
            map = true,
            notify = true,
            operators = true,
            pick = true,
            starters = true,
            statusline = true,
            surround = true,
            tabline = true,
            test = true,
            trailspace = true,
          },
          nvimtree = true,
          rainbow_delimiters = true,
          symbols_outline = true,
          telescope = true,
          which_key = true,
          neotree = true,
        },
      }
      -- vim.cmd('colorscheme evergarden')
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = { 
          dark = "mocha",
        },
      })
    end
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "aura-dark",
        callback = function()
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#25233a" })
          vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3859" })
        end,
      })
      vim.cmd([[colorscheme aura-dark]])
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aura-dark",
    },
  },
}
