local overrides = require "custom.plugins.overrides"

return {

  -- Override plugin definition options

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
  },

  ["williamboman/mason.nvim"] = {override_options = overrides.mason},

  ["kyazdani42/nvim-tree.lua"] = {
    cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
    override_options = overrides.nvimtree
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function() require("better_escape").setup() end
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    disable = true,
    after = "nvim-lspconfig",
    config = function() require "custom.plugins.null-ls" end
  },

  ["NvChad/ui"] = {override_options = overrides.nvchad_ui},

  ["NvChad/nvterm"] = {override_options = overrides.nvterm},

  ["nvim-telescope/telescope-ui-select.nvim"] = {cmd = "Telescope"},

  ["ealflm/telescope-repo.nvim"] = {cmd = "Telescope"},

  ["nvim-telescope/telescope.nvim"] = {override_options = overrides.telescope},

  ["ealflm/nvim-dap"] = {
    ft = {"dart"},
    config = function() require "custom.plugins.dap" end,
    setup = function() require("core.utils").load_mappings "dap" end
  },

  ["rcarriga/nvim-dap-ui"] = {
    ft = {"dart"},
    config = function() require "custom.plugins.dapui" end,
    setup = function() require("core.utils").load_mappings "dapui" end
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline
  },

  ["ealflm/nvindent"] = {},

  ["ealflm/vim-surround"] = {
    keys = {
      "<Leader>ds", "<Leader>cs", "<Leader>cS", "<Leader>ys", "<Leader>yS",
      "<Leader>yss", "<Leader>ySs", "<Leader>ySS", "<Leader>S", "<Leader>gS"
    }
  },

  ["mhartington/formatter.nvim"] = {
    config = function() require "custom.plugins.formatter" end
  },

  ["ealflm/nvimbuffers"] = {
    config = function() require("nvimbuffers").setup() end
  }

}
