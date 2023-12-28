return function(_, opts)
  require("alpha").setup(opts.config)
  local lazy = require("lazy")

  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        lazy.show()
      end,
    })
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    desc = "Add Alpha dashboard footer",
    once = true,
    callback = function()
      local stats = lazy.stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      opts.section.footer.val = { "AstroNvim loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  -- vim.cmd([[
  --   autocmd FileType alpha setlocal nofoldenable
  -- ]])
end
