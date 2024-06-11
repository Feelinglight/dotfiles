local M = {}


local function trim_spaces(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end


function M.get_selected_text()
  if vim.fn.mode() ~= 'v' and vim.fn.mode() ~= "V" then
    return ''
  end

  local vpos = vim.fn.getpos("v")
  local begin_pos = { row = vpos[2], col = vpos[3] }

  local dot_pos = vim.fn.getpos(".")
  local end_pos = { row = dot_pos[2], col = dot_pos[3] }

  if begin_pos.row ~= end_pos.row then
    return ''
  end

  if begin_pos.col > end_pos.col then
    begin_pos.col, end_pos.col = end_pos.col, begin_pos.col
  end

  local selected_text = vim.fn.getline(begin_pos.row)
  if vim.fn.mode() == 'v' then
    selected_text = string.sub(selected_text, begin_pos.col, end_pos.col)
  end
  selected_text = trim_spaces(selected_text)

  return selected_text
end


return M

