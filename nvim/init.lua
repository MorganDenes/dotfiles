local set = vim.opt
local let = vim.g
local mapset = vim.keymap.set

set.autoindent = true
set.background = "light"
set.colorcolumn = "80"
set.encoding = "utf-8"
set.smartindent = true
set.ignorecase = true
set.lcs:append("space:·")
set.list = true
set.matchpairs:append("<:>")
set.mouse = 'a'
set.backup = false
set.hlsearch = false
set.showmode = false
set.wrap = false
set.number = true
set.relativenumber = true
set.numberwidth = 4
set.scrolloff = 12
set.swapfile = false
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.showmatch = true
set.signcolumn = 'yes'
set.expandtab = true
set.wildmode = 'list:lastused'
set.splitbelow = true
set.undodir = '~/.vim/undodir'
set.completeopt = 'menu,menuone,noselect'

let.mapleader = " "

vim.cmd([[
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'puremourning/vimspector'

Plug 'neovim/nvim-lspconfig'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-fugitive'
Plug 'shatur/neovim-session-manager'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

call plug#end()
]])

vim.cmd([[
filetype plugin indent on
syntax on
colorscheme solarized

autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp

]])

require('pixel/init')

vim.cmd([[
let g:ale_sign_error='•'
let g:ale_sign_warning='•'
let g:ale_sign_info='·'
let g:ale_sign_style_error='·'
let g:ale_sign_style_warning='·'

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1

let g:ale_linters = { 'cs' : ['OmniSharp'], 'fsharp' : ['fsautocomplete']}

function! SetEngram()
    set langmap='h,hj,tk,sl,jt,ks,"H,HJ,TK,SL,JT,KS
endfunction

function! SetQwerty()
endfunction
]])


vim.cmd([[
function! ImportConfig(file)
  exec printf('source %s', fnamemodify(expand('$MYVIMRC'), ':h') . expand('/') . a:file)
endfunction

call ImportConfig('omnisharp.vim')
call ImportConfig('dap.vim')
]])

function map(mode, lhs, rhs)
    mapset(mode, lhs, rhs, { noremap = true })
end

function nmap(lhs, rhs)
    map('n', lhs, rhs)
end

function imap(lhs, rhs)
    map('i', lhs, rhs)
end

mapset('i', '<C-space>', '<Plug>(async_force_refresh)')
mapset('i', "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { expr = true })
mapset('i', "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { expr = true })
mapset('i', "<cr>", "pumvisible() ? asyncomplete#close_popup() : '<cr>'", { expr = true })

nmap("<C-quote>", '<C-w>h')
nmap('<C-h>', '<C-w>j')
nmap('<C-t>', '<C-w>k')
nmap('<C-s>', '<C-w>l')

nmap('<leader>e', '<cmd>NvimTreeFocus<cr>')
nmap('<leader>dbs', '<cmd>so ~/.config/nvim/init.lua<CR>')
nmap('<leader>g', '<cmd>tab Git<CR>')




