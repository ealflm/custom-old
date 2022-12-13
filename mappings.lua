local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
      ["<TAB>"] = "",
      ["<S-Tab>"] = "",
      ["<C-n>"] = "",
      ["<C-s>"] = "",
      ["[c"] = "",
      ["]c"] = "",
      ["[d"] = "",
      ["d]"] = "",
  }
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<C-s>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<C-a>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<C-d>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-q>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<C-e>"] = { "<cmd> NvimTreeFindFile <CR>", "jump to current file in nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<C-space>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-h"] = { "<cmd> Telescope live_grep <CR>", "live grep" },

    -- git
    ["<C-;>"] = { "<cmd> Telescope git_status <CR>", "git status" },
  },
}

M.lspconfig = {
  plugin = true,

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
  plugin = true,

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

M.dap = {
  plugin = true,

  n = {
    -- Continue
    ["<F5>"] = {
      function()
        vim.schedule(function()
          print "Running the app..."
          require("dap").continue()
        end)
      end,
      "Dap: continue",
      opts = { expr = true },
    },

    -- Step over
    ["<F8>"] = {
      function()
        vim.schedule(function()
          print "Step over..."
          require("dap").step_over()
        end)
      end,
      "Dap: step over",
      opts = { expr = true },
    },

    -- Step in
    ["<F9>"] = {
      function()
        vim.schedule(function()
          print "Step in"
          require("dap").step_into()
        end)
      end,
      "Dap: step in",
      opts = { expr = true },
    },

    -- Step out
    ["<F10>"] = {
      function()
        vim.schedule(function()
          print "Step out"
          require("dap").step_out()
        end)
      end,
      "Dap: step out",
      opts = { expr = true },
    },

    -- Toggle breakpoint
    ["<F7>"] = {
      function()
        vim.schedule(function()
          print "Breakpoint toggled"
          require("dap").toggle_breakpoint()
        end)
      end,
      "Dap: toggle breakpoint",
      opts = { expr = true },
    },

    -- Set breakpoint with condition
    ["<S-F7>"] = {
      function()
        vim.schedule(function()
          print "Breakpoint set with condition"
          require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end)
      end,
      "Dap: set breakpoint",
      opts = { expr = true },
    },

    -- Terminate app
    ["<Leader>te"] = {
      function()
        vim.schedule(function()
          print "App terminated"
          require("dap").terminate()
        end)
      end,
      "Dap: terminate",
      opts = { expr = true },
    },

    -- Set exception breakpoint
    ["<Leader>ex"] = {
      function()
        vim.schedule(function()
          print "Set exception breakpoints"
          require("dap").set_exception_breakpoints()
        end)
      end,
      "Dap: set exception breakpoints",
      opts = { expr = true },
    },

    -- REPL open
    ["<Leader>dr"] = {
      function()
        print "Opening REPL"
        vim.schedule(function()
          require("dap").repl.open()
        end)
      end,
      "Dap: REPL open",
      opts = { expr = true },
    },

    -- Watch value at popup
    ["gs"] = {
      function()
        vim.schedule(function()
          require("dap").eval()
        end)
      end,
      "Dap: watch value at popup",
      opts = { expr = true },
    },

  },

  v = {
    ["gs"] = {
      function()
        vim.schedule(function()
          require("dap").eval()
        end)
      end,
      "Dap: watch value at popup",
      opts = { expr = true },
    },
  }
}

M.dapui = {
  plugin = true,

  n = {
    -- Open REPL
    ["<C-m>"] = {
      function()
        vim.schedule(function()
          require'dapui'.toggle({layout = 2})
        end)
      end,
      "Dap UI: open REPL at bottom",
    },

    -- Open REPL
    ["<C-'>"] = {
      function()
        vim.schedule(function()
          require'dapui'.toggle({layout = 1})
        end)
      end,
      "Dap UI: open debug inspect",
    },

    -- Open all dap ui with reset
    ["<C-\">"] = {
      function()
        vim.schedule(function()
          require'dapui'.open({reset = true})
        end)
      end,
      "Dap UI: Open dap ui with reset",
    },

  },
}

return M
