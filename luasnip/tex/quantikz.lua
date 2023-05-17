local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = require("utils.latex")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "bqu", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{quantikz}
        & <>
      \end{quantikz}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "cl", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\ctrl{"), i(1), t("}") }), sn(nil, { t("\\ctrl["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "ocl", snippetType = "autosnippet", priority = 2000 },
    c(1, { sn(nil, { t("\\octrl{"), i(1), t("}") }), sn(nil, { t("\\octrl["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "tar", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\targ{"), i(1), t("}") }), sn(nil, { t("\\targX{"), i(1), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "gate", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\gate{"), i(1), t("}") }), sn(nil, { t("\\gate["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "wire", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\wire{"), i(1), t("}") }), sn(nil, { t("\\wire["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "meter", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\meter{"), i(1), t("}") }), sn(nil, { t("\\meter["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "phase", snippetType = "autosnippet" },
    fmta("\\phase{<>}", {
      i(0),
    }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "swap", snippetType = "autosnippet" },
    fmta("\\swap{<>}", {
      i(0),
    }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "lstick", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\lstick{"), i(1), t("}") }), sn(nil, { t("\\lstick["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "rstick", snippetType = "autosnippet" },
    c(1, { sn(nil, { t("\\rstick{"), i(1), t("}") }), sn(nil, { t("\\rstick["), i(1), t("]{"), i(2), t("}") }) }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "group", snippetType = "autosnippet" },
    fmta("\\gategroup[<>,steps=<>]{<>}", {
      i(1),
      i(2),
      i(0),
    }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "slice", snippetType = "autosnippet" },
    fmta("\\slice{<>}", {
      i(0),
    }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "push", snippetType = "autosnippet" },
    fmta("\\push{<>}", {
      i(0),
    }),
    { condition = tex.in_quantikz }
  ),
  s(
    { trig = "measure", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\measure{"), i(1), t("}") }),
      sn(nil, { t("\\measuretab{"), i(1), t("}") }),
    }),
    { condition = tex.in_quantikz }
  ),
}
