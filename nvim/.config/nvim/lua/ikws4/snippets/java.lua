return {
  parse("print", "System.out.print(${1});"),
  parse("println", "System.out.println(${1});"),
  parse("while", "wihle (${1}) {\n\t${2}\n}"),
  parse(
    "while",
    [[
      while (${1}) {
        ${2}
      }
    ]]
  ),
  parse(
    "if",
    [[
      if (${1}) {
        ${2}
      }
    ]]
  ),
  sh(
    "foreach(%a+)",
    fmt(
      [[
        for (var {} : {}s) {{
          {}
        }}
      ]],
      {
        cap(1),
        cap(1),
        i(0),
      }
    )
  ),
  sh(
    "for(%l)(%d*)",
    fmt(
      [[
        for (int {} = {}; {} < {}; {}++) {{
          {}
        }}
      ]],
      {
        cap(1),
        cap(2, "0"),
        cap(1),
        i(1, "n"),
        cap(1),
        i(0),
      }
    )
  ),
  sh(
    "rfor(%l)",
    fmt(
      [[
        for (int {} = {}; {} >= 0; {}--) {{
          {}
        }}
      ]],
      {
        cap(1),
        i(1, "n - 1"),
        cap(1),
        cap(1),
        i(0),
      }
    )
  ),
}
