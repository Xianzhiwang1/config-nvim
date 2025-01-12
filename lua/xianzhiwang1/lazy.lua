-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.mapleader = ' '
local plugins = {
    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    -- treesitter
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
    },





    -- color
    'morhetz/gruvbox',
    -- harpoon
    'theprimeagen/harpoon',
    -- undotree
    'mbbill/undotree',
    -- vim-fugitive
    'tpope/vim-fugitive',
    -- not use lsp-zero
    -- plugins necessary for after/plugin/lsp.lua
    -- cmp plugins
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- Snippets
    'saadparwaiz1/cmp_luasnip',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- Tex
    "lervag/vimtex",

    -- popup
    "nvim-lua/popup.nvim",


    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    -- for formatters and linters
    -- use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }
    -- snippets
    -- use {"evesdropper/luasnip-latex-snippets.nvim",}

    -- markdown preview
    -- install without yarn or npm
    --use({
    --    "iamcco/markdown-preview.nvim",
    --    run = function() vim.fn["mkdp#util#install"]() end,
    --})

    { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
}

-- require("lazy").setup(plugins, {})
-- Setup lazy.nvim
require("lazy").setup(plugins, {
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

