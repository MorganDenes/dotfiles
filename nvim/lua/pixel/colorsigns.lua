
local M = { }

function M.lsp()
  local augroup = vim.api.nvim_create_augroup('lsp_colors', {clear = true})
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = augroup,
    callback = function()
      vim.fn.sign_define('DiagnosticSignError', {text='•', texthl='DiagnosticSignError'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignError', {ctermfg='red',ctermbg='lightgrey'})

      vim.fn.sign_define('DiagnosticSignWarn', {text='•', texthl='DiagnosticSignWarn'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {ctermfg='darkyellow',ctermbg='lightgrey'})

      vim.fn.sign_define('DiagnosticSignInfo', {text='·', texthl='DiagnosticSignInfo'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', {ctermfg='darkblue',ctermbg='lightgrey'})

      vim.fn.sign_define('DiagnosticSignHint', {text='·', texthl='DiagnosticSignHint'})
      vim.api.nvim_set_hl(0, 'DiagnosticHint', {ctermfg='darkblue',ctermbg='white'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignHint', {ctermfg='darkblue',ctermbg='lightgrey'})
    end
  })
end

function M.gitsigns()
  local augroup = vim.api.nvim_create_augroup('gitsigns_colors', {clear = true})
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = augroup,
    callback = function()
      vim.api.nvim_set_hl(0, 'GitSignsAdd', {ctermfg='darkgreen',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'GitSignsDelete', {ctermfg='red',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'GitSignsUntracked', {ctermfg='darkblue',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'GitSignsChange', {ctermfg='darkyellow',ctermbg='lightgrey'})
    end
  })
end

function M.setup()
  local set = vim.opt
  set.colorcolumn = "80"
  set.signcolumn = 'yes'
  set.background = "light"
  vim.cmd([[colorscheme solarized]])
end

return M

