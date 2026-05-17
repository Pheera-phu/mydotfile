return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "evergarden",
    },
  },
  {
    'everviolet/nvim', name = 'evergarden',
    priority = 1000,
    opts = {
      theme = {
        variant = 'fall',
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
          variant = 'fall',
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
    end
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
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'everforest'
        }
      })
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter")
      config.setup({
        ensure_installed = {"lua", "javascript", "html", "java", "json", "typescript", "tsx", "php", "c", "cpp", "css", "blade"},
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  {
    "vimpostor/vim-tpipeline"
  }
}
