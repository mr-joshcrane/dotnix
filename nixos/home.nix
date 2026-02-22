{ inputs, pkgs, ... }:

{

  imports = [
    ./neovim.nix
    inputs.noctalia.homeModules.default
  ];

  home.username = "joshc";
  home.homeDirectory ="/home/joshc";
  programs.git.enable = true;
  home.stateVersion = "25.05";
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
