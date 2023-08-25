local status_ok, packer = pcall(require, "packer")

if not status_ok then
    vim.notify("Loading packer failed.")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("neovim/nvim-lspconfig")
    use("nvim-lua/popup.nvim")    -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim")  -- Useful lua functions used ny lots of plugins

    -- cmp plugins
    use("hrsh7th/nvim-cmp")                    -- The completion plugin
    use("hrsh7th/cmp-nvim-lsp")                -- The completion plugin
    use("hrsh7th/cmp-buffer")                  -- buffer completions
    use("hrsh7th/cmp-path")                    -- path completions
    use("hrsh7th/cmp-cmdline")                 -- cmdline completions
    use("hrsh7th/cmp-nvim-lua")                -- lua completions
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- lua completions

    use("nvim-treesitter/nvim-treesitter")

    use("nvim-telescope/telescope-file-browser.nvim")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- TeX
    use("lervag/vimtex")

    use("farmergreg/vim-lastplace")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    })
    use("nvim-lualine/lualine.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    use("sindrets/diffview.nvim")
    use("lewis6991/gitsigns.nvim")
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
