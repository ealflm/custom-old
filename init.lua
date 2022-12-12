require "custom.options"

local autocmd = vim.api.nvim_create_autocmd

autocmd({"VimEnter"}, {
  callback = function()
    -- vim.keymap.del('n', '<Esc>')
  end, 
})