return {
    {
        'williamboman/mason.nvim',
        config = function(_,_)
            require('mason').setup()
        end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            -- volar not set to autoload because not all images have npm installed
            ensure_installed = {
                'lua_ls',
                'fsautocomplete',
                'omnisharp',
            },
        },
        config = function(_, opts)
            require('mason-lspconfig').setup(opts)
        end,
    },
}

