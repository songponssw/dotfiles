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

vim.opt.smarttab = true
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "go",
  callback = function()
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 8
    vim.bo.expandtab = false
  end,
})
