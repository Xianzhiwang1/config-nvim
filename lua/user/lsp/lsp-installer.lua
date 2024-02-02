local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }


-- https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

local on_attach = function(_, bufnr)
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
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = { globals = { "vim" } },
            workspace = {
                -- library = vim.api.nvim_get_runtime_file("", true)
                -- isnt adding anything other than long lsp load times
            },
            completion = {
                -- Disable autocompletion with comments. I can spell well enough.
                showWord = "Disable",
                workspaceWord = "Disable",
            },
            telemetry = {
                enable = false,
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

lspconfig.gopls.setup {
    on_attach = on_attach,
}

lspconfig.bashls.setup {
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {}
    }
})
