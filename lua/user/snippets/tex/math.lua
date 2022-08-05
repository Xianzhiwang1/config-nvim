local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix
-- local vimtex = require("vimtex")

local in_mathzone = function()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local notin_mathzone = function()
  return not in_mathzone()
end

ls.add_snippets("tex", {
  s("trigger", {t("WOW")}, {
    condition = in_mathzone
  })
})
