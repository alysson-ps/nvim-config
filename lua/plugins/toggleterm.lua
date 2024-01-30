return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function(_, _)
    require("toggleterm").setup({
      open_mapping = [[<c-p>]],
    })
  end
}
