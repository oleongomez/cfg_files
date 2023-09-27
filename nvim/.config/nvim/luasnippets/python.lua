local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
return {
    s({
        --snip_params:table,
        {
            trig = "task recipe",
            dscr = "snippet for python recipe",
            regTrig = false,
            priority = 100,
            snippetType = "autosnippet"
        },
        --nodes: table,
        {
            t("Hellou"),
        }
        --opts: table | nil
    }
    )
}
