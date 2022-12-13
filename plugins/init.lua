local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["NvChad/ui"] = {
    override_options = overrides.nvchad_ui,
  },

  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  ["tpope/vim-surround"] = {},

  ["nvim-telescope/telescope-ui-select.nvim"] = {},

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  ["ealflm/nvim-dap"] = {
    config = function()
      require "custom.plugins.dap"
    end,
    setup = function()
      require("core.utils").load_mappings "dap"
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require "custom.plugins.dapui"
    end,
    setup = function()
      require("core.utils").load_mappings "dapui"
    end,
  }
}
