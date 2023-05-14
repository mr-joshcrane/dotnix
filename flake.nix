{
  description = "A minimal flake for Ubuntu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { home-manager, nixpkgs, ... }: {
    packages.x86_64-linux.default = home-manager.lib.homeManagerConfiguration {
      configuration = { nixpkgs, ... }: {
        home.packages = with nixpkgs; [
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