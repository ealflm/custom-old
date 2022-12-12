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
}
