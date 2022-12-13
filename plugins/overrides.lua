local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
    "dart"
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<C-e>", action = nil },
        { key = "<M-e>", action = "edit_in_place" },
      },
    },
  },

  update_focused_file = {
    enable = false,
  },
}

M.nvchad_ui = {
  statusline = {
    separator_style = "default", -- default/round/block/arrow
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = false,
    overriden_modules = nil,
  },
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
        border = "double",
      },
    }
  },
}

M.telescope = {
  extensions_list = { "ui-select" },
}

return M
