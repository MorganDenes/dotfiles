return {
  'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
  -- Activate when a file is created/opened
  event = { 'BufReadPre', 'BufNewFile' },
  -- Activate when a supported filetype is open
  cond = function()
    -- Only activate if token is present in environment variable.
    -- Remove this line to use the interactive workflow.
    return vim.env.GITLAB_APIKEY ~= nil and vim.env.GITLAB_APIKEY ~= ''
  end,
  opts = {
    statusline = {
      -- Hook into the built-in statusline to indicate the status
      -- of the GitLab Duo Code Suggestions integration
      enabled = true,
    },
    code_suggestions = {
      -- For the full list of default languages, see the 'auto_filetypes' array in
      -- https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim/-/blob/main/lua/gitlab/config/defaults.lua
      auto_filetypes = {
        'clojure',
        'csharp',
        'cs',
        'fsharp',
        'fs',
        'gdscript',
        'gd',
        'javascript',
        'lua',
        'lua_ls',
      },
      ghost_text = {
        enabled = false, -- ghost text is an experimental feature
        toggle_enabled = "<C-h>",
        accept_suggestion = "<C-l>",
        clear_suggestions = "<C-k>",
        stream = true,
      },
    }
  },
  config = function (_, opts)
    require('gitlab').setup(opts)
  end,
}

