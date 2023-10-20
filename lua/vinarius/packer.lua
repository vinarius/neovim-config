--, This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      -- vim.cmd('colorscheme rose-pine')
    end
  })

  use('github/copilot.vim')
  -- git clone https://github.com/github/copilot.vim.git \
  --  ~/.config/nvim/pack/github/start/copilot.vim
  --  :Copilot setup

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('ThePrimeagen/vim-be-good')
  use('m4xshen/autoclose.nvim')
  use('Mofiqul/vscode.nvim')
  use {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  }
  use('simrat39/rust-tools.nvim')
  use {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end
  }
  use 'andweeb/presence.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- use {
  --   'prettier/vim-prettier',
  --   run = 'npm i',
  --   ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'},
  -- }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }

  -- use({
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- })
end)
