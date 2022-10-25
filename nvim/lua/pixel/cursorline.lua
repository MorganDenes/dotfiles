local M = { }

local w = vim.w
local a = vim.api
local au = a.nvim_create_autocmd
local hl = a.nvim_set_hl
local fn = vim.fn

function matchadd()
    local column = a.nvim_win_get_cursor(0)[2]
    local line = a.nvim_get_current_line()
    local cursorword = fn.matchstr(line:sub(1, column + 1), [[\k*$]])
        .. fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

    if (cursorword == w.cursorword) then
        return
    end
    w.cursorword = cursorword

    if w.cursorword_id then
        vim.call("matchdelete", w.cursorword_id)
        w.cursorword_id = nil
    end
    if cursorword == ""
        or #cursorword > 100
        or #cursorword < 3
        or string.find(cursorword, "[\192-\255]+") ~= nil
    then
        return
    end
    w.cursorword_id = fn.matchadd("CursorWord", [[\<]] .. cursorword .. [[\>]])
end

function M.setup()
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true
    au("WinEnter", {
        callback = function()
            if vim.fn.expand('%') == "NvimTree_1" then
                return
            end
            vim.wo.cursorcolumn = true
        end
    })
    au("WinLeave", {
        callback = function()
            vim.wo.cursorcolumn = false
        end
    })
    au("VimEnter", {
        callback = function()
            hl(0, "CursorWord", { underline = true })
            matchadd()
        end
    })
    au({ "CursorMoved", "CursorMovedI" }, {
        callback = function()
            matchadd()
        end
    })
end

return M
