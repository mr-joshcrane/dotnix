{
	description = "NixOS Config";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			
		};
		noctalia = {
                  url = "github:noctalia-dev/noctalia-shell";
                  inputs.nixpkgs.follows = "nixpkgs";
                };
	};
	outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixcariot = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.joshc = import ./home.nix;
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit inputs; };
					};
				}
			];
		};
	};

}
