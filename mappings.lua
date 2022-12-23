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
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<Leader>fw"] = ""
  },
  t = {["<A-i>"] = "", ["<A-h>"] = "", ["<A-v>"] = ""}
}

M.workspace = {
  n = {
    ["<C-S-e>"] = {
      function()
        vim.cmd("e ~/.workspace.md")
        require("nvimbuffers").move_to_first()
      end, "open global workspace file"
    },
    ["<C-S-m>"] = {
      function()
        local dir = vim.fn.expand("`git rev-parse --show-toplevel`") ..
                        ".workspace.md"
        vim.cmd("e " .. dir)
        require("nvimbuffers").move_to_first()
      end, "open local workspace file"
    }
  }
}

M.git = {
  n = {
    ["<C-S-C>"] = {
      function()
        local curdir = vim.fn.expand('%:h')
        vim.cmd("cd " .. curdir)
        local toplevel = vim.fn.expand('`git rev-parse --show-toplevel`')
        vim.cmd("cd " .. toplevel)
        print(toplevel)
      end, "cd to git root"
    }
  }
}

M.vimrc = {
  n = {
    ["<C-`>"] = {
      function()
        if require("custom.lib").should_hijack_current_buf() then
          require("nvimbuffers").buf_close()
        end

        vim.cmd "e /Users/ealflm/.config/nvim/lua/custom/init.lua"

        local curdir = vim.fn.expand('%:h')
        vim.cmd("cd " .. curdir)
        local toplevel = vim.fn.expand('`git rev-parse --show-toplevel`')
        vim.cmd("cd " .. toplevel)
        print(toplevel)
      end, "open MYVIMRC"
    },
    ["<Leader>pk"] = {
      function()
        local dir = ".local/share/nvim/site/pack/packer/"
        vim.cmd("cd " .. dir)
        print(dir)
      end, "open MYVIMRC"
    }
  }
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<C-]>"] = {
      function() require("nvimbuffers").buf_next() end, "goto next buffer"
    },

    ["<C-[>"] = {
      function() require("nvimbuffers").buf_prev() end, "goto prev buffer"
    },

    -- close buffer + hide terminal buffer
    ["<C-s>"] = {
      function() require("nvimbuffers").buf_close() end, "close buffer"
    },

    -- close all buffers but current
    ["<C-S-s>"] = {
      function() require("nvimbuffers").only_buffer() end, "close buffer"
    },

    -- close all buffers
    ["<C-S-a>"] = {
      function()
        require("nvimbuffers").only_buffer()
        require("nvimbuffers").buf_close()
      end, "close buffer"
    }

  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-tab>"] = {"<cmd>NvimTreeToggle<CR>", "toggle nvimtree"},

    -- focus
    ["<C-e>"] = {
      "<cmd>NvimTreeFindFile<CR>", "jump to current file in nvimtree"
    }
  }
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<C-space>"] = {"<cmd>Telescope find_files<CR>", "find files"},
    ["<C-S-l>"] = {"<cmd>Telescope live_grep<CR>", "live grep"},

    -- git
    ["<C-;>"] = {"<cmd>Telescope git_status<CR>", "git status"},
    ["<Leader>sh"] = {"<cmd>Telescope git_stash<CR>", "git stash"},
    ["<Leader>rh"] = {"<cmd>Telescope git_branches<CR>", "git branches"},
    ["<C-S-j>"] = {
      "<cmd>Telescope repo list<CR>", "open all repository in system"
    },
    ["<Leader>dn"] = {"<cmd>Telescope diagnostics<CR>", "open diagnostics"},
    ["<Leader>rs"] = {
      "<cmd>Telescope resume<CR>", "Resume last telescope command"
    }
  }
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<C-S-p>"] = {function() vim.diagnostic.goto_prev() end, "goto prev"},

    ["<C-S-n>"] = {function() vim.diagnostic.goto_next() end, "goto_next"},

    ["<C-CR>"] = {function() vim.lsp.buf.code_action() end, "lsp code_action"},

    ["gd"] = {
      function() vim.cmd "Telescope lsp_definitions" end, "lsp definition"
    },

    ["gi"] = {
      function() vim.cmd "Telescope lsp_implementations" end,
      "lsp implementation"
    },

    ["<leader>D"] = {
      function() vim.cmd "Telescope lsp_type_definitions" end,
      "lsp definition type"
    },

    ["gr"] = {
      function() vim.cmd "Telescope lsp_references" end, "lsp references"
    }

  }
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["<A-n>"] = {
      function()
        if vim.wo.diff then return "<A-n>" end
        vim.schedule(function() require("gitsigns").next_hunk() end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = {expr = true}
    },

    ["<A-p>"] = {
      function()
        if vim.wo.diff then return "<A-p>" end
        vim.schedule(function() require("gitsigns").prev_hunk() end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = {expr = true}
    }
  }
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
      opts = {expr = true}
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
      opts = {expr = true}
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
      opts = {expr = true}
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
      opts = {expr = true}
    },

    -- Hot restart
    ["<F6>"] = {
      function()
        vim.schedule(function()
          print "Hot restart"
          require("dap").hot_restart()
        end)
      end,
      "Dap: hot restart",
      opts = {expr = true}
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
      opts = {expr = true}
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
      opts = {expr = true}
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
      opts = {expr = true}
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
      opts = {expr = true}
    },

    -- REPL open
    ["<Leader>dr"] = {
      function()
        print "Opening REPL"
        vim.schedule(function() require("dap").repl.open() end)
      end,
      "Dap: REPL open",
      opts = {expr = true}
    }

  }

}

M.dapui = {
  plugin = true,

  n = {
    -- Open REPL
    ["<C-'>"] = {
      function()
        vim.schedule(function() require'dapui'.toggle({layout = 2}) end)
      end, "Dap UI: open REPL at bottom"
    },

    -- Open REPL
    ["<C-\">"] = {
      function()
        vim.schedule(function() require'dapui'.toggle({layout = 1}) end)
      end, "Dap UI: open debug inspect"
    },

    -- Open all dap ui with reset
    ["<M-m>"] = {
      function()
        vim.schedule(function() require'dapui'.open({reset = true}) end)
      end, "Dap UI: Open dap ui with reset"
    },

    -- Watch value at popup
    ["gs"] = {
      function() vim.schedule(function() require("dapui").eval() end) end,
      "Dap: watch value at popup"
    }

  },

  v = {
    ["gs"] = {
      function() vim.schedule(function() require("dapui").eval() end) end,
      "Dap: watch value at popup"
    }

  }
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-S-i>"] = {
      function() require("nvterm.terminal").toggle "float" end,
      "toggle floating term"
    },

    ["<C-S-h>"] = {
      function() require("nvterm.terminal").toggle "horizontal" end,
      "toggle horizontal term"
    },

    ["<C-S-v>"] = {
      function() require("nvterm.terminal").toggle "vertical" end,
      "toggle vertical term"
    }
  },

  n = {
    -- toggle in normal mode
    ["<C-S-i>"] = {
      function() require("nvterm.terminal").toggle "float" end,
      "toggle floating term"
    },

    ["<C-S-h>"] = {
      function() require("nvterm.terminal").toggle "horizontal" end,
      "toggle horizontal term"
    },

    ["<C-S-v>"] = {
      function() require("nvterm.terminal").toggle "vertical" end,
      "toggle vertical term"
    }
  }
}

return M
