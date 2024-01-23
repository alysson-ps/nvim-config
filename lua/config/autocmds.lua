-- TODO: refactor to utils

local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')
      [1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

---@diagnostic disable: undefined-field
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command
local namespace = vim.api.nvim_create_namespace

autocmd({ "User", "BufWinEnter" }, {
  desc = "Disable status, tablines, and cmdheight for alpha",
  group = augroup("alpha_settings", { clear = true }),
  callback = function(args)
    if
        (
          (args.event == "User" and args.file == "AlphaReady")
          or (args.event == "BufWinEnter" and vim.api.nvim_get_option_value("filetype", { buf = args.buf }) == "alpha")
        ) and not vim.g.before_alpha
    then
      vim.g.before_alpha = {
        showtabline = vim.opt.showtabline:get(),
        laststatus = vim.opt.laststatus:get(),
        cmdheight = vim.opt.cmdheight:get(),
      }
      vim.opt.showtabline, vim.opt.laststatus, vim.opt.cmdheight = 0, 0, 0
    elseif
        vim.g.before_alpha
        and args.event == "BufWinEnter"
        and vim.api.nvim_get_option_value("buftype", { buf = args.buf }) ~= "nofile"
    then
      vim.opt.laststatus, vim.opt.showtabline, vim.opt.cmdheight =
          vim.g.before_alpha.laststatus, vim.g.before_alpha.showtabline, vim.g.before_alpha.cmdheight
      vim.g.before_alpha = nil
    end
  end,
})
autocmd("VimEnter", {
  desc = "Start Alpha when vim is opened with no arguments",
  group = augroup("alpha_autostart", { clear = true }),
  callback = function()
    local should_skip
    local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
    if
        vim.fn.argc() > 0                                                                                    -- don't start when opening a file
        or #lines > 1                                                                                        -- don't open if current buffer has more than 1 line
        or (#lines == 1 and lines[1]:len() > 0)                                                              -- don't open the current buffer if it has anything on the first line
        or #vim.tbl_filter(function(bufnr) return vim.bo[bufnr].buflisted end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
        or not vim.o.modifiable                                                                              -- don't open if not modifiable
    then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
          should_skip = true
          break
        end
      end
    end
    if should_skip then return end
    require("alpha").start(true, require("alpha").default_config)
    vim.schedule(function() vim.cmd.doautocmd "FileType" end)
  end,
})

-- Neotree

-- autocmd("BufEnter", {
--   desc = "Open Neo-Tree on startup with directory",
--   group = augroup("neotree_start", { clear = true }),
--   callback = function()
--     if package.loaded["neo-tree"] then
--       vim.api.nvim_del_augroup_by_name "neotree_start"
--     else
--       local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
--       if stats and stats.type == "directory" then
--         vim.api.nvim_del_augroup_by_name "neotree_start"
--         require "neo-tree"
--       end
--     end
--   end,
-- })
-- autocmd("TermClose", {
--   pattern = "*lazygit*",
--   desc = "Refresh Neo-Tree when closing lazygit",
--   group = augroup("neotree_refresh", { clear = true }),
--   callback = function()
--     local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
--     if manager_avail then
--       for _, source in ipairs { "filesystem", "git_status", "document_symbols" } do
--         local module = "neo-tree.sources." .. source
--         if package.loaded[module] then manager.refresh(require(module).name) end
--       end
--     end
--   end,
-- })

autocmd("BufWritePre", {
  -- buffer = buffer,
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})
