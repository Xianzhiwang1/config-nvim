local success, telescope = pcall(require, "telescope")
if not success then
  print("WARNING: telescope not loaded.")
  return
end
local actions = require("telescope.actions")

telescope.setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        n = {
          ["<BS>"] = actions.delete_buffer,
          ["<DEL>"] = actions.delete_buffer
        }
      }
    }
  }
}
