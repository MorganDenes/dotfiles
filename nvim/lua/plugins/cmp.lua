return {
  'hrsh7th/nvim-cmp',
  lazy = false,
  dependencies = {
    'onsails/lspkind.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  },
  config = function(_, _)
    local cmp = require('cmp')
    local opts = {
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      -- formatting = {
      --   format = require('lspkind').cmp_format({
      --     mode = 'symbol_text',
      --     before = function (_, vim_item) return vim_item end,
      --   })
      -- },
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {"i", "s"}),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true  }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }
      }, {
        name = 'buffer'
      })
    }

    cmp.setup(opts)
  end,
}

