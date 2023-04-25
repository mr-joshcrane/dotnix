{ pkgs, ... }:
{
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    tmux
    alacritty
    oh-my-zsh
    zsh
    git
    gh
    flyctl
    kubectl
    awscli2
    google-cloud-sdk
    terraform
    ripgrep
    fd
    jq
    nerdfonts
    rustc
    cargo
    direnv
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;

  programs.tmux = import ./programs/tmux.nix {
    inherit pkgs;
  };

  programs.alacritty = import ./programs/alacritty.nix {
    inherit pkgs;
  };

  programs.zsh = import ./programs/zsh.nix {
    inherit pkgs;
  };

  programs.git = import ./programs/git.nix {
    inherit pkgs;
  };

  programs.neovim = import ./programs/neovim.nix {
    inherit pkgs;
  };
}
