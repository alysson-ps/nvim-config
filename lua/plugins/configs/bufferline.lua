return function(_, _)
  local bufferline = require("bufferline")

  local setup = {
    options = {
      -- mode = 'tabs',
      style_preset = bufferline.style_preset.minimal,
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("config.icons.nerd_font")
        local ret = (diag.error and icons.DiagnosticError or "") .. (diag.warning and icons.DiagnosticWarn or "")
        return vim.trim(ret)
      end,
      groups = {
        items = {
          require('bufferline.groups').builtin.pinned:with({ icon = "" })
        },
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "NvimTree",
          text = "Nvim Tree",
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
