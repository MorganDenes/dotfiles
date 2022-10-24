
local dap = require('dap')
dap.set_log_level('TRACE')

dap.adapters.coreclr = {
    type='executable',
    command='/home/morgan/Development/netcoredbg/netcoredbg',
    args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
    {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug', 'file')
        end
    },
}

require('dap.ext.vscode').load_launchjs("./.vscode/launch.json", { coreclr = { 'cs' } })

