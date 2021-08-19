local kommentary = require "kommentary.config"

kommentary.configure_language("default", {
  prefer_single_line_comments = true,
})

kommentary.configure_language("dart", {
  single_line_comment_string = "//",
  prefer_single_line_comments = true,
})
