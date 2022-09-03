local success, telescope = pcall(require, "telescope")
if not success then
  print("WARNING: telescope not loaded.")
  return
end
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--no-ignore",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        n = {
          ["<BS>"] = actions.delete_buffer,
          ["<DEL>"] = actions.delete_buffer,
        },
      },
    },
  },
})
