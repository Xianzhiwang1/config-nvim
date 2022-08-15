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
    },
    to_stdin = true,
  },
  factory = helpers.formatter_factory,
})
null_ls.setup({sources = {lua_format}})
