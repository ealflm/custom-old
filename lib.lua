local M = {}

-- Check if current buf is no name buf
function M.should_hijack_current_buf()
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local bufmodified = vim.api.nvim_buf_get_option(bufnr, "modified")
  local ft = vim.api.nvim_buf_get_option(bufnr, "ft")

  local should_hijack_unnamed = bufname == "" and not bufmodified and ft == ""

  return should_hijack_unnamed
end

return M
