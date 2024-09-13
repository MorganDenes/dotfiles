return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = function(_, _)
    ---@class parser_config
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.fsharp = {
      install_info = {
        url = 'https://github.com/ionide/tree-sitter-fsharp',
        branch = 'main',
        files = { 'src/scanner.c', 'src/parser.c' },
        location = "fsharp"
      },
      requires_generate_from_grammar = false,
      filetype = 'fsharp',
    }
    require("nvim-treesitter.configs").setup{
      highlight = { enable = true },
      -- indent = { enable = true },
      ensure_installed  = {
        'bash',
        'c_sharp',
        'clojure',
        'dockerfile',
        'fish',
        'gitignore',
        'make',
        'regex',
        'fsharp',
      },
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      modules = {}
    }
  end
}

