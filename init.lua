local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")

require("config.color")

vim.cmd([[colorscheme gruvbox-material]])
