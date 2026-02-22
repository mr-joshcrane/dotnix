{ inputs, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    inputs.noctalia.homeModules.default
  ];

  home.username = "joshc";
  home.homeDirectory ="/home/joshc";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    gh
    ripgrep
    fd
    unzip
    nodejs_24
    gnugrep
    jq
    wl-clipboard
    gcc
    openssl
    pkg-config
    signal-desktop

    flyctl
    yubikey-manager

    go
    gopls
    delve
    golangci-lint

    rustc
    cargo
    cargo-generate
    rust-analyzer
    clippy

    elixir_1_16
    erlang

    nil
    lua-language-server
  ];

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
  ];
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild --flake ~/dotnix/nixos#nixcariot switch";
    };
  };
    
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;	
  };
}
