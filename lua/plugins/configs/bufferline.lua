return function(_, _)
  local bufferline = require("bufferline")

  local setup = {
    options = {
      style_preset = bufferline.style_preset.minimal,
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      themable = true,
      -- right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      show_close_icon = false,
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = require("config.icons.nerd_font")
      --   local ret = (diag.error and icons.DiagnosticError or "") .. (diag.warning and icons.DiagnosticWarn or "")
      --   return vim.trim(ret)
      -- end,
      -- buffer_close_icon = " ",
      show_buffer_close_icons = false,
      separator_style = "thick",
      groups = {
        items = {
          require('bufferline.groups').builtin.pinned:with({ icon = "" })
        },
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "File explorer",
          highlight = "Directory",
          separator = true,
          text_align = "left",
        },
        {
          filetype = "NvimTree",
          text = "File explorer",
          highlight = "Directory",
          separator = true,
          text_align = "left"
        }
      },
    },
  }

  bufferline.setup(setup)

  -- Fix bufferline when restoring a session
  vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
      vim.schedule(function()
        pcall(nvim_bufferline)
      end)
    end,
  })
end
