require('lualine').setup({
  options = { theme = 'material' },
  sections = {
    lualine_c = { { 'filename', path = 1 } }
  }
})
