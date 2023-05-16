vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr"
vim.opt.foldlevel = 99
vim.opt.colorcolumn = "80,120"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.showcmd = true
vim.g.mapleader = " "
vim.cmd [[autocmd FileType markdown set tw=80 wrap]]

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
