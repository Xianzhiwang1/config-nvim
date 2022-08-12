local success, gitsigns = pcall(require, 'gitsigns')
if not success then
  print("WARNING: gitsigns not loaded.")
  return
end
gitsigns.setup({
  signcolumn = true,
  numhl = true,
  linehl = false,
  word_diff = false,
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 100
  }
})

