-- Setup nvim-cmp.
local cmp = require 'cmp'
local luasnip = require("luasnip")
cmp.setup({
  snippet = {
   -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
     completion = cmp.config.window.bordered({
       side_padding=0
     }),
     documentation = cmp.config.window.bordered(),
  },
  mapping = {
    -- Find a better way to scroll docs.
    -- ['<Down>'] = cmp.mapping.scroll_docs(-4),
    -- ['<Up>'] = cmp.mapping.scroll_docs(4),
    -- TODO: Better jumping? I dont really use jumping
    -- Expand snippets with spacebar if cmp menu is visible
    ['<Leader>'] = cmp.mapping(
      function(fallback)
        local active_entry = cmp.get_active_entry()
        if luasnip.expandable() and cmp.visible() and active_entry then
          cmp.complete()
          luasnip.expand()
        elseif cmp.visible() and active_entry then
          cmp.complete()
          cmp.close()
          fallback()
        else
          fallback()
        end
      end,
      {"i", "s"}
    ),
    -- Supertab
    ['<Tab>'] = cmp.mapping(
      function(fallback)
        local active_entry = cmp.get_active_entry()
        local expandable = luasnip.expandable()
        if not active_entry and expandable then
          luasnip.confirmg()
          luasnip.expand()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        else
          fallback()
        end
      end,
      {"i", "s"}
    ),
    ['<S-Tab>'] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      {"i", "s"}
    ),
    -- Rather than exiting insert mode, abort expansion.
    ['<Esc>'] = cmp.mapping(
      function(fallback)
        if cmp.visible then
          cmp.abort()
        end
        fallback()
      end,
      { "i", "s" }
    )
  },
  experimental = {
    -- Ghost text can be a little laggy
    -- ghost_text = true
  },
  sources = {
       { name = 'luasnip' },
       { name = 'nvim_lsp' },
       { name = 'path' },
  }
})

