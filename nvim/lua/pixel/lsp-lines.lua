vim.diagnostic.config({
    virtual_text = false,
})
require'lsp_lines'.setup{}

vim.keymap.set("n", "<Leader>d",
    function()
        vim.diagnostic.config({
            virtual_text = not require("lsp_lines").toggle(),
        })
    end
)

