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

local math_types = {
  mbb = "mathbb",
  mbf = "mathbf",
  bsy = "boldsymbol",
  cal = "mathcal",
  tbf = "textbf",
  bar = "overline",
}

local default_opts = {
  condition = utils.in_mathzone,
  show_condition = function() return false end,
}

local autosnippets = {
  s({trig = "half"}, {t("\\frac12")}, default_opts),
  s({trig = "infsum"}, {t("\\sum\\limits_{"), i(1), t("=1}^{\\infty}"), i(2)},
    default_opts),
  s({trig = "abs"}, {t("lVert"), i(1), t("\\rVert"), i(0)}, default_opts),
  s({trig = "%.%.%."}, {t("\\ldots")}, default_opts),
  s({trig = "xx"}, {t("\\times")}, default_opts),
  s({trig = "sbst"}, {t("\\subseteq")}, default_opts),
  s({trig = "<<"}, {t("\\langle")}, default_opts),
  s({trig = ">>"}, {t("\\rangle")}, default_opts),
  s({trig = "set"}, {t("\\{"), i(1), t(" \\}"), i(0)}, default_opts),
  postfix({trig = "sq"}, utils.trailing({t("^2")}), default_opts),
  postfix({trig = "cq"}, utils.trailing({t("^3")}), default_opts),
  postfix({trig = "td"}, {t("^{"), i(1), t("}")}, default_opts),
  postfix({trig = "__"}, utils.trailing({t("_{"), i(1), t("}")}), default_opts),
  postfix({trig = "inv"}, utils.trailing({t("^{-1}")}), default_opts),
}

for k, v in pairs(utils.GREEK_LETTERS) do
  local snip = s({trig = "g" .. k}, {t("\\" .. v)}, default_opts)
  table.insert(autosnippets, snip)
end

for k, v in pairs(math_types) do
  local snip = postfix({
    trig = "([%a%d{}]*)" .. k,
    regTrig = true,
    hidden = true,
  }, {
    f(function(_, parent)
      vim.notify(parent.captures[1])
      return v .. "{" .. parent.captures[1] .. "}"
    end),
  }, default_opts)
  table.insert(autosnippets, snip)
end

for a = 2, 8, 1 do
  local nodes = {}
  for b = 1, a - 1, 1 do
    table.insert(nodes, i(b))
    table.insert(nodes, t(" & "))
  end
  table.insert(nodes, i(a))
  table.insert(nodes, t(" \\\\"))
  table.insert(autosnippets, s("tr" .. tostring(a), nodes, default_opts) -- really slow
  -- { condition = function()
  --   if not utils.in_mathzone() then
  --     return false
  --   end
  --   local env = vim.api.nvim_eval("vimtex#env#get_outer()")["name"]
  --   return env and string.find(env, "mat")
  -- end })
  )
end

local snippets = {
  s({trig = "pmat"}, utils.create_env_snip("pmat"), default_opts),
  s({trig = "bmat"}, utils.create_env_snip("bmat"), default_opts),
  s({trig = "cases"}, utils.create_env_snip("cases"), default_opts),
}

ls.add_snippets("tex", autosnippets, {type = "autosnippets"})
ls.add_snippets("tex", snippets, {type = "snippets"})
