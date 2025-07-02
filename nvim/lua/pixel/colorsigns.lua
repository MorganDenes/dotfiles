
local M = { }

function M.lsp()
  local augroup = vim.api.nvim_create_augroup('lsp_colors', {clear = true})
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = augroup,
    callback = function()
      vim.api.nvim_set_hl(0, 'DiagnosticSignError', {ctermfg='red',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', {ctermfg='darkyellow',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', {ctermfg='darkblue',ctermbg='lightgrey'})
      vim.api.nvim_set_hl(0, 'DiagnosticHint', {ctermfg='darkblue',ctermbg='white'})
      vim.api.nvim_set_hl(0, 'DiagnosticSignHint', {ctermfg='darkblue',ctermbg='lightgrey'})

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '•',
            [vim.diagnostic.severity.WARN] = '•',
            [vim.diagnostic.severity.INFO] = '·',
            [vim.diagnostic.severity.HINT] = '·',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
          },
        },
      })
    end
  })

  vim.keymap.set("n", "<leader>dv", function()
    vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_lines })
  end, { desc = "Toggle diagnostics virtual text" })
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
end

return M

