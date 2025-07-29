{

	description = "My system configuration :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	let
		libNP = nixpkgs.lib;
		libHM = home-manager.lib;
		system = "x86_64-linux";
    homeStateVersion = "25.05";
    user = "ioplock";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
    nixosConfigurations = {
      nixos-ioplock = libNP.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit inputs stateVersion user;
        };
      };
    };
    homeConfigurations.${user} = libHM.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home-manager/home.nix ];
      extraSpecialArgs = {
        inherit inputs homeStateVersion user;
      };
    };
  };

}
