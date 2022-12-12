local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
      ["<TAB>"] = "",
      ["<S-Tab>"] = "",
      ["<C-n>"] = "",
      ["[c"] = "",
      ["]c"] = "",
      ["[d"] = "",
      ["d]"] = "",
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

M.lspconfig = {
  n = {
    ["<C-S-p>"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["<C-S-n>"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<C-CR>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gd"] = {
      function()
        vim.cmd "Telescope lsp_definitions"
      end,
      "lsp definition",
    },

    ["gi"] = {
      function()
        vim.cmd "Telescope implementations"
      end,
      "lsp implementation",
    },

    ["<leader>D"] = {
      function()
        vim.cmd "Telescope lsp_type_definitions"
      end,
      "lsp definition type",
    },

    ["gr"] = {
      function()
        vim.cmd "Telescope lsp_references"
      end,
      "lsp references",
    },

  },
}

M.gitsigns = {
  n = {
    -- Navigation through hunks
    ["<A-n>"] = {
      function()
        if vim.wo.diff then
          return "<A-n>"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<A-p>"] = {
      function()
        if vim.wo.diff then
          return "<A-p>"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
  },
}

return M
