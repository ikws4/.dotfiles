; Annotations
(annotation
  name: (identifier) @annotation
) @annotation
(marker_annotation
  name: (identifier) @annotation
) @annotation

; Unary expression
("-"
  operand: [
    (hex_integer_literal)
    (decimal_integer_literal)
    (octal_integer_literal)
    (decimal_floating_point_literal)
    (hex_floating_point_literal)
  ]
) @number

("!"
  operand: [
   (true)
   (false)
   (method_invocation)
  ]
) @constant.builtin

; Keywords
[
  "abstract"
  "continue"
  "for"
  "new"
  "switch"
  "assert"
  "default"
  "package"
  "synchronized"
  "do"
  "if"
  "private"
  "break"
  "double"
  "implements"
  "protected"
  "throw"
  "byte"
  "else"
  "import"
  "public"
  "throws"
  "case"
  "enum"
  "instanceof"
  "return"
  "transient"
  "catch"
  "extends"
  "int"
  "short"
  "try"
  "char"
  "final"
  "interface"
  "static"
  "class"
  "finally"
  "long"
  "strictfp"
  "volatile"
  "float"
  "native"
  "while"
  (this)
] @keyword
