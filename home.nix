{ pkgs, ... }:
{
  home.username = "jcrane";
  home.homeDirectory = "/home/jcrane";
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
    gnugrep
    flyctl
    ripgrep
    fd
    jq
    yq-go
    nerdfonts
    direnv
    colima
    yubikey-manager
    unzip
    wget
    gcc
    # go
    go
    delve
    gopls
    treesitter
    lazygit

    # Required for mason lsp
    nodejs_20
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

   programs.direnv = {
     enable = true;
     nix-direnv.enable = true;
   };
   programs.tmux = import ./programs/tmux.nix {
     inherit pkgs;
   };

   programs.alacritty = import ./programs/alacritty.nix {
     inherit pkgs;
   };

   programs.zsh = import ./programs/zsh.nix {
     inherit pkgs;
   };
  
   programs.neovim = import ./programs/neovim.nix {
     inherit pkgs;
   };
}
