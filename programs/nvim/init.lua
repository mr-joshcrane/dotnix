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
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope lsp_references<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope lsp_definitions<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fi', ':Telescope lsp_implementations<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope lsp_code_actions<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope treesitter<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fp', ':Telescope projects<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fo', ':Telescope oldfiles<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = true, silent = true})


vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
