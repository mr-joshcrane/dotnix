{
  description = "A minimal flake for Ubuntu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  # add the inputs declared above to the argument attribute set
  outputs = { home-manager, nixpkgs, ... }: {
    packages.x86_64-linux  = {
    # you can have multiple darwinConfigurations per flake, one per hostname
        system = "x86_64-linux";

        modules = [
            home-manager.darwinModules.home-manager
            {
                services.nix-daemon.enable = true;
                programs.zsh.enable = true;
                security.pam.enableSudoTouchIdAuth = true;
                users.users = {
                  "joshcrane" = {
                    name = "joshcrane";
                    home = "/home/joshcrane";
                  };
                };
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;

                    users."joshcrane" = import ./home.nix;
                };
            }
        ]; # will be important later
    };
  };
}
