local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.formatting({
--         filter = function(client) return client.name == "null-ls" end,
--         bufnr = bufnr,
--     })
-- end


local FORMATTING = methods.internal.FORMATTING

local latexindent = helpers.make_builtin({
    name = "latexindent",
    meta = {
        url = "https://github.com/cmhughes/latexindent.pl",
        description = "A perl script for formatting LaTeX files that is generally included in major TeX distributions.",
    },
    method = FORMATTING,
    filetypes = { "tex" },
    generator_opts = { command = "latexindent", args = { "-m" }, to_stdin = true },
    factory = helpers.formatter_factory,
})
null_ls.setup({ sources = { latexindent, null_ls.builtins.formatting.isort, null_ls.builtins.formatting.black } })
