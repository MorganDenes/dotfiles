return {
    -- { 'junegunn/fzf', lazy = true },
    -- { 'junegunn/fzf.vim' },

    -------------------
    -- TELESCOPE FZF --
    -------------------
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    ---------------
    -- TELESCOPE --
    ---------------
    {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.8",
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'ignore_case'
                }
            },
            defaults = {
              path_display = {
                "shorten",
              },
            },
        },
        keys = {
            {"<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
            {"<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
            {"<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>"},
            {"<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>"},
            {"<leader>fh", "<cmd>lua require('telescope.builtin').search_history()<cr>"},
            {"<leader>fr", "<cmd>lua require('telescope.builtin').resume()<cr>"},
        },
        config = function(_, opts)
            local telescope = require('telescope')
            telescope.load_extension('fzf')
            require("telescope").setup(opts)
        end,
    }
}

