
local set = vim.keymap.set
local on_attach = function(client, bufnr)
    bufopts = {noremap = true, silent = true, buffer = bufnr}
    set('n', 'gd', vim.lsp.buf.definition, bufopts)
    set('n', 'gh', vim.lsp.buf.hover, bufopts)
    set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
    set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    set('v', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    set('i', '<C-Space>', vim.lsp.buf.completion, bufopts)
    -- set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", bufopts)
end

-- require'lspsaga'.setup({
    -- ui = {
        -- border = 'double'
    -- }
-- })

require 'lspconfig'.fsautocomplete.setup{
    cmd= { "fsautocomplete", "--adaptive-lsp-server-enabled"  },
    on_attach = on_attach,
    -- on_attach=require'completion'.on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

