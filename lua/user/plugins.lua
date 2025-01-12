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
    { "folke/neodev.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",               -- Useful lua functions d ny lots of plugins

    "hrsh7th/nvim-cmp",                    -- The completion plugin
    "hrsh7th/cmp-nvim-lsp",                -- The completion plugin
    "hrsh7th/cmp-path",                    -- path completions
    "hrsh7th/cmp-nvim-lsp-signature-help", -- lua completions
    -- "hrsh7th/cmp-buffer",                  -- buffer completions
    -- "hrsh7th/cmp-cmdline",                 -- cmdline completions

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

<<<<<<< HEAD
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-lualine/lualine.nvim')
    use('jose-elias-alvarez/null-ls.nvim')
end)
=======
    "sindrets/diffview.nvim",
    "lewis6991/gitsigns.nvim",
    "towolf/vim-helm",
    "nvim-treesitter/nvim-treesitter-context",
    -- jkkk"iamcco/markdown-preview.nvim",
    'akinsho/bufferline.nvim',
}

require("lazy").setup(plugins, {})
>>>>>>> 6e99f0c13c6edff76042c2f422290afeba90fe5a
