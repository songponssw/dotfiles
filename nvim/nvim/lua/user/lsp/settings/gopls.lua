lspconfig = require "lspconfig"
  util = require "lspconfig/util"

  lspconfig.gopls.setup {
      cmd = {"gopls", "serve"},
      filetypes = {"go", "gomod"},
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedparams = true,
                },
            staticcheck = true
          },
      },
    }
