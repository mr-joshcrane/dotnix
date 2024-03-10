{ pkgs }:
{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-fzf-native-nvim
    lazygit-nvim
    comment-nvim
    vim-tmux-navigator
    copilot-vim
    vim-go
    luasnip
    cmp_luasnip
    cmp-git
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    trouble-nvim
    mason-lspconfig-nvim
    null-ls-nvim
    catppuccin-nvim

    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = builtins.readFile ./nvim/treesitter.lua;
    }
    {
      plugin = mason-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/mason.lua;
    }
    {
      plugin = trouble-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/trouble.lua;
    }
    {
      plugin = lightspeed-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/lightspeed.lua;
    }
    {
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/lualine.lua;
    }
    {
      plugin = leap-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/leap.lua;
    }
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = builtins.readFile ./nvim/nvim-tree.lua;
    }
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = builtins.readFile ./nvim/bufferline.lua;
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./nvim/lsp.lua;
    }
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./nvim/cmp.lua;
    }
    neodev-nvim
    nvim-dap-go
    nvim-dap-ui
    nvim-dap-virtual-text
    telescope-dap-nvim
    {
      plugin = nvim-dap;
      type = "lua";
      config = builtins.readFile ./nvim/dap.lua;
    }
    git-worktree-nvim
  ];
  extraLuaConfig = builtins.readFile ./nvim/init.lua;
}
