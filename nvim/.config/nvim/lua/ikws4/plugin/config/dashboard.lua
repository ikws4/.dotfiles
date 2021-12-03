local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 0
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
  [[                                                 ]],
  [[                                                 ]],
  [[                                                 ]],
  [[                                                 ]],
  [[                                                 ]],
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  [[                                                 ]],
  [[                                                 ]],
  [[                                                 ]],
}

g.dashboard_custom_section = {
  a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files hidden=true" },
  b = { description = { "  Recents                   SPC f r" }, command = "Telescope oldfiles" },
  c = { description = { "  Find Word                 SPC s p" }, command = "Telescope live_grep" },
  d = { description = { "洛 New File                  SPC w n" }, command = "DashboardNewFile" },
  e = { description = { "  Bookmarks                 SPC s m" }, command = "Telescope marks" },
  f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}

g.dashboard_custom_footer = {
  "   ",
}
