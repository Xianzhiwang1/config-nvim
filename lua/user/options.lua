-- creates a backup file vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.backup = false
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 2
-- mostly just for cmp
vim.opt.completeopt = { "menuone", "noselect" }
-- the encoding written to a file
vim.opt.fileencoding = "utf-8"
-- highlight all matches on previous search pattern
vim.opt.hlsearch = true
-- dont ignore case in search patterns
vim.opt.ignorecase = false
-- allow the mouse to be used in neovim
vim.opt.mouse = "a"
-- pop up menu height
vim.opt.pumheight = 7
-- we don't need to see things like -- INSERT -- anymore vim.opt.showtabline = 2 -- always show tabs
vim.opt.showmode = false
-- smart case
vim.opt.smartcase = true
-- make indenting smarter again
vim.opt.smartindent = true
-- force all horizontal splits to go below current window
vim.opt.splitbelow = true
-- force all vertical splits to go to the right of current window
vim.opt.splitright = true
-- creates a swapfile
vim.opt.swapfile = true
-- set term gui colors (most terminals support this)
vim.opt.termguicolors = true
-- vim.g.colors_name = "solarized"
vim.g.colors_name = "gruvbox"
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 1000
-- enable persistent undo
vim.opt.undofile = true
-- faster completion (4000ms default)
vim.opt.updatetime = 300
-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.writebackup = false
-- convert tabs to spaces
vim.opt.expandtab = true
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 4
-- insert 2 spaces for a tab
vim.opt.tabstop = 4
-- highlight the current line
vim.opt.cursorline = true
-- set numbered lines
vim.opt.number = true
-- set relative numbered lines
vim.opt.relativenumber = false
-- set number column width to 4
vim.opt.numberwidth = 4
-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "no"
-- display lines as one long line
vim.opt.wrap = false
-- is one of my fav
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- the font used in graphical neovim applications
vim.opt.guifont = "menlo:h21"

vim.opt.whichwrap = ""
-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- file encodings
vim.opt.fileencodings = "utf-8"
-- folding
vim.o.foldlevelstart = 1000
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- texconceal
vim.opt.conceallevel = 2
vim.g.tex_conceal = "abdmg"
vim.api.nvim_set_hl(0, "Conceal", { ctermfg = nil, guitermbg = nil })

-- vimtex options
vim.g.vimtex_compiler_method = "latexmk"
vim.g.tex_flavor = "latex"
-- vim.g.vimtex_view_method = "preview"
-- vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_view_method = "mupdf"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_indent_on_ampersands = 0
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_compiler_latexmk = {
  build_dir = "./build",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
    "-output-directory=build",
  },
}

-- spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us,en_ca"

-- color
-- here is the place to change the color of nvim
vim.opt.background = "dark"
-- vim.opt.background = "light"

-- note to self
-- set background=dark or light if you want light mode
-- colorscheme gruvbox



