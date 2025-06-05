return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  cmd = 'Nerdy',
  keys = {
    vim.keymap.set('n', '<leader>n', "<cmd>lua require('telescope').extensions.nerdy.nerdy()<cr>", { desc = '[S]earch [N]erdIcons' }),
  },
}
