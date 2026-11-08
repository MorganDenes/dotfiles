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
        tag = "v0.2.2",
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
        config = function(_, opts)
            local telescope = require('telescope')
            telescope.load_extension('fzf')
            require("telescope").setup(opts)
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume' })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string' })
        end,
    }
}

