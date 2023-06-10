local set = vim.opt
local let = vim.g
local mapset = vim.keymap.set

set.backup = false
set.encoding = "utf-8"
set.mouse = 'a'
set.splitbelow = true
set.swapfile = false
set.undodir = '~/.vim/undodir'

--

set.matchpairs:append("<:>")
set.showmatch = true

set.hlsearch = false
set.showmode = false
set.ignorecase = true
set.list = true
set.wildmode = 'list:lastused'
set.completeopt = 'menu,menuone'

local function map(mode, lhs, rhs)
    mapset(mode, lhs, rhs, { noremap = true })
end

local function nmap(lhs, rhs)
    map('n', lhs, rhs)
end

local function imap(lhs, rhs)
    map('i', lhs, rhs)
end

function SetEngram()
    set.langmap="'h,hj,tk,sl,jt,ks,\"H,HJ,TK,SL,JT,KS"
    -- TODO: Can't seem to target quote for commands
    -- nmap("<C-quote>", '<C-w>h')
    nmap('<C-h>', '<C-w>j')
    nmap('<C-t>', '<C-w>k')
    nmap('<C-s>', '<C-w>l')
end

function SetQwerty()
    nmap('<C-h>', '<C-w>h')
    nmap("<C-j>", '<C-w>j')
    nmap('<C-k>', '<C-w>k')
    nmap('<C-l>', '<C-w>l')
end

let.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")
require("pixel")

nmap('<leader>dbs', '<cmd>so ~/.config/nvim/init.lua<CR>')

--[[

vim.cmd([ [

Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

] ])

vim.cmd([ [
function! ImportConfig(file)
  exec printf('source %s', fnamemodify(expand('$MYVIMRC'), ':h') . expand('/') . a:file)
endfunction

call ImportConfig('omnisharp.vim')
call ImportConfig('dap.vim')
] ])

mapset('i', '<C-space>', '<Plug>(async_force_refresh)')

--]]

