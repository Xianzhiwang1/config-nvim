-- guard clause to see if we are using neovide
if not vim.g.neovide then return end
vim.g.neovide_floating_blur_amount_x = 6
vim.g.neovide_floating_blur_amount_y = 6
vim.g.neovide_refresh_rate = 60
vim.g.neovide_fullscreen = false
vim.g.neovide_input_use_logo = true
vim.g.neovide_remember_window_size = true
