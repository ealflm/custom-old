local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
      ["<TAB>"] = "",
      ["<S-Tab>"] = "",
      ["<C-n>"] = "",
  }
}

M.nvimtree = {
  n = {
    -- toggle
    ["<C-q>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<C-e>"] = { "<cmd> NvimTreeFindFile <CR>", "jump to current file in nvimtree" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<C-space>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-h"] = { "<cmd> Telescope live_grep <CR>", "live grep" },

    -- git
    ["<C-;>"] = { "<cmd> Telescope git_status <CR>", "git status" },
  },
}

return M
