vim.diagnostic.config({
    virtual_text = false,
})
require'lsp_lines'.setup{}

vim.keymap.set("n", "<Leader>d", require("lsp_lines").toggle)

