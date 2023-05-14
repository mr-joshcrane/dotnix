{
  description = "A minimal flake for Ubuntu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { home-manager, nixpkgs, ... }: {
    homeManagerConfigurations.joshcrane = home-manager.lib.homeManagerConfiguration {
      configuration = { pkgs, ... }: {
        home.packages = with pkgs; [
          htop
          neovim
          curl
          git
        ];
      };
      system = "x86_64-linux";
      homeDirectory = "/home/joshcrane";
      username = "joshcrane";
    };
  };
}