local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
local s = 1 + 1
local lua_format = helpers.make_builtin({
  name = "lua_format",
  meta = {
    url = "https://github.com/Koihik/LuaFormatter",
    description = "Reformats your Lua source code.",
  },
  method = FORMATTING,
  filetypes = {"lua"},
  generator_opts = {
    command = "lua-format",
    args = {
      "-i",
      "--indent-width=2",
      "--single-quote-to-double-quote",
      "--chop-down-parameter",
      "--chop-down-table",
      "--extra-sep-at-table-end",
      "--chop-down-parameter",
    },
    to_stdin = true,
  },
  factory = helpers.formatter_factory,
})
null_ls.setup({
  sources = {lua_format},
  on_attach = function(client, bufnr)
    -- format on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})
