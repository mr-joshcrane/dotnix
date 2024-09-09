
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

require('Comment').setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { buffer = 0 })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = 0 })
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = 0 })
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = 0 })

  -- :wa = write all may be needed
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = 0 })

  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, { buffer = 0})
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0})

  -- ctrl+q to jump to quickfix
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0})

  vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = 0 })
end

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
      staticcheck = true,
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.golangci_lint_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}

require("rust-tools").setup({
  server = {
    on_attach = function(client) 
      client.server_capabilities.semanticTokensProvider = nil 
    end,
  }
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
end

lspconfig.rust_analyzer.setup {
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
        command = "clippy",  -- Use `clippy` for linting
      },
    },
  },
}

require("elixir-ls").setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
