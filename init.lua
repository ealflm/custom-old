require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
  pattern = {"*.dart", "*.lua"},
  callback = function() vim.lsp.buf.format {async = true} end
})

autocmd({"FocusGained"}, {pattern = {"*.*"}, command = "checktime"})

-- Mapping <C-n>, <C-p> with up and down to get feature of up and down
vim.cmd [[
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
]]
