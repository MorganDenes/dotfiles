return {
    -- { 'nvim-tree/nvim-web-devicons', },
    {
        'nvim-tree/nvim-tree.lua',
        version="*",
        lazy=false,
        dependencies={
            'nvim-tree/nvim-web-devicons',
        },
        opts = {},
        keys={
            {"<leader>e", "<cmd>NvimTreeFocus<cr>"},
        },
        config = function(_, opts)
            require('nvim-tree').setup(opts)
            vim.api.nvim_create_autocmd({ "VimEnter" }, {
                callback = require("nvim-tree.api").tree.open
            })
        end,
    },
}

