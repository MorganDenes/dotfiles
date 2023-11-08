return {
  'mfussenegger/nvim-dap',
  lazy=false,
  keys = {
    {"<F2>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>"},
    {"<F5>", "<cmd>lua require'dap'.continue()<cr>"},
    {"<F10>", "<cmd>lua require'dap'.step_over()<cr>"},
    {"<F11>", "<cmd>lua require'dap'.step_into()<cr>"},
    {"<F12>", "<cmd>lua require'dap'.step_out()<cr>"},
    {"<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>"},
  },
  config = function (_, _)
    local dap = require('dap')

    -- lua --

    dap.configurations.lua = {
      -- TODO: Add lua configruation
    }

    -- C# F# --

    require('dap.ext.vscode').load_launchjs(nil, { coreclr = {'cs', 'fs'} })

    dap.adapters.coreclr = {
      type = 'executable',
      command = 'netcoredbg',
      args = {'--interpreter=vscode'},
    }
  end,
}
