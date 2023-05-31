local M = { }

function M.setup()
  local set = vim.opt
  -- Render spaces with '·' instead of blank
  set.lcs:append("space:·")

  set.smartindent = true
  set.autoindent = true
  set.shiftwidth = 4
  set.tabstop = 4
  set.softtabstop = 4
  set.expandtab = true

  local augroup = vim.api.nvim_create_augroup('tabspace_width', {clear = true})
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {'*.fs','*.txt'},
    group = augroup,
    callback = function()
      set.smartindent = false
      set.autoindent = false
      set.shiftwidth = 4
      set.tabstop = 4
      set.softtabstop = 4
      set.expandtab = true
    end
  })
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {'*.sh','*.cs','*.c','*.cpp','*.h','*.ps1'},
    group = augroup,
    callback = function()
      set.smartindent = true
      set.autoindent = true
      set.shiftwidth = 4
      set.tabstop = 4
      set.softtabstop = 4
      set.expandtab = true
    end
  })
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {'*.json','*.css','*.html','*.vue', '*.lua'},
    group = augroup,
    callback = function()
      set.smartindent = true
      set.autoindent = true
      set.shiftwidth = 2
      set.tabstop = 2
      set.softtabstop = 2
      set.expandtab = true
    end
  })
end

return M

