local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd('set confirm')

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")
require("config.commands")

require("config.color")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configure as cores do NvimTree
vim.cmd [[highlight NvimTreeNormal guibg=NONE ctermbg=NONE]]

-- Cor do texto
vim.cmd [[highlight NvimTreeNormal guifg=#abb2bf ctermfg=white]]

-- Destaque do item selecionado
vim.cmd [[highlight NvimTreeCursorLine guibg=#383c4a ctermbg=NONE]]
vim.cmd [[highlight NvimTreeCursorLine guifg=NONE ctermfg=NONE]]

-- Destaque do item selecionado quando o cursor está na linha
vim.cmd [[highlight NvimTreeCursorLine guibg=#383c4a ctermbg=NONE]]
vim.cmd [[highlight NvimTreeCursorLine guifg=NONE ctermfg=NONE]]

vim.cmd([[colorscheme tokyonight-moon]])
