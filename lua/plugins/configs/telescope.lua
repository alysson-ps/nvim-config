return function(_, _)
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  require('telescope').setup {
    defaults = {
      -- layout_config = "bottom",
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
          -- ["<C-q>"] = function(prompt_bufnr)
          --   local colorscheme_file = vim.fn.stdpath('config') .. '/.colorscheme'
          --
          --   local selection = require('telescope.actions.state').get_selected_entry()
          --   vim.cmd('colorscheme ' .. selection.value)
          --   vim.fn.writefile({ selection.value }, colorscheme_file)
          --   require('telescope.actions').close(prompt_bufnr)
          -- end,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown"
      },
      git = {
        theme = "dropdown"
      },
      -- colorscheme = {
      --   theme = "dropdown",
      --   enable_preview = true,
      --   on_complete = function(_)
      --     print("aqui")
      --   end
      -- }
    }
  }

  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')
  pcall(require("telescope").load_extension, "ui-select")
  pcall(require("telescope").load_extension, "project")
  -- Telescope live_grep in git root
  -- Function to find the git root directory based on the current buffer's path

  -- See `:help telescope.builtin

  -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  -- vim.keymap.set('n', '<leader>/', function()
  --     -- You can pass additional configuration to telescope to change theme, layout, etc.
  --     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --         winblend = 10,
  --         previewer = false,
  --     })
  -- end, { desc = '[/] Fuzzily search in current buffer' })

  -- local function telescope_live_grep_open_files()
  --     require('telescope.builtin').live_grep {
  --         grep_open_files = true,
  --         prompt_title = 'Live Grep in Open Files',
  --     }
  -- end
  -- vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
  -- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
  -- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
  -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  -- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
  -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  -- vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
end
