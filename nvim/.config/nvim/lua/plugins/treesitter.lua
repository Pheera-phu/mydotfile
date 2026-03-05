return {
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
}
