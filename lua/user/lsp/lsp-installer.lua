require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "pyright", "bashls", "texlab" },
})
local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require "lsp_signature".on_attach({
        hint_enable = false;
        hint_prefix = ""
    }, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    completion = {
                        -- Disable autocompletion with comments. I can spell well enough.
                        showWord = "Disable",
                        workspaceWord = "Disable",
                    },
                },
            },
        }
    end,
    ["pyright"] = function()
        lspconfig.pyright.setup({
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = { typeCheckingMode = "basic" },
                    pythonPath = ".venv/bin/python",
                    venvPath = ".venv",
                },
            },
        })
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            on_attach = on_attach,
            settings = { CompileFlags = { std = "c11", compiler = "gcc" } },
        })
    end,
    ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {}
            }
        })
    end,
})
