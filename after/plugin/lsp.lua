local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  },
})


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp.default_keymaps({ buffer = bufnr })
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
  preselect = 'item',
  completion = {
    -- autocomplete = false,
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    -- ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<S-space>'] = cmp.mapping.complete(),
    -- ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<S-Tab>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.close(),
  },
  -- window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
  -- }
})

-- cmp.setup({
--   mapping = {
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--
--     -- Navigate between snippet placeholder
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--   }
-- })

function ReloadLSP()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd.edit()

end
