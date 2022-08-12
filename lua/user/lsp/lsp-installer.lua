require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "bashls", "texlab" }
})
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["sumneko_lua"] = function ()
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          completion = {
            -- Disable autocompletion with comments. I can spell well enough.
            showWord = "Disable",
            workspaceWord = "Disable",
          }
        }
      }
    }
  end,
  ["pyright"] = function()
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic"
          },
          venvPath = ".venv",
        },
        pyright = {
          disableLanguageServices = true
        }
      }
    })
  end,
  ["clangd"] = function()
    lspconfig.clangd.setup({
      settings = {
        CompileFlags = {
          std = "c11",
          compiler = "gcc",
        },
      }
    })
  end
})

