local ls = require("luasnip")
ls.config.setup({
  enable_autosnippets = true
})
local vsloader = require("luasnip.loaders.from_vscode")
local lualoader = require("luasnip.loaders.from_lua")
vsloader.load({paths = "~/.config/nvim/lua/user/snippets" })
lualoader.load({paths = "~/.config/nvim/lua/user/snippets/tex" })
