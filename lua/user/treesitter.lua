local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  highlight = {
    enable = true,
    disable = {"tex", "latex"}
  },
  indent = {
    enable = true
  },
  folding = {
    enable = true
  }
})


