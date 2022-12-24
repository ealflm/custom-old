local M = {}

M.treesitter = {
  ensure_installed = {"vim", "lua", "html", "css", "typescript", "c", "dart"}
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server", "stylua", -- web dev stuff
    "css-lsp", "html-lsp", "typescript-language-server", "deno"
  }
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    exclude = {vim.fn.stdpath "config" .. "/lua/custom"},
    custom = {".DS_Store", ".localized", ".workspace.md"}
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.ERROR,
      max = vim.diagnostic.severity.ERROR
    },
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  git = {enable = true},
  renderer = {
    highlight_git = true,
    icons = {
      show = {git = true},
      glyphs = {
        git = {
          unstaged = "◇",
          staged = "◆",
          unmerged = "",
          renamed = "﹡",
          untracked = "⟡",
          deleted = "⊝",
          ignored = ""
        }
      }
    }
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {enable = true, global = true}
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        {key = "<C-e>", action = nil}, {key = "-", action = nil},
        {key = "<M-e>", action = "edit_in_place"},
        {key = "<C-[>", action = "dir_up"}
      }
    }
  },
  update_focused_file = {enable = false}
}

M.nvchad_ui = {
  statusline = {
    separator_style = "default", -- default/round/block/arrow
    overriden_modules = nil
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {enabled = true, lazyload = false, overriden_modules = nil}
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.07,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "double"
      }
    }
  }
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = function()
          vim.cmd [[:stopinsert]]
          vim.cmd [[call feedkeys("\<CR>")]]
        end
      }
    }
  },
  extensions = {
    repo = {
      list = {
        fd_opts = {"--no-ignore-vcs"},
        search_dirs = {"~/Desktop", "~/Downloads", "~/Documents"}
      }
    }
  },
  extensions_list = {"themes", "terms", "ui-select", "telescope-repo"}
}

M.blankline = {show_current_context_start = false}

return M
