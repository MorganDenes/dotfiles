return {
  'smithbm2316/centerpad.nvim',
  lazy = false,
  keys = {
    {"<leader>z", "<cmd>Centerpad<cr>", { silent = true, noremap = true }},
  },
  config = function(_,_)
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          require"centerpad".toggle{ leftpad = 36, rightpad = 36 }
        end
    })
  end,
  init = function(_)
  end
}

