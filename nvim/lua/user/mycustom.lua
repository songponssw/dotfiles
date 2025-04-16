vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  command = "set nocursorline",
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  command = "set cursorline",
})

vim.api.nvim_set_keymap("i", "<M-BS>", "<C-w>", { noremap = true }) -- Allow alt+backspace in insertmode


vim.api.nvim_set_option("clipboard", "unnamedplus")
-- vim.api.nvim_set_option("clipboard", "unnamedplus")
-- if has("clipboard")
--   set clipboard=unnamed " copy to the system clipboard
--   if has("unnamedplus") " X11 support
--     set clipboard+=unnamedplus
--   endif
-- endif


