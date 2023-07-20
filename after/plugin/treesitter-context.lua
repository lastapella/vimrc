require('treesitter-context').setup({
  enable = true ,
  separator = '-',
})

vim.keymap.set("n", "[c", function()
  vim.cmd("ma `")
  require("treesitter-context").go_to_context()
  vim.cmd("norm! zz")
end, { silent = true })

vim.keymap.set("n", "]c", "``zz")
