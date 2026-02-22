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
    opencode
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
    
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      image = "$HOME/Downloads/lockscreen.png";
      scaling = "fill";
      clock = true;
      timestr = "%H:%M";
      fade-in = 0.3;
      show-keyboard-layout = true;
      grace = 5;
      effect-blur = "10x2";
      effect-vignette = "0.5:0.5";
      font = "JetBrains Mono";
      show-failed-attempts = true;
      indicator-radius = 60;

      ring-color = "#d4af37";
      ring-clear-color = "#4a9fff";
      ring-wrong-color = "#ff6b6b";
      text-color = "#f0f0f0";
      inside-color = "#0a192fdd";
    };
  };

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;	
  };
}
