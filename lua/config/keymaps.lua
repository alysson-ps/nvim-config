-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = "Select all lines", silent = true })
-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Basic keymaps
vim.keymap.set('n', '<leader>q', ':confirm q!<cr>', { desc = 'Quit', silent = true })
vim.keymap.set('n', '<leader>Q', ':confirm qall<cr>', { desc = 'Quit all', silent = true })
vim.keymap.set('n', '<leader>w', ':silent w<cr>', { desc = 'Save', silent = true })
vim.keymap.set('n', '<leader>c', function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = 'Close buffer', silent = true })

-- Find keymaps
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', { desc = 'Find files', silent = true })
vim.keymap.set('n', '<leader>fw', ':Telescope live_grep<cr>', { desc = 'Find text', silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Find buffers', silent = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Find help', silent = true })
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<cr>', { desc = 'Find old files', silent = true })
vim.keymap.set('n', '<leader>fd', ':Telescope diff_files<cr>', { desc = 'Find diff', silent = true })
vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>', { desc = 'Find command', silent = true })
vim.keymap.set('n', '<leader>ft', ':Telescope colorscheme<cr>', { desc = 'Find colorscheme', silent = true })
vim.keymap.set('n', '<leader>f/', ':Telescope current_buffer_fuzzy_find<cr>', { desc = 'Find in file', silent = true })
vim.keymap.set('n', '<leader>fp', ':lua require("telescope").extensions.project.project{}<cr>',
  { desc = 'Find projects', silent = true })
vim.keymap.set('n', '<leader>fT', ':Telescope filetypes<cr>', { desc = 'Find files types', silent = true })

-- NeoTree keymaps
-- vim.keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { desc = 'Toggle explorer', silent = true })
-- vim.keymap.set('n', '<leader>o', function()
--   if vim.bo.filetype == "neo-tree" then
--     vim.cmd.wincmd "p"
--   else
--     vim.cmd.Neotree "focus"
--   end
-- end, { desc = 'Toggle explorer focus', silent = true })

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = 'Toggle explorer', silent = true })

-- Plugins
vim.keymap.set('n', '<leader>pp', ':Lazy<cr>', { desc = 'Open Lazy', silent = true })
vim.keymap.set('n', '<leader>pl', ':Lazy load all<cr>', { desc = 'Lazy load all', silent = true })
vim.keymap.set('n', '<leader>pu', ':Lazy update<cr>', { desc = 'Lazy update', silent = true })
vim.keymap.set('n', '<leader>pc', ':Lazy clean<cr>', { desc = 'Lazy clean', silent = true })

-- Git keymaps
vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { desc = 'LazyGit', silent = true })
vim.keymap.set('n', '<leader>gs', ':lua require("telescope.builtin").git_status { use_file_path = true }<cr>',
  { desc = 'Git status', silent = true })
vim.keymap.set('n', '<leader>gb', ':lua require("telescope.builtin").git_branches()<cr>',
  { desc = 'Git branches', silent = true })
vim.keymap.set('n', '<leader>gc', ':lua require("telescope.builtin").git_commits()<cr>',
  { desc = 'Git commits', silent = true })

vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', ':noh<cr>', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>', {
  desc = "Open terminal in tab mode",
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>xx', ':TroubleToggle<cr>',
  { silent = true, noremap = true, desc = 'Open diagnostics painel' })
