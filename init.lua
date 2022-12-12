require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre * dart"}, {
  callback = function()
    vim.lsp.buf.format { async = true }
  end, 
})
