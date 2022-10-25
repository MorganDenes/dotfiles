
local telescope = require('telescope')

telescope.setup{
    extensions = {
        fzf = {
            fuzzy = true,
            case_mode = 'ignore_case'
        }
    }
}
telescope.load_extension('fzf')

