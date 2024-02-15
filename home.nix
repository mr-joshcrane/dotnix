{ pkgs, ... }:
{
  home.username = "jcrane";
  home.homeDirectory = "/home/jcrane";
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    tmux
    zsh
    starship
    git
    gh
    golangci-lint
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
    go
    delve
    gopls
    lazygit

    # Required for mason lsp
    nodejs_20
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

   #programs.direnv = {
   #  enable = true;
   #  nix-direnv.enable = true;
   #};
   programs.starship = import ./programs/starship.nix {
    inherit pkgs;
   };
   programs.tmux = import ./programs/tmux.nix {
     inherit pkgs;
   };

   #programs.alacritty = import ./programs/alacritty.nix {
   #  inherit pkgs;
   #};

   programs.zsh = import ./programs/zsh.nix {
     inherit pkgs;
   };
  
   programs.neovim = import ./programs/neovim.nix {
     inherit pkgs;
   };
}
