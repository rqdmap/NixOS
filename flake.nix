{
	description = "NixOS configuration by rqdmap";

	nixConfig = {
		experimental-features = ["nix-command" "flakes" ];
		substituters = [
			"https://mirror.bfsu.edu.cn/nix-channels/store"
			"https://cache.nixos.org/"
		];
		cores = 0;

	};

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./common

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					
					home-manager.extraSpecialArgs = inputs;
					home-manager.users.rqdmap = import ./home;
				}
			];
		};
	};
}
