local M = {}
local function format(a_diagnostic)
    return a_diagnostic.message
end

local function prefix(a_diagnostic, i, total)
    if a_diagnostic.severity == vim.diagnostic.severity.ERROR then
        return "✘  "
    end
    if a_diagnostic.severity == vim.diagnostic.severity.WARN then
        return "⚠ "
    end
    if a_diagnostic.severity == vim.diagnostic.severity.INFO then
        return "🛈  "
    end
    if a_diagnostic.severity == vim.diagnostic.severity.HINT then
        return "☛  "
    end
    return ""

end

local function callback()
    vim.diagnostic.open_float(nil, { focus = false, border = { '┏', '━', '┓', '┃', '┛', '━', '┖', '┃' },
        header = '  Problems found:  ',
        format = format,
        prefix = prefix })
end

function M.init()
    -- code
    vim.api.nvim_create_augroup('line_diagnostics', { clear = true })
    vim.api.nvim_clear_autocmds({ buffer = vim.api.nvim_get_current_buf(), group = "line_diagnostics" })
    vim.api.nvim_create_autocmd('CursorHold', {
        callback = callback,
        buffer = vim.api.nvim_get_current_buf(),
        group = "line_diagnostics"
    })
end

return M
