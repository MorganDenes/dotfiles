
return {
    -- {'glepnir/lspsaga.nvim'},
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'glepnir/lspsaga.nvim',
        },
        config = function(_, _)
            local set = vim.keymap.set
            require('pixel/colorsigns').lsp()
            local on_attach = function(_, bufnr)
                local bufopts = {noremap = true, silent = true, buffer = bufnr}
                set('n', 'gd', vim.lsp.buf.definition, bufopts)
                set('n', 'gh', vim.lsp.buf.hover, bufopts)
                set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
                set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
                set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                set({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
                set('i', '<C-Space>', vim.lsp.buf.completion, bufopts)
                -- set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", bufopts)
                set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
                set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
                set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
                set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
                set("n","<leader>o", "<cmd>Lspsaga outline<CR>")
                set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
            end

            require'lspsaga'.setup({
                ui = {
                    border = 'rounded'
                }
            })

            local lsp = require('lspconfig')
            local home = os.getenv("HOME")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- LUA --
            lsp.lua_ls.setup{
              settings = {
                Lua = {
                  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                  runtime = { version = 'LuaJIT' },
                  -- Get the language server to recognize the `vim` global
                  diagnostics = { globals = {'vim'} },
                  -- Make the server aware of Neovim runtime files
                  workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                  telemetry = { enable = false },
                },
              },
              on_attach = on_attach,
              capabilities = capabilities,
            }

            -- C# --
            lsp.omnisharp.setup{
              cmd = { "omnisharp" },
              on_attach = on_attach,
              capabilities = capabilities,
            }

            -- F# --
            lsp.fsautocomplete.setup{
              cmd= { "fsautocomplete", "--adaptive-lsp-server-enabled"  },
              on_attach = on_attach,
              capabilities = capabilities,
            }

            -- Clojure --
            lsp.clojure_lsp.setup{
              on_attach = on_attach,
              capabilities = capabilities,
            }

            -- Vue Javascript Json TypeScript --
            lsp.volar.setup{
              -- Take over mode
              filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
              on_attach = on_attach,
              capabilities = capabilities,
            }
        end,
    },
}

