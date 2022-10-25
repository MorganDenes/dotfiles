local nvim_lsp = require('lspconfig')
local servers = { }

local on_attach = funcion(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '')
end




