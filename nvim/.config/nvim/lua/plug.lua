-- [[ plug.lua ]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- [[ Appearance ]]

  use { 'ellisonleao/gruvbox.nvim' }

  use { "nvim-lualine/lualine.nvim" }

  use {
      'akinsho/bufferline.nvim', tag = "v4.*",
      requires = 'nvim-tree/nvim-web-devicons'
  }

  -- [[ General Purpose ]]

  use { 'mbbill/undotree' }

  use { "junegunn/vim-easy-align" }

  -- [[ Navigation ]]

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- [[ Completion ]]

  use {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
  }

  use {
      "windwp/nvim-autopairs",
      "windwp/nvim-ts-autotag",
  }

  use { "tpope/vim-surround" }

  -- [[ Language Support ]]

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      run = ":MasonUpdate" -- update registry contents
  }

  use { "numToStr/Comment.nvim" }

  -- [[ Git Integration ]]

  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }

  -- [[ Miscellaneous ]]

  use { "akinsho/toggleterm.nvim", tag = "v2.*" }

  use { "nvim-tree/nvim-tree.lua" }


  use { "pedrohdz/vim-yaml-folds" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
      require('packer').sync()
  end
end)
