  -- Setup nvim-cmp.
  local cmp = require'cmp'

cmp.setup({
  snippet = {
   -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {},
  mapping = ({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
       { name = 'texlab', max_item_count = 3},
       { name = 'nvim_lsp' },
    -- { name = 'ultisnips' }, -- For ultisnips users.
  })
})
 
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['texlab'].setup {
    capabilities = capabilities
}
