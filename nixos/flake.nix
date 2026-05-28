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
		silent-sddm = {
			url = "github:uiriansan/SilentSDDM";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = inputs@{ self, nixpkgs, home-manager, silent-sddm, ... }: {
		nixosConfigurations.nixcariot = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				silent-sddm.nixosModules.default
				home-manager.nixosModules.home-manager
				{
					nixpkgs.overlays = [
						(final: prev: {
							xwayland-satellite = prev.xwayland-satellite.overrideAttrs (old: rec {
								version = "0.8.1-unstable-2026-03-16";
								src = final.fetchFromGitHub {
									owner = "Supreeeme";
									repo = "xwayland-satellite";
									rev = "a879e5e0896a326adc79c474bf457b8b99011027";
									hash = "sha256-wToKwH7IgWdGLMSIWksEDs4eumR6UbbsuPQ42r0oTXQ=";
								};
								cargoDeps = final.rustPlatform.fetchCargoVendor {
									inherit src;
									name = "xwayland-satellite-${version}-vendor";
									hash = "sha256-jbEihJYcOwFeDiMYlOtaS8GlunvSze80iWahDj1qDrs=";
								};
							});
						})
					];
				}
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
			specialArgs = { inherit inputs; };
		};
	};

}
