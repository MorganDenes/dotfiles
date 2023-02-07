
--vim.g.sharpenup_statusline_opts.Highlight = 0
vim.g.lightline = {
    active = {
        left = {
            { 'mode', 'past'},
            { 'gitbranch' },
            { 'relativepath', 'modified' }
        },
        right = {
            {'lineinfo'},
            {'percent'},
            {'fileformat', 'fileencoding', 'filetype'}
        }
    },
    component_function = {
        gitbranch = 'FugitiveHead',
        sharpenup = 'sharpenup#statusline#Build'
    },
    component_expand = {
        linter_checking = 'lightline#ale#checking'
    }
}

