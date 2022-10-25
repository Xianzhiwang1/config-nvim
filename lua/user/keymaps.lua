local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Shouldn't use arrows to navigate
keymap("i", "<Up>", "", opts)
keymap("i", "<Down>", "", opts)
keymap("i", "<Left>", "", opts)
keymap("i", "<Right>", "", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)
keymap("n", "<Leader>w", ":bdelete<CR>", opts)
keymap("n", "<Leader>s", ":w<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", "\"_dP", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
keymap("t", "<C-m>", "<C-\\><C-n>", term_opts)
keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", term_opts)
keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>f", ":Telescope live_grep hidden=true<CR>", term_opts)
keymap("n", "<leader>p", ":Telescope find_files hidden=true no_ignore=true<CR>",
       term_opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", term_opts)

-- git-related
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", term_opts)
keymap("n", "<leader>gl", ":Telescope git_commits<CR>", term_opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", term_opts)

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gk", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "gf", vim.lsp.buf.formatting)
vim.g.maplocalleader = " "

keymap("n", ",r",
       ":w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> build/%:r.pdf <CR><R>",
       term_opts)

keymap("i", "<C-s>", "<Esc>mm[sz=1<CR>`mA", term_opts)
keymap("n", "<C-s>", "mm[sz=1<CR>`m", term_opts)
vim.api.nvim_command([[
  autocmd InsertEnter * set timeoutlen=150
  autocmd InsertLeave * set timeoutlen=1000
]])
keymap("i", "jk", "<Esc>", term_opts)
keymap("i", "kj", "<Esc>", term_opts)
