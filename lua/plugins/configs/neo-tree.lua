return function(_, opts)
  local neotree = require("neo-tree")
  neotree.setup({
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "diagnostics",
      -- ...and any additional source
    },
    close_if_last_window = true,
    enable_diagnostics = true,
    enable_git_status = true,
    popup_border_style = "rounded",
    sort_case_insensitive = false,

    source_selector = {
      winbar = false,
      statusline = false
    },

    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = require('config.icons.nerd_font').DefaultFile,
        highlight = "NeoTreeFileIcon"
      },
      -- modified = {
      --   symbol = "[+]",
      --   highlight = "NeoTreeModified",
      -- },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖", -- this can only be used in the git_status source
          renamed   = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
      -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
      file_size = {
        enabled = true,
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = true,
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = true,
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = true,
        required_width = 110, -- min width of window required to show this column
      },
      symlink_target = {
        enabled = false,
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,          -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
          ".git",
          "vendor",
          ".vscode",
          "__pycache__",
        },
      },
    },
    hide_hidden = false,
    window = {
      width = 35,
      auto_expand_width = false,
      mappings = {
        ["<space>"] = false,
      },
      same_level = false,
    },
    -- git_status = {
    --   window = {
    --     position = "float",
    --     mappings = {
    --       ["A"]  = "git_add_all",
    --       ["gu"] = "git_unstage_file",
    --       ["ga"] = "git_add_file",
    --       ["gr"] = "git_revert_file",
    --       -- ["gc"] = "git_commit",
    --       ["gp"] = "git_push",
    --       ["gg"] = "git_commit_and_push",
    --       ["o"]  = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
    --       ["oc"] = { "order_by_created", nowait = false },
    --       ["od"] = { "order_by_diagnostics", nowait = false },
    --       ["om"] = { "order_by_modified", nowait = false },
    --       ["on"] = { "order_by_name", nowait = false },
    --       ["os"] = { "order_by_size", nowait = false },
    --       ["ot"] = { "order_by_type", nowait = false },
    --     }
    --   }
    -- },
    diagnostics = {
      auto_preview = {                   -- May also be set to `true` or `false`
        enabled = false,                 -- Whether to automatically enable preview mode
        preview_config = {},             -- Config table to pass to auto preview (for example `{ use_float = true }`)
        event = "neo_tree_buffer_enter", -- The event to enable auto preview upon (for example `"neo_tree_window_after_open"`)
      },
      bind_to_cwd = true,
      diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
      -- "position" means diagnostic items are sorted strictly by their positions.
      -- May also be a function.
      follow_current_file = {             -- May also be set to `true` or `false`
        enabled = true,                   -- This will find and focus the file in the active buffer every time
        always_focus_file = false,        -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file
        expand_followed = true,           -- Ensure the node of the followed file is expanded
        leave_dirs_open = false,          -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        leave_files_open = false,         -- `false` closes auto expanded files, such as with `:Neotree reveal`
      },
      group_dirs_and_files = true,        -- when true, empty folders and files will be grouped together
      group_empty_dirs = true,            -- when true, empty directories will be grouped together
      show_unloaded = true,               -- show diagnostics from unloaded buffers
      refresh = {
        delay = 100,                      -- Time (in ms) to wait before updating diagnostics. Might resolve some issues with Neovim hanging.
        event = "vim_diagnostic_changed", -- Event to use for updating diagnostics (for example `"neo_tree_buffer_enter"`)
        -- Set to `false` or `"none"` to disable automatic refreshing
        max_items = 10000,                -- The maximum number of diagnostic items to attempt processing
        -- Set to `false` for no maximum
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end
      },
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          -- This effectively hides the cursor
          vim.cmd 'highlight! Cursor blend=100'
        end
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Make this whatever your current Cursor highlight group is.
          vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
        end
      }
    }
  }, opts)
end
