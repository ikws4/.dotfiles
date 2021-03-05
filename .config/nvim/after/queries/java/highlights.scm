; Annotations
(annotation
  name: (identifier) @annotation) @annotation
(marker_annotation
  name: (identifier) @annotation) @annotation


; Literals
[
  (hex_integer_literal)
  (decimal_integer_literal)
  (octal_integer_literal)
  (binary_integer_literal)
  (unary_expression
    operator: "-"
    operand: [
      (hex_integer_literal)
      (decimal_integer_literal)
      (octal_integer_literal)
    ])
] @number

[
  (decimal_floating_point_literal)
  (hex_floating_point_literal)
  (unary_expression
    operator: "-"
    operand: [
      (decimal_floating_point_literal)
      (hex_floating_point_literal)
    ])
] @float

[
  (true)
  (false)
  (unary_expression
    operator: "!"
    operand: [
      (true)
      (false)
    ])
] @boolean


; Emphasis
(method_declaration
  name: (identifier) @text.emphasis)
