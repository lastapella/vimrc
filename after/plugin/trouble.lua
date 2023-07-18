vim.keymap.set("n", "<leader>n", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>")
vim.keymap.set("n", "<leader><S-n>", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>")
-- Lua
vim.keymap.set("n", "<leader>bb", "<cmd>TroubleToggle<cr>",

  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>bw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>bd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>bl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>bq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)
