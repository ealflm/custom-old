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

-- Auto clear buffer
autocmd({"BufEnter"}, {
  pattern = {"*.*"},
  callback = function()
    require('nvimbuffers').close_noname_buffer()
    require('nvimbuffers').close_workspace_md()
  end
})

-- Mapping <C-p> <C-n> only for *.md filetype
autocmd({"BufEnter"}, {
  pattern = {".workspace.md"},
  callback = function()
    vim.keymap.set('n', '<C-p>', function()
      vim.cmd "silent! ?^-"
      vim.cmd "nohl"
      vim.cmd "norm 0W"
    end, {buffer = true})
    vim.keymap.set('n', '<C-n>', function()
      vim.cmd "silent! /^-"
      vim.cmd "nohl"
      vim.cmd "norm 0W"
    end, {buffer = true})
    vim.keymap.set('n', '<CR>', function()
      local dir = vim.fn.expand('<cWORD>')
      if vim.fn.isdirectory(dir) ~= 0 then
        vim.cmd("cd " .. dir)
        print(dir)
      end
    end, {buffer = true})
  end
})
