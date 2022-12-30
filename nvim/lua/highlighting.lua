local M = {}

M.highlight = true

function M.toggle()
    M.highlight = not M.highlight
    if M.highlight then
        print("Enabled document highlight", "Document Highlight")
    else
        print("Disabled document highlight", "Document Highlight")
    end
end

local function colorize_highlight()
    print('colorize')
    vim.api.nvim_exec(
        [[
              hi! LspReferenceRead ctermfg=237 guibg=#5e81ac
              hi! LspReferenceText ctermfg=237 guibg=#5e81ac
              hi! LspReferenceWrite ctermfg=237 guibg=#5e81ac
    ]]   , false
    )

end

function M.highlight(client)
    for key, value in pairs(client) do
        print(key, value)
    end
    if M.highlight then
        local buffer_number = vim.api.nvim_get_current_buf()
        if client.documentHighlightProvider then
            local present, illuminate = pcall(require, "illuminate")
            if present then
                illuminate.on_attach(client)
            else
                vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
                vim.api.nvim_clear_autocmds { buffer = buffer_number, group = "lsp_document_highlight" }
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = vim.lsp.buf.document_highlight,
                    buffer = buffer_number,
                    group = "lsp_document_highlight",
                    desc = "Document Highlight",
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    callback = vim.lsp.buf.clear_references,
                    buffer = buffer_number,
                    group = "lsp_document_highlight",
                    desc = "Clear All the References",
                })
                colorize_highlight()
            end
        end
    end
end

function M.setup(client)
    M.highlight(client)
end

return M
