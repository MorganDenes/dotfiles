return {
  {
    'lewis6991/gitsigns.nvim',
    config = function(_, _)
      require('gitsigns').setup()
      require('pixel/colorsigns').gitsigns()
    end,
  },
  {
    'tpope/vim-fugitive',
    keys = {
      {"<leader>g", "<cmd>tab Git<cr>"},
    },
  },
}
