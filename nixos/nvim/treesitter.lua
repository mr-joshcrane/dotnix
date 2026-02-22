local ok, ts = pcall(require, "nvim-treesitter.configs")
if ok then
  ts.setup {
    indent = { enable = true },
    highlight = { enable = true, additional_vim_regex_highlighting = true },
  }
else
  vim.notify("nvim-treesitter not loaded yet")
end

