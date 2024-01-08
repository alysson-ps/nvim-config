-- local icons = require("andrewdcato.util").icons

return {
  {
    "echasnovski/mini.bufremove",
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   dependencies = { "catppuccin/nvim" },
  --   config = function()
  --     require("bufferline").setup({
  --       -- highlights = highlights,
  --       options = {
  --         indicator = { style = "rounded" },
  --         diagnostics = "nvim_lsp",
  --         offsets = {
  --           {
  --             filetype = "neo-tree",
  --             text = "File Explorer",
  --             text_align = "center",
  --             separator = true,
  --           },
  --           {
  --             filetype = "NvimTree",
  --             text = "File Explorer",
  --             text_align = "center",
  --             separator = true,
  --           },
  --           {
  --             filetype = "lspsagaoutline",
  --             text = "Outline",
  --             text_align = "center",
  --             separator = true,
  --           },
  --           {
  --             filetype = "Outline",
  --             text = "Outline",
  --             text_align = "center",
  --             separator = true,
  --           },
  --         },
  --         separator_style = "thin",
  --       },
  --     })
  --   end,
  -- },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
      { "<Tab>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
      { "<S-Tab>",    "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
    },
    -- opts =
    config = require("plugins.configs.bufferline")
  },

  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" }
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require("barbecue").setup({
        theme = "tokyonight",
        symbols = {
          modified = "●",
          added = "●",
          removed = "●",
          renamed = "●",
        },
        -- kinds =
      })
    end,
  },
}
