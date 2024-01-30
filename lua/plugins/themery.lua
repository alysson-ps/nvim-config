local function getAllColorSchemes()
  local colorSchemes = {}
  local vimRuntimePath = vim.fn.execute(":silent echo globpath(&rtp, 'colors/*.vim')", true) -- Diretório onde os esquemas de cores geralmente são armazenados

  for line in vimRuntimePath:gmatch("[^\n]+") do
    local words = {}
    for word in line:gmatch("[^/]+") do
      table.insert(words, word)
    end
    local lastWord = words[#words]

    table.insert(colorSchemes, (string.gsub(lastWord, ".vim", "")))
  end

  return colorSchemes
end

return {
  "zaldih/themery.nvim",
  config = function(_, _)
    require("themery").setup({
      themes = getAllColorSchemes(),                           -- Your list of installed colorschemes
      -- themes = { "gruvbox-material", "sonokai", "tokyonight" },  -- Your list of installed colorschemes
      themeConfigFile = "~/.config/nvim/lua/config/color.lua", -- Described below
      livePreview = true,                                      -- Apply theme while browsing. Default to true.
    })
  end
}
