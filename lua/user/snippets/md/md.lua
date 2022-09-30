local ls = require "luasnip"
local utils = require("user.snippets.tex.utils")
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

local default_opts = { show_condition = function() return false end }

local snippets = {
  s({ trig = "bol" }, { t("Bolshevik") }, default_opts),
  s({ trig = "mens" }, { t("Menshivik") }, default_opts),
}

ls.add_snippets("markdown", snippets, { type = "snippets" })
