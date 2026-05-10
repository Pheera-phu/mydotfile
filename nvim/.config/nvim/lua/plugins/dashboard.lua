return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    dependencies = { "amansingh-afk/milli.nvim" },
    lazy = false,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
          if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
          end
        end,
      })
    end,
    keys = {
      { "<leader>bd", function() Snacks.bufdelete() end,       desc = "Buffer delete",       mode = "n" },
      { "<leader>ba", function() Snacks.bufdelete.all() end,   desc = "Buffer delete all",   mode = "n" },
      { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Buffer delete other", mode = "n" },
      { "<leader>bz", function() Snacks.zen() end,             desc = "Toggle Zen Mode",     mode = "n" },
      { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
    },
    opts = function()
      local splash = require("milli").load({ splash = "robot" })
      return {
        bigfile = { enabled = true },
        dashboard = {
          enabled = true,
          preset = {
            keys = { 
              { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')", hidden = true },
              { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')", hidden = true },
              { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')", hidden = true },
              { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", hidden = true },
              { icon = " ", key = "s", desc = "Restore Session", section = "session", hidden = true },
              { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil, hidden = true },
              { icon = " ", key = "q", desc = "Quit", action = ":qa", hidden = true },
            },
            header = table.concat(splash.frames[1], "\n"),
          },
          sections = {
            { section = "header", padding = 2 },
            { section = "keys", padding = 2, gap = 2 },
            { section = "startup" },
          },
        },
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scope = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        rename = { enabled = true },
        zen = {
          enabled = true,
          toggles = {
            ufo             = true,
            dim             = true,
            git_signs       = false,
            diagnostics     = false,
            line_number     = false,
            relative_number = false,
            signcolumn      = "no",
            indent          = false
          }
        },
      }
    end,
    config = function(_, opts)
      require("snacks").setup(opts)
      require("milli").snacks({ splash = "robot", loop = true })
      vim.keymap.set("n", "<leader>;", function() require("snacks").dashboard.open() end, { desc = "Dashboard" })

      local gh_actions = require("snacks.gh.actions")
      local gh_edit = gh_actions.edit
      gh_actions.edit = function(ctx)
        local win_resolve = Snacks.win.resolve
        Snacks.win.resolve = function(...)
          local ret = win_resolve(...)
          if type(ret) == "table" then
            if type(ret.footer_keys) == "table" then
              for i, key in ipairs(ret.footer_keys) do
                if key == "<c-s>" then
                  ret.footer_keys[i] = "<c-x>"
                end
              end
            end
            if type(ret.keys) == "table" and type(ret.keys.submit) == "table" and ret.keys.submit[1] == "<c-s>" then
              ret.keys.submit[1] = "<c-x>"
            end
          end
          return ret
        end

        local ok, err = pcall(gh_edit, ctx)
        Snacks.win.resolve = win_resolve
        if not ok then
          error(err)
        end
      end

      Snacks.toggle.new({
        id = "ufo",
        name = "Enable/Disable ufo",
        get = function()
          return require("ufo").inspect()
        end,
        set = function(state)
          if state == nil then
            require("noice").enable()
            require("ufo").enable()
            vim.o.foldenable = true
            vim.o.foldcolumn = "1"
          else
            require("noice").disable()
            require("ufo").disable()
            vim.o.foldenable = false
            vim.o.foldcolumn = "0"
          end
        end,
      })
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'
      vim.keymap.set("n", "zK", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek Fold" })
    end,
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, {chunkText, hlGroup})
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end,
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
    },
  }
}
