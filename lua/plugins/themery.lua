function GetAllColorSchemes()
    local colorSchemes = {}
    local vimRuntimePath = vim.fn.execute(":echo globpath(&rtp, 'colors/*.vim')", true) -- Diretório onde os esquemas de cores geralmente são armazenados

    print(vimRuntimePath)

    return colorSchemes
end

return {
  "zaldih/themery.nvim",
  config = function(_, _)
    require("themery").setup({
      -- themes = { "gruvbox-material", "sonokai", "tokyonight" },  -- Your list of installed colorschemes
      themes = { "gruvbox-material", "sonokai", "tokyonight" },  -- Your list of installed colorschemes
      themeConfigFile = "~/.config/nvim/lua/settings/theme.lua", -- Described below
      livePreview = true,                                        -- Apply theme while browsing. Default to true.
    })
  end
}
