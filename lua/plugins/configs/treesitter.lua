return function(_, _)
  -- [[ Configure Treesitter ]]
  -- See `:help nvim-treesitter`
  -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
  vim.defer_fn(function()
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'lua', 'vimdoc', 'vim', 'bash' },
      sync_install = false,

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,
      ignore_install = {},
      autotag = {
        enable = true,
      },

      highlight = { enable = true, },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      modules = {},
      refactor = {
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,     -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true,           -- Automatically jump forward to textobj, similar to targets.vim
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ['aa'] = '@parameter.outer',
      --       ['ia'] = '@parameter.inner',
      --       ['af'] = '@function.outer',
      --       ['if'] = '@function.inner',
      --       ['ac'] = '@class.outer',
      --       ['ic'] = '@class.inner',
      --     },
      --   },
      --   move = {
      --     enable = true,
      --     set_jumps = true,           -- whether to set jumps in the jumplist
      --     goto_next_start = {
      --       [']m'] = '@function.outer',
      --       [']]'] = '@class.outer',
      --     },
      --     goto_next_end = {
      --       [']M'] = '@function.outer',
      --       [']['] = '@class.outer',
      --     },
      --     goto_previous_start = {
      --       ['[m'] = '@function.outer',
      --       ['[['] = '@class.outer',
      --     },
      --     goto_previous_end = {
      --       ['[M'] = '@function.outer',
      --       ['[]'] = '@class.outer',
      --     },
      --   },
      --   swap = {
      --     enable = true,
      --     swap_next = {
      --       ['<leader>a'] = '@parameter.inner',
      --     },
      --     swap_previous = {
      --       ['<leader>A'] = '@parameter.inner',
      --     },
      --   },
      -- },
    }
  end, 0)
end
