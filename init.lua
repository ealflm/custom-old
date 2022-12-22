require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePost"},
        {pattern = {"*.dart", "*.lua"}, command = "FormatWrite"})

autocmd({"FocusGained"}, {pattern = {"*.*"}, command = "checktime"})

-- Mapping <C-n>, <C-p> with up and down to get feature of up and down
vim.cmd [[
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
]]

-- Close all buffers except current one
vim.cmd [[
  command! BufCurOnly execute '%bdelete|edit#|bdelete#'
  nnoremap <C-S-W> :BufCurOnly<CR>
]]
