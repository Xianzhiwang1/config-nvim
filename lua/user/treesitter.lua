local success, treesitter = pcall(require, "nvim-treesitter.configs")
if not success then
    print("WARNING: treesitter not loaded.")
    return
end

treesitter.setup({
    ensure_installed = { "python", "bash", "rust", "lua" },
    sync_install = false,
    highlight = { enable = true, disable = { "tex", "latex" } }, -- use vimtex
    indent = { enable = true, },
    folding = { enable = true },
})

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

-- Telescope --
keymap("n", "<leader>f", ":Telescope live_grep hidden=true<CR>", term_opts)
keymap("n", "<leader>p", ":Telescope find_files hidden=true no_ignore=true<CR>",
    term_opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", term_opts)

-- git-related
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", term_opts)
keymap("n", "<leader>gl", ":Telescope git_commits<CR>", term_opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", term_opts)
