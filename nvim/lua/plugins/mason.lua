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
            -- volar and fsautocomplete not set to autoload because not all images have npm or dotnet installed
            ensure_installed = {
                'lua_ls',
                'omnisharp',
            },
        },
        config = function(_, opts)
            require('mason-lspconfig').setup(opts)
        end,
    },
}

