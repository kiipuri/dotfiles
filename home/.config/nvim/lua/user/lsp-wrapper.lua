local python_status_ok = pcall(require, "user.lsp.python-ls")
if not python_status_ok then
    return
end

local bash_status_ok = pcall(require, "user.lsp.bash-ls")
if not bash_status_ok then
    return
end

local lua_status_ok = pcall(require, "user.lsp.lua-ls")
if not lua_status_ok then
    return
end

local c_status_ok = pcall(require, "user.lsp.c-ls")
if not c_status_ok then
    return
end

local rust_status_ok = pcall(require, "user.lsp.rust-ls")
if not rust_status_ok then
    return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    o_attach = function(client)
        require "illuminate".on_attach(client)
    end,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'
require"luasnip.loaders.from_vscode".lazy_load()

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}
