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
      { "<leader><Tab>",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
    },
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("config.icons.nerd_font")
          local ret = (diag.error and icons.DiagnosticError .. diag.error .. " " or "")
              .. (diag.warning and icons.DiagnosticWarn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
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
