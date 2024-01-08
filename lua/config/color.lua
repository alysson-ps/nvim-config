local M = {}

function M.readColorScheme()
  local colorscheme_file = vim.fn.stdpath('config') .. '/.colorscheme'

  local file = vim.fn.readfile(colorscheme_file)[1]

  print(file)
end

return M
