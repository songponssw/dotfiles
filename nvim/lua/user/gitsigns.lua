local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },

on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Define a helper to create buffer-local keymaps
    local function bufmap(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
    end

    -- Navigation
    bufmap('n', ']c', '<cmd>Gitsigns next_hunk<CR>', 'Next Git hunk')
    bufmap('n', '[c', '<cmd>Gitsigns prev_hunk<CR>', 'Previous Git hunk')

    -- Git actions
    bufmap('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
    bufmap('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
    bufmap('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
    bufmap('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage')
    bufmap('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
    bufmap('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
    bufmap('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
    bufmap('n', '<leader>tb', gs.toggle_current_line_blame, 'Toggle blame')
    bufmap('n', '<leader>td', gs.toggle_deleted, 'Toggle deleted')
  end



}
