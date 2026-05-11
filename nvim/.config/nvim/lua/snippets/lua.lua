local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("func", {
    t("local "), i(1, "NAME"), t(" = function("), i(2, "PARAM"), t(")");
    t({"", "  ", "end",})
  }),
}
