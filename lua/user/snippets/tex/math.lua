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

local POSTFIX_MATCH = [[[%w})]+$]]

local math_types = {
    mbb = "mathbb",
    mbf = "mathbf",
    bsy = "bsy",
    cal = "mathcal",
    bar = "bar",
    ovl = "overline",
    und = "underline",
    hat = "hat",
    txt = "text",
    tld = "tilde",
}

local auto_default_opts = {
    condition = utils.in_mathzone,
    show_condition = function() return true end,
}

local autosnippets = {
    -- general snippets
    s({ trig = "//" }, { t("\\frac{ "), i(1), t(" }{ "), i(2), t(" }"), i(0) },
        auto_default_opts),
    s({ trig = "sq" }, { t("\\sqrt["), i(1), t("]{"), i(2), t("}"), i(0) },
        auto_default_opts),
    s({ trig = "ra" }, { t("\\xrightarrow["), i(1), t("]{"), i(2), t("}"), i(0) },
        auto_default_opts),
    s({ trig = "half" }, { t("\\frac12") }, auto_default_opts),
    s({ trig = "s2" }, { t("\\sigma^2") }, auto_default_opts),
    s({ trig = "s02" }, { t("\\sigma_0^2") }, auto_default_opts),
    s({ trig = "del" }, { t("\\partial") }, auto_default_opts),
    s({ trig = "ndiv" }, { t("\\hspace{-4pt}\\not| \\hspace{2pt}") }, auto_default_opts),
    s({ trig = "chs" }, { t("{ "), i(1), t(" \\choose "), i(2), t(" }") },
        auto_default_opts),
<<<<<<< HEAD
    s({ trig = "abs" }, { t("\\lvert"), i(1), t("\\rvert"), i(0) },
        auto_default_opts),
    s({ trig = "bigp" }, { t("\\left("), i(1), t("\\right)"), i(0) },
        auto_default_opts),
    s({ trig = "bigb" }, { t("\\left["), i(1), t("\\right]"), i(0) },
        auto_default_opts),
    s({ trig = "bigc" }, { t("\\left\\{"), i(1), t("\\right\\}"), i(0) },
        auto_default_opts),
    s({ trig = "biga" }, { t("\\left\\langle"), i(1), t("\\right\\rangle"), i(0) },
        auto_default_opts),
    s({ trig = "trn" }, { t("p_{"), i(1), t("}"), t("^{("), i(2), t(")}") },
=======
    s({ trig = "abs" }, { t("\\lvert "), i(1), t(" \\rvert"), i(0) },
>>>>>>> 6e99f0c13c6edff76042c2f422290afeba90fe5a
        auto_default_opts),
    s({ trig = "..." }, { t("\\ldots") }, auto_default_opts),
    s({ trig = "**" }, { t("\\cdot") }, auto_default_opts),
    s({ trig = "uu" }, { t("\\cup") }, auto_default_opts),
    s({ trig = "nn" }, { t("\\cap") }, auto_default_opts),
    s({ trig = "oo" }, { t("\\circ") }, auto_default_opts),
    s({ trig = "xx" }, { t("\\times") }, auto_default_opts),
    s({ trig = "RN" }, { t("\\mathbb{R}^N") }, auto_default_opts),
    s({ trig = "RR" }, { t("\\mathbb{R}") }, auto_default_opts),
<<<<<<< HEAD
    s({ trig = "CC" }, { t("\\mathbb{C}") }, auto_default_opts),
    s({ trig = "NN" }, { t("\\mathbb{N}") }, auto_default_opts),
    s({ trig = "QQ" }, { t("\\mathbb{Q}") }, auto_default_opts),
    s({ trig = "ZZ" }, { t("\\mathbb{Z}") }, auto_default_opts),
    s({ trig = "FF" }, { t("\\mathbb{F}") }, auto_default_opts),
    s({ trig = "PP" }, { t("\\mathbb{P}") }, auto_default_opts),
=======
    s({ trig = "xi2" }, { t("\\lvert x_i \\rvert^2") }, auto_default_opts),
    s({ trig = "xj2" }, { t("\\lvert x_j \\rvert^2") }, auto_default_opts),
    s({ trig = "pi2" }, { t("\\lvert \\pi_i \\rvert^2") }, auto_default_opts),
    s({ trig = "pj2" }, { t("\\lvert \\pi_j \\rvert^2") }, auto_default_opts),
>>>>>>> 6e99f0c13c6edff76042c2f422290afeba90fe5a
    s({ trig = "sbst" }, { t("\\subseteq") }, auto_default_opts),
    s({ trig = "spst" }, { t("\\supseteq") }, auto_default_opts),
    s({ trig = "<<" }, { t("\\langle") }, auto_default_opts),
    s({ trig = ">>" }, { t("\\rangle") }, auto_default_opts),
    s({ trig = "emp" }, { t("\\varnothing") }, auto_default_opts),
    postfix({ trig = "cq", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("^3") }), auto_default_opts),
    postfix({ trig = "tp", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("^T") }), auto_default_opts),
    postfix({ trig = "td", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("^{"), i(1), t("}"), i(0) }),
        auto_default_opts),
    postfix({ trig = "tn", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("^{("), i(1), t(")}"), i(0) }),
        auto_default_opts),
    postfix({ trig = "__", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("_{"), i(1), t("}"), i(0) }),
        auto_default_opts),
    postfix({ trig = "inv", match_pattern = POSTFIX_MATCH }, utils.trailing({ t("^{-1}") }), auto_default_opts),
    postfix({ trig = "(%d)", regTrig = true, match_pattern = "[%a}]$" }, utils.trailing({
        f(
            function(_, parent)
                return "_" .. parent.captures[1]
            end),
    }), auto_default_opts),
    postfix({ trig = "([%a%d^{}\\-]+)nrm", regTrig = true, match_pattern = POSTFIX_MATCH }, {
        t("\\lVert "),
        f(function(_, parent) return parent.captures[1] end),
        t(" \\rVert"),
    }, auto_default_opts),
    s({ trig = "(%d)(%d)(%d)cs", regTrig = true }, {
        f(
            function(_, parent)
                return "\\Gamma^{" .. parent.captures[1] .. "}_{" .. parent.captures[2] .. parent.captures[3] .. "}"
            end),
    }, auto_default_opts),
}

for k, v in pairs(utils.GREEK_LETTERS) do
    local snip = s({ trig = " ;" .. k }, { t(" \\" .. v) }, auto_default_opts)
    table.insert(autosnippets, snip)
    snip = s({ trig = ";" .. k }, { t("\\" .. v) }, auto_default_opts)
    table.insert(autosnippets, snip)
    snip = s({ trig = "$;" .. k }, { t("$\\" .. v) }, auto_default_opts)
    table.insert(autosnippets, snip)
    snip = s({ trig = " ;" .. k:upper() },
        { t(" \\" .. v:sub(1, 1):upper() .. v:sub(2, -1)) },
        auto_default_opts)
    table.insert(autosnippets, snip)
    snip = s({ trig = ";" .. k:upper() },
        { t("\\" .. v:sub(1, 1):upper() .. v:sub(2, -1)) }, auto_default_opts)
    table.insert(autosnippets, snip)
    snip = s({ trig = "$;" .. k:upper() },
        { t("$\\" .. v:sub(1, 1):upper() .. v:sub(2, -1)) },
        auto_default_opts)
    table.insert(autosnippets, snip)
end

for k, v in pairs(math_types) do
    local snip = s({
        trig = "([%a%d{}\\]*)" .. k,
        regTrig = true,
        hidden = true,
    }, {
        f(
            function(_, parent)
                return "\\" .. v .. "{" .. parent.captures[1] .. "}"
            end),
    }, auto_default_opts)
    table.insert(autosnippets, snip)
end

for a = 2, 9, 1 do
    local nodes = {}
    for b = 1, a - 1, 1 do
        table.insert(nodes, i(b))
        table.insert(nodes, t(" & "))
    end
    table.insert(nodes, i(a))
    table.insert(nodes, t(" \\\\"))
    table.insert(autosnippets, s(tostring(a) .. "tr", nodes, {
        show_condition = function() return false end,
        priority = 20000,
    }))
end

local default_opts = {
    condition = utils.in_mathzone,
    show_condition = function() return false end,
}

local snippets = {
    s({ trig = "set" }, { t("\\{ "), i(1), t(" \\}"), i(0) }, auto_default_opts),
    s({ trig = "nrm" }, { t("\\lVert "), i(1), t(" \\rVert"), i(0) },
        auto_default_opts),
    s({ trig = "lint" },
        { t("\\int\\limits_{"), i(1), t("}^{"), i(2), t("}"), i(0) }, default_opts),
    s({ trig = "cond" },
        { t("p( "), i(1, "x"), t(" \\vert "), i(2), t(" )"), i(0) }, default_opts),
    s({ trig = "infsum" },
        { t("\\sum\\limits_{"), i(1), t("=1}^{\\infty}"), i(0) }, default_opts),
    s({ trig = "frac" }, { t("\\frac{ "), i(1), t(" }{ "), i(2), t(" }"), i(0) },
        default_opts),
    s({ trig = "drv" }, { t("\\frac{ d"), i(1), t(" }{ d"), i(2), t(" }"), i(0) },
        default_opts),
    s({ trig = "drvx" }, { t("\\frac{ d"), i(1), t(" }{ dx }"), i(0) },
        default_opts),
    s({ trig = "drvxy" }, { t("\\frac{ dy }{ dx }") }, default_opts),
    s({ trig = "lims" },
        { t("\\limits_{"), i(1, "-\\infty"), t("}^{"), i(2, "\\infty"), t("}") },
        default_opts),
    s({ trig = "pdrv" },
        { t("\\frac{ \\partial"), i(1), t(" }{ \\partial "), i(2), t(" }"), i(0) },
        default_opts),
    s({ trig = "pmat" }, utils.create_env_snip("pmatrix"), default_opts),
    s({ trig = "bmat" }, utils.create_env_snip("bmatrix"), default_opts),
    s({ trig = "cases" }, utils.create_env_snip("cases"), default_opts),

}

ls.add_snippets("tex", autosnippets, { type = "autosnippets" })
ls.add_snippets("tex", snippets, { type = "snippets" })
