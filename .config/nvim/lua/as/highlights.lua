local api = vim.api
local fmt = string.format
local P = as.style.palette

local M = {}

---Convert a hex color to rgb
---@param color string
---@return number
---@return number
---@return number
local function hex_to_rgb(color)
  local hex = color:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5), 16)
end

local function alter(attr, percent)
  return math.floor(attr * (100 + percent) / 100)
end

---@source https://stackoverflow.com/q/5560248
---@see: https://stackoverflow.com/a/37797380
---Darken a specified hex color
---@param color string
---@param percent number
---@return string
function M.darken_color(color, percent)
  local r, g, b = hex_to_rgb(color)
  if not r or not g or not b then
    return "NONE"
  end
  r, g, b = alter(r, percent), alter(g, percent), alter(b, percent)
  r, g, b = math.min(r, 255), math.min(g, 255), math.min(b, 255)
  return string.format("#%02x%02x%02x", r, g, b)
end

--- Check if the current window has a winhighlight
--- which includes the specific target highlight
--- @param win_id integer
--- @vararg string
function M.has_win_highlight(win_id, ...)
  local win_hl = vim.wo[win_id].winhighlight
  local has_match = false
  for _, target in ipairs { ... } do
    if win_hl:match(target) ~= nil then
      has_match = true
      break
    end
  end
  return (win_hl ~= nil and has_match), win_hl
end

---A mechanism to allow inheritance of the winhighlight of a specific
---group in a window
---@param win_id number
---@param target string
---@param name string
---@param default string
function M.adopt_winhighlight(win_id, target, name, default)
  name = name .. win_id
  local _, win_hl = M.has_win_highlight(win_id, target)
  local hl_exists = vim.fn.hlexists(name) > 0
  if not hl_exists then
    local parts = vim.split(win_hl, ",")
    local found = as.find(parts, function(part)
      return part:match(target)
    end)
    if found then
      local hl_group = vim.split(found, ":")[2]
      local bg = M.get_hl(hl_group, "bg")
      local fg = M.get_hl(default, "fg")
      local gui = M.get_hl(default, "gui")
      M.set_hl(name, { guibg = bg, guifg = fg, gui = gui })
    end
  end
  return name
end

--- NOTE: vim.highlight's link and create are private, so
--- eventually move to using `nvim_set_hl`
---@param name string
---@param opts table
function M.set_hl(name, opts)
  assert(name and opts, "Both 'name' and 'opts' must be specified")
  if not vim.tbl_isempty(opts) then
    if opts.link then
      vim.highlight.link(name, opts.link, opts.force)
    else
      local ok, msg = pcall(vim.highlight.create, name, opts)
      if not ok then
        vim.notify(fmt("Failed to set %s because: %s", name, msg))
      end
    end
  end
end

---convert a table of gui values into a string
---@param hl table<string, string>
---@return string
local function flatten_gui(hl)
  local gui_attr = { "underline", "bold", "undercurl", "italic" }
  local gui = {}
  for name, value in pairs(hl) do
    if value and vim.tbl_contains(gui_attr, name) then
      table.insert(gui, name)
    end
  end
  return table.concat(gui, ",")
end

---Get the value a highlight group
---this function is a small wrapper around `nvim_get_hl_by_name`
---which handles errors, fallbacks as well as returning a gui value
---in the right format
---@param grp string
---@param attr string
---@param fallback string
---@return string
function M.get_hl(grp, attr, fallback)
  assert(grp, "Cannot get a highlight without specifying a group")
  local attrs = { fg = "foreground", bg = "background" }
  attr = attrs[attr] or attr
  local hl = api.nvim_get_hl_by_name(grp, true)
  if attr == "gui" then
    return flatten_gui(hl)
  end
  local color = hl[attr] or fallback
  -- convert the decimal rgba value from the hl by name to a 6 character hex + padding if needed
  if not color then
    vim.notify(fmt("%s %s does not exist", grp, attr))
    return "NONE"
  end
  -- convert the decimal rgba value from the hl by name to a 6 character hex + padding if needed
  return "#" .. bit.tohex(color, 6)
