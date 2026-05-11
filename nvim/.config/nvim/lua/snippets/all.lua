local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("beg", {
    t("\\begin{"),
    i(1),
    t("}"),
    t({ "", "\t" }),
    i(0),
    t({ "", "\\end{" }),
    rep(1),
    t("}"),
  }),

  s("clg", {
    t("console.log("),
    i(1),
    t(");"),
  }),

  s("ce", {
    t("console.error("),
    i(1),
    t(");"),
  }),

  s("ie", {
    t("if("),
    i(1),
    t(") {"),
    t({"", "  ", "} else if("}),
    i(2),
    t(") {"),
    t({"", "  ", "};"})
  }),

  s("rfc", {
    t("export default function "),
    i(1, "Component"),
    t({"() {", "  return ("}),
    t({'', '', '  )', '}'})
  }),
}
