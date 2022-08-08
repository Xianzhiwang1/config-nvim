local success, _ = pcall(require, "lspconfig")
if not success then
  print("WARNING: lspconfig not loaded.")
  return
end

-- Not sure what handlers do.
-- require("user.lsp.handlers").setup()
require("user.lsp.lsp-installer")

