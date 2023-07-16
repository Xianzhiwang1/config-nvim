require("mason").setup()
local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set({ 'i', 'n' }, '<space>fs', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<space>de', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist, opts)
end

lspconfig.texlab.setup {
    on_attach = on_attach,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            },
            completion = {
                -- Disable autocompletion with comments. I can spell well enough.
                showWord = "Disable",
                workspaceWord = "Disable",
            },
        },
    },
}

lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
        python = {
            analysis = { typeCheckingMode = "none" },
            diagnosticMode = "openFilesOnly",
            autoSerachPaths = true,
        },
    },
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    settings = { CompileFlags = { std = "c11", compiler = "gcc" } },
})

lspconfig.gopls.setup{
    on_attach = on_attach,
}

lspconfig.bashls.setup{
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {}
    }
})
