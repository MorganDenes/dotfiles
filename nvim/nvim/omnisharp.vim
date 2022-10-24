
let g:sharpenup_map_prefix = '<space>os'

let g:OmniSharp_popup_option = {
            \ 'winhl':'Normal:NormalFloat'
            \ }

let g:OmniSharp_server_use_net6 = 1

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_popup_mappings = {
            \ 'sigNext':'<C-n>',
            \ 'sigPrev':'<C-p>',
            \ }

let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
\ 'border': 'rounded'
\}

noremap gh :OmniSharpDocumentation<cr>

" augroup shortcuts
    " autocmd!

    " autocmd FileType cs nmap <slient> <buffer> gd <Plug>(omnisharp_go_to_definition)
    " autocmd FileType cs nmap <slient> <buffer> <leader>osfu <Plug>(omnisharp_find_usages)
    " autocmd FileType cs nmap <slient> <buffer> <leader>fi <Plug>(omnisharp_find_implementations)
    " autocmd FileType cs nmap <slient> <buffer> <leader>pd <Plug>(omnisharp_preview_definition)
    " autocmd FileType cs nmap <slient> <buffer> <leader>pi <Plug>(omnisharp_preview_implementations)
    " autocmd FileType cs nnoremap <slient> <buffer> <leader>t <Plug>(omnisharp_type_lookup)
    " autocmd FileType cs nnoremap <slient> <buffer> <leader>d <Plug>(omnisharp_documentation)
    " autocmd FileType cs nmap <slient> <buffer> <leader>fs <Plug>(omnisharp_find_symbol)
    " autocmd FileType cs nmap <slient> <buffer> <leader>fx <Plug>(omnisharp_fix_usings)

    " autocmd FileType cs nmap <slient> <buffer> <leader>osgcc <Plug>(omnisharp_global_code_check)
    " autocmd FileType cs nmap <slient> <buffer> <leader>ca <Plug>(omnisharp_global_code_check)
    " autocmd FileType cs xmap <slient> <buffer> <leader>ca <Plug>(omnisharp_global_code_check)
    " autocmd FileType cs nmap <slient> <buffer> <F2> <Plug>(omnisharp_rename)
" augroup END




