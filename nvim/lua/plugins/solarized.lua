return {
  'maxmx03/solarized.nvim',
  opts = {
    styles = {
      comments = { italic = true },
      functions = { italic = false, bold = true },
      variables = { italic = true },
      strings = { italic = true },
      keyword = { bold = true },
    },
    variant = 'spring',
  },
  config = function(_, opts)
    -- vim.o.termguicolors = true
    vim.cmd.colorscheme 'vim'
    vim.o.background = 'light'
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}