end

function M.clear_hl(name)
  if not name then
    return
  end
  vim.cmd(fmt("highlight clear %s", name))
end

---Apply a list of highlights
---@param hls table[]
function M.all(hls)
  for _, hl in ipairs(hls) do
    M.set_hl(unpack(hl))
  end
end
-----------------------------------------------------------------------------//
-- Color Scheme {{{1
-----------------------------------------------------------------------------//
vim.g.doom_one_telescope_highlights = false
vim.cmd "colorscheme nord"

---------------------------------------------------------------------------------
-- Plugin highlights
---------------------------------------------------------------------------------
local function plugin_highlights()
  M.set_hl("TelescopePathSeparator", { guifg = as.style.palette.dark_blue })
  M.set_hl("TelescopeQueryFilter", { link = "IncSearch" })

  M.set_hl("CompeDocumentation", { link = "Pmenu" })

  M.set_hl("BqfPreviewBorder", { guifg = "Gray" })
  M.set_hl("ExchangeRegion", { link = "Search" })

  if as.plugin_installed "conflict-marker.vim" then
    M.all {
      { "ConflictMarkerBegin", { guibg = "#2f7366" } },
      { "ConflictMarkerOurs", { guibg = "#2e5049" } },
      { "ConflictMarkerTheirs", { guibg = "#344f69" } },
      { "ConflictMarkerEnd", { guibg = "#2f628e" } },
      { "ConflictMarkerCommonAncestorsHunk", { guibg = "#754a81" } },
    }
  else
    -- Highlight VCS conflict markers
    vim.cmd [[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]
  end
end

local function general_overrides()
  local comment_fg = M.get_hl("Comment", "fg")
  local msg_area_bg = M.darken_color(M.get_hl("Normal", "bg"), -10)
  M.all {
    { "mkdLineBreak", { link = "NONE", force = true } },
    -----------------------------------------------------------------------------//
    -- Commandline
    -----------------------------------------------------------------------------//
    { "MsgArea", { guibg = msg_area_bg } },
    { "MsgSeparator", { guifg = comment_fg, guibg = msg_area_bg } },
    -----------------------------------------------------------------------------//
    -- Floats
    -----------------------------------------------------------------------------//
    { "NormalFloat", { link = "Normal" } },
    --- Highlight group for light coloured floats
    { "GreyFloat", { guibg = P.grey } },
    { "GreyFloatBorder", { guifg = P.grey } },
    -----------------------------------------------------------------------------//
    { "CursorLineNr", { gui = "bold" } },
    { "FoldColumn", { guibg = "background" } },
    { "Folded", { guifg = comment_fg, guibg = "NONE", gui = "italic" } },
    { "TermCursor", { ctermfg = "green", guifg = "royalblue" } },
    { "IncSearch", { guibg = "NONE", guifg = "LightGreen", gui = "italic,bold,underline" } },
    -- Add undercurl to existing spellbad highlight
    {
      "SpellBad",
      { gui = "undercurl", guibg = "transparent", guifg = "transparent", guisp = "green" },
    },
    -----------------------------------------------------------------------------//
    -- Diff
    -----------------------------------------------------------------------------//
    { "DiffAdd", { guibg = "#26332c", guifg = "NONE" } },
    { "DiffDelete", { guibg = "#572E33", guifg = "#5c6370", gui = "NONE" } },
    { "DiffChange", { guibg = "#273842", guifg = "NONE" } },
    { "DiffText", { guibg = "#314753", guifg = "NONE" } },
    { "diffAdded", { link = "DiffAdd", force = true } },
    { "diffChanged", { link = "DiffChange", force = true } },
    { "diffRemoved", { link = "DiffDelete", force = true } },
    { "diffBDiffer", { link = "WarningMsg", force = true } },
    { "diffCommon", { link = "WarningMsg", force = true } },
    { "diffDiffer", { link = "WarningMsg", force = true } },
    { "diffFile", { link = "Directory", force = true } },
    { "diffIdentical", { link = "WarningMsg", force = true } },
    { "diffIndexLine", { link = "Number", force = true } },
    { "diffIsA", { link = "WarningMsg", force = true } },
    { "diffNoEOL", { link = "WarningMsg", force = true } },
    { "diffOnly", { link = "WarningMsg", force = true } },
    -----------------------------------------------------------------------------//
    -- colorscheme overrides
    -- { "Comment", { gui = "italic" } },
    -- { "Type", { gui = "italic,bold" } },
    -- { "Include", { gui = "italic" } },
    -- { "Folded", { gui = "bold,italic" } },
    -----------------------------------------------------------------------------//
    -- Treesitter
    -----------------------------------------------------------------------------//
    -- { "TSKeyword", { link = "Statement" } },
    -- { "TSParameter", { gui = "italic,bold" } },
    -- highlight FIXME comments
    { "commentTSWarning", { guifg = "Red", gui = "bold" } },
    { "commentTSDanger", { guifg = "#FBBF24", gui = "bold" } },
    -----------------------------------------------------------------------------//
    -- LSP
    -----------------------------------------------------------------------------//
    { "LspReferenceText", { gui = "underline" } },
    { "LspReferenceRead", { gui = "underline" } },
    { "LspDiagnosticsSignHint", { guifg = P.bright_yellow } },
    { "LspDiagnosticsDefaultHint", { guifg = P.bright_yellow } },
    { "LspDiagnosticsDefaultError", { guifg = P.pale_red } },
    { "LspDiagnosticsDefaultWarning", { guifg = P.dark_orange } },
    { "LspDiagnosticsDefaultInformation", { guifg = P.teal } },
    { "LspDiagnosticsUnderlineError", { gui = "undercurl", guisp = P.pale_red, guifg = "none" } },
    {
      "LspDiagnosticsUnderlineHint",
      { gui = "undercurl", guisp = P.bright_yellow, guifg = "none" },
    },
    { "LspDiagnosticsUnderlineWarning", { gui = "undercurl", guisp = "orange", guifg = "none" } },
    { "LspDiagnosticsUnderlineInformation", { gui = "undercurl", guisp = P.teal, guifg = "none" } },
    -----------------------------------------------------------------------------//
    -- Notifications
    -----------------------------------------------------------------------------//
    { "NvimNotificationError", { link = "ErrorMsg" } },
    { "NvimNotificationInfo", { guifg = P.bright_blue } },
  }
end

local function set_sidebar_highlight()
  local normal_bg = M.get_hl("Normal", "bg")
  local split_color = M.get_hl("VertSplit", "fg")
  local bg_color = M.darken_color(normal_bg, -8)
  local st_color = M.darken_color(M.get_hl("Visual", "bg"), -20)
  local hls = {
    { "PanelBackground", { guibg = bg_color } },
    { "PanelHeading", { guibg = bg_color, gui = "bold" } },
    { "PanelVertSplit", { guifg = split_color, guibg = bg_color } },
    { "PanelStNC", { guibg = st_color, cterm = "italic" } },
    { "PanelSt", { guibg = st_color } },
  }
  for _, grp in ipairs(hls) do
    M.set_hl(unpack(grp))
  end
end

local sidebar_fts = { "NvimTree", "dap-repl" }

local function on_sidebar_enter()
  local highlights = table.concat({
    "Normal:PanelBackground",
    "EndOfBuffer:PanelBackground",
    "StatusLine:PanelSt",
    "StatusLineNC:PanelStNC",
    "SignColumn:PanelBackground",
    "VertSplit:PanelVertSplit",
  }, ",")
  vim.cmd("setlocal winhighlight=" .. highlights)
end

local function user_highlights()
  plugin_highlights()
  general_overrides()
  set_sidebar_highlight()
end

---NOTE: apply user highlights when nvim first starts
--- then whenever the colorscheme changes
user_highlights()

as.augroup("UserHighlights", {
  {
    events = { "ColorScheme" },
    targets = { "*" },
    command = user_highlights,
  },
  {
    events = { "FileType" },
    targets = sidebar_fts,
    command = on_sidebar_enter,
  },
})

return M

