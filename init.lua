require "user.plugins"
require "user.options"
require "user.cmp"
require "user.lsp"
require "user.snippets"
require "user.treesitter"
require "user.telescope"
require "user.line"
require "user.neovide"
require "user.null"
require "user.keymaps"

function test ()
    local buf = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, 0), "")
end
