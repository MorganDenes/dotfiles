
local telescope = require('telescope')
telescope.setup{
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'ignore_case'
        }
    }
}
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')


-- ff find files
-- fg  live grep
-- fb  buffers
-- fs  string grep
-- fh  search history
-- fr  resume

vim.keymap.set('n', '<leader>ff', builtin.find_files, { })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { })
vim.keymap.set('n', '<leader>fh', builtin.search_history, { })
vim.keymap.set('n', '<leader>fr', builtin.resume, { })






