-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    "neovim/nvim-lspconfig",
    "nvim-lua/popup.nvim",                 -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim",               -- Useful lua functions d ny lots of plugins

    "hrsh7th/nvim-cmp",                    -- The completion plugin
    "hrsh7th/cmp-nvim-lsp",                -- The completion plugin
    "hrsh7th/cmp-buffer",                  -- buffer completions
    "hrsh7th/cmp-path",                    -- path completions
    "hrsh7th/cmp-cmdline",                 -- cmdline completions
    "hrsh7th/cmp-nvim-lua",                -- lua completions
    "hrsh7th/cmp-nvim-lsp-signature-help", -- lua completions

    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-file-browser.nvim",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- TeX
    "lervag/vimtex",
    "farmergreg/vim-lastplace",

    "nvim-telescope/telescope.nvim",
    "nvim-lualine/lualine.nvim",
    "jose-elias-alvarez/null-ls.nvim",

    "sindrets/diffview.nvim",
    "lewis6991/gitsigns.nvim",
    "iamcco/markdown-preview.nvim",
}

require("lazy").setup(plugins, {})
