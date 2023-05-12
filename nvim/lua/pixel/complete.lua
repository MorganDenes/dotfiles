
local M = {}

function M.setup()
  local mapset = vim.keymap.set
  mapset('i', "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { expr = true })
  mapset('i', "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { expr = true })
  mapset('i', "<cr>", "pumvisible() ? asyncomplete#close_popup() : '<cr>'", { expr = true })
end

return M

