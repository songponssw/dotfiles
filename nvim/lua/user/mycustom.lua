vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  command = "set nocursorline",
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  command = "set cursorline",
})

vim.api.nvim_set_keymap("i", "<M-BS>", "<C-w>", { noremap = true }) -- Allow alt+backspace in insertmode




