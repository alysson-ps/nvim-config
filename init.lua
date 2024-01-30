local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.cmd('set confirm')

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")
require("config.commands")

require("config.color")

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- -- Configure as cores do NvimTree
-- vim.cmd [[highlight NvimTreeNormal guibg=NONE ctermbg=NONE]]
--
-- -- Cor do texto
-- vim.cmd [[highlight NvimTreeNormal guifg=#abb2bf ctermfg=white]]
--
-- -- Destaque do item selecionado
-- vim.cmd [[highlight NvimTreeCursorLine guibg=#383c4a ctermbg=NONE]]
-- vim.cmd [[highlight NvimTreeCursorLine guifg=NONE ctermfg=NONE]]
--
-- -- Destaque do item selecionado quando o cursor está na linha
-- vim.cmd [[highlight NvimTreeCursorLine guibg=#383c4a ctermbg=NONE]]
-- vim.cmd [[highlight NvimTreeCursorLine guifg=NONE ctermfg=NONE]]

-- vim.cmd([[colorscheme tokyonight-moon]])
--

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
