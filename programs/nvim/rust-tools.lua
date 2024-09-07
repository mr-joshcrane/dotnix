local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        procMacro = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
})
