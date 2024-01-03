local lsp = vim.lsp

local M = {}

M.setup = function()
    lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = true,
        })
    vim.diagnostic.config({
        float = {
            source = 'always',
            border = "single"
        },
    })
end

return M
