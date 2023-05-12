return {
    {
        'vimwiki/vimwiki',
        init = function(_)
            vim.g.vimwiki_list = {
                {path = '~/dianoiatithemi/', syntax ='markdown', ext= '.md'},
                {path= '~/dogear/', syntax= 'markdown', ext= '.md'},
            }
        end,
    }
}

