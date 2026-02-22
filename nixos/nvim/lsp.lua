-- ~/.config/nvim/lua/lsp.lua

-- Setup Comment plugin
require('Comment').setup {}

-- Capabilities for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common on_attach function for keymaps
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
  vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, opts)
end

require("lspconfig") -- makes lspconfig's server definitions available to vim.lsp

vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Go
vim.lsp.config("gopls", {
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- Lua (Neovim config / plugins)
vim.lsp.config("lua_ls", {
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

-- Rust
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

-- Elixir (ElixirLS)
vim.lsp.config("elixirls", {
  cmd = { "elixir-ls" },
  filetypes = { "elixir", "eelixir", "heex" },
  root_markers = { "mix.exs", ".git" },
  capabilities = capabilities,
})


-- Nix (simple option)
vim.lsp.config("nil_ls", {
  root_markers = { "flake.nix", "default.nix", "shell.nix", ".git" },
})

vim.lsp.enable({ "gopls", "lua_ls", "nil_ls", "elixirls", "rust_analyzer", })
