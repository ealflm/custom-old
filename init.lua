require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePost"},
        {pattern = {"*.dart", "*.lua"}, command = "FormatWrite"})

autocmd({"FocusGained"}, {pattern = {"*.*"}, command = "checktime"})

autocmd({"BufEnter"}, {
  pattern = {"*.*"},
  callback = function() require('nvimbuffers').close_noname_buffer() end
})

-- Mapping <C-n>, <C-p> with up and down to get feature of up and down
vim.cmd [[
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
]]
