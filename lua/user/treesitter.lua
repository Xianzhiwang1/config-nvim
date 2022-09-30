local success, treesitter = pcall(require, "nvim-treesitter.configs")
if not success then
  print("WARNING: treesitter not loaded.")
  return
end

treesitter.setup({
  ensure_installed = { "c", "python", "bash", "json", "jsonc", "yaml", "lua" },
  sync_install = false,
  highlight = { enable = true, disable = { "tex", "latex" } },
  indent = { enable = true },
  folding = { enable = true },
})
