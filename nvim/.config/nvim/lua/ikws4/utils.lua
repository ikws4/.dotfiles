--- @param key string
--- @param mode string
local function feedkeys(key, mode)
  local k = vim.api.nvim_replace_termcodes(key, true, false, true)
  vim.api.nvim_feedkeys(k, mode, true)
end

--- @param left string
--- @param right string
local function surround(left, right)
  --- @return list [start_row start_col end_row end_col]
  local function get_selection_range()
    local _, row1, col1, _ = unpack(vim.fn.getpos "v")
    local _, row2, col2, _, _ = unpack(vim.fn.getcurpos())

    local start_row = math.min(row1, row2) - 1
    local start_col = math.min(col1, col2) - 1
    local end_row = math.max(row1, row2) - 1
    local end_col = math.max(col1, col2) - 1

    return start_row, start_col, end_row, end_col
  end

  local start_row, start_col, end_row, end_col = get_selection_range()
  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, true)
  local rep_lines = {}

  if vim.api.nvim_get_mode()["mode"] == "V" then
    start_col = 0
    while string.byte(lines[1], start_col + 1) == 32 do
      start_col = start_col + 1
    end
    end_col = #lines[#lines]
  end

  if #lines == 1 then
    local rep_text = lines[1]
    local before = string.sub(rep_text, 1, start_col)
    local after = string.sub(rep_text, end_col + 2, #rep_text)
    rep_lines[1] = before .. left .. string.sub(rep_text, start_col + 1, end_col + 1) .. right .. after
  else
    for index, line in ipairs(lines) do
      local curr_row = index + start_row - 1
      local rep_text = line

      if curr_row == start_row then
        rep_text = string.sub(rep_text, 1, start_col) .. left .. string.sub(rep_text, start_col + 1, #rep_text)
      end

      if curr_row == end_row then
        rep_text = string.sub(rep_text, 1, end_col + 1) .. right .. string.sub(rep_text, end_col + 2, #rep_text)
      end
      rep_lines[index] = rep_text
    end
  end

  vim.api.nvim_buf_set_text(0, start_row, 0, end_row, #lines[#lines], rep_lines)
  feedkeys("<Esc>l", "v")
end

return {
  surround = surround,
}
