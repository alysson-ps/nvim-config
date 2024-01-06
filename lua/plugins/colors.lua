return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
  { "folke/tokyonight.nvim",          lazy = false, priority = 1000, },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function(_, _)
      vim.cmd([[colorscheme sonokai]])
    end
  },
  { "ayu-theme/ayu-vim",              lazy = false, priority = 1000 },
  { "catppuccin/nvim",                lazy = false, priority = 1000 },
  { "edeneast/nightfox.nvim",         lazy = false, priority = 1000 },
  { "rose-pine/neovim",               lazy = false, priority = 1000 },
  { "srcery-colors/srcery-vim",       lazy = false, priority = 1000 },
  { "Rigellute/shades-of-purple.vim", lazt = false, priority = 1000 },
}
