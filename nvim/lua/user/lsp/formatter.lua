-- Setup formatter.nvim
require("formatter").setup({
  logging = true,
  filetype = {
    -- JavaScript, JSX, TypeScript, and related file types
    javascript = {
      function()
        return {
          exe = "prettier", -- Executable (Prettier)
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true, -- Allow stdin input
        }
      end
    },
    javascriptreact = {
      function()
        return {
          exe = "prettier", -- Executable (Prettier)
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          stdin = true,
        }
      end
    },
    -- Add more filetypes if needed (e.g., CSS, HTML)
    python = {
      function()
        return {
          exe = "black",  -- Executable (Black)
          args = { "--quiet", "-" },  -- `-` tells Black to read from stdin
          stdin = true,  -- Allow stdin input
        }
      end
    },
    c = {
      function()
        return {
          exe = "clang-format",  -- Executable (clang-format)
          args = { "--stdin" },  -- Read from stdin
          stdin = true,  -- Allow stdin input
        }
      end
    },
    cpp = {
      function()
        return {
          exe = "clang-format",  -- Executable (clang-format)
          args = { "--stdin" },  -- Read from stdin
          stdin = true,  -- Allow stdin input
        }
      end
    },
    go = {
      function()
        return {
          exe = "goimports",
          args = {},
          stdin = true,
        }
      end
    },
  },
})

