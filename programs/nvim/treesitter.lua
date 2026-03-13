local ok, ts = pcall(require, "nvim-treesitter.configs")
if ok then
  ts.setup {
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    indent = { enable = true },
  }
end

