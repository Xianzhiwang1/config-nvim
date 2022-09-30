local ls = require("luasnip")
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

local default_opts = { condition = utils.notin_mathzone }

local auto_default_opts = {
  condition = utils.notin_mathzone,
  show_condition = function() return false end,
}
local text_types = { tbf = "textbf", tit = "textit", und = "underline" }

local autosnippets = {
  s("mk", { t("$"), i(1), t("$"), i(0) }, auto_default_opts),
  postfix({ trig = "([%w]+);;", regTrig = true }, {
    t("$"),
    f(function(_, parent) return parent.captures[1] end),
    t("$"),
  }, auto_default_opts),
}

local snippets = {
  s("eq", { t({ "\\[", "\t" }), i(1), t({ "", "\\]" }), i(0) }),
  s("begin", {
    t("\\begin{"),
    i(1),
    t({ "}", "" }),
    t("\t"),
    i(3),
    t({ "", "" }),
    t("\\end{"),
    i(2),
    t({ "}", "" }),
    i(0),
  }, default_opts),
  s("def", {
    t("\\begin{definition}["),
    i(1),
    t({ "]", "" }),
    t("\t"),
    i(2),
    t({ "", "\\end{definition}", "" }),
    i(0),
  }, default_opts),
  s("eg", utils.create_env_snip("eg"), default_opts),
  s("prf", utils.create_env_snip("proof"), default_opts),
  s("enum", utils.create_env_snip("enumerate"), default_opts),
  s("enums", utils.create_env_snip("enumerate*"), default_opts),
  s("aligns", utils.create_env_snip("align*"), default_opts),
  s("align", utils.create_env_snip("align"), default_opts),
  s("thm", utils.create_env_snip("theorem"), default_opts),
  s("it", { t("\\item") }, {
    condition = function()
      local env = vim.api.nvim_eval("vimtex#env#get_inner()")["name"]
      return env == "enumerate" or env == "enumerate*"
    end,
  }),
}

for k, v in pairs(text_types) do
  local snip = postfix({ trig = "([%a%d]*)" .. k, regTrig = true }, {
    f(function(_, parent) return v .. "{" .. parent.captures[1] end),
    i(1),
    t("}"),
    i(0),
  }, default_opts)
  table.insert(snippets, snip)
end

ls.add_snippets("tex", snippets, { type = "snippets" })
ls.add_snippets("tex", autosnippets, { type = "autosnippets" })
