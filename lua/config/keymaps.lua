-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Basic keymaps
vim.keymap.set('n', '<leader>q', ':confirm q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':confirm qall<cr>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>w', ':w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>c', ':bd<cr>', { desc = 'Close buffer' })


-- Find keymaps
vim.keymap.set('n', '<leader>ff', ':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown{previewer = false})<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fw', ':Telescope live_grep<cr>', { desc = 'Find text' })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Find help' })
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<cr>', { desc = 'Find old files' })
vim.keymap.set('n', '<leader>fd', ':Telescope diff_files<cr>', { desc = 'Find diff' })
vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>', { desc = 'Find command' })
vim.keymap.set('n', '<leader>ft', ':lua require("telescope.builtin").colorscheme() <cr>', { desc = 'Find colorscheme' })


-- NeoTree keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { desc = 'Toggle explorer' })
vim.keymap.set('n', '<leader>o', function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd.Neotree "focus"
  end
end, { desc = 'Toggle explorer focus' })

-- Plugins
vim.keymap.set('n', '<leader>pp', ':Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<leader>pl', ':Lazy load all<cr>', { desc = 'Lazy load all' })
vim.keymap.set('n', '<leader>pu', ':Lazy update<cr>', { desc = 'Lazy update' })
vim.keymap.set('n', '<leader>pc', ':Lazy clean<cr>', { desc = 'Lazy clean' })

-- Git keymaps
vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>gt', ':lua require("telescope.builtin").git_status { use_file_path = true }<cr>',
  { desc = 'Git status' })
vim.keymap.set('n', '<leader>gb', ':lua require("telescope.builtin").git_branches()<cr>', { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', ':lua require("telescope.builtin").git_commits()<cr>', { desc = 'Git commits' })
