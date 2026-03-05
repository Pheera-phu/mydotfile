return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000", -- ใส่โค้ดสีพื้นหลังที่ต้องการ (เช่น สีดำ)
      },
    },
    "nvim-treesitter/nvim-treesitter", -- แนะนำให้มีเพื่อ syntax highlight ใน command line
  },
  opts = {
    lsp = {
      -- เชื่อมต่อกับ lsp เพื่อแสดง documentation/hover ในแบบ floating
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, 
      },
    },
    presets = {
      bottom_search = false, -- ถ้า true จะเอาช่องค้นหา / ไปไว้ข้างล่าง (แบบเดิม)
      command_palette = true, -- ย้าย command line ไปอยู่กลางจอ (อันนี้คือที่คุณต้องการ)
      long_message_to_split = true, -- ข้อความยาวๆ ส่งไป split window
    },
  },
}
