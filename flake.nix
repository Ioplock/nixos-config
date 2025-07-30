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

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
		libNP = nixpkgs.lib;
		libHM = home-manager.lib;
		system = "x86_64-linux";
    version = "25.05";
    stateVersion = version;
    homeStateVersion = version;
    user = "ioplock";
    host = "nixos-ioplock";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
    nixosConfigurations = {
      ${host} = libNP.nixosSystem {
        inherit system;
        modules = [ ./nixos/configuration.nix ];
        specialArgs = {
          inherit inputs stateVersion user host;
        };
      };
    };
    homeConfigurations.${user} = libHM.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home-manager/home.nix ];
      extraSpecialArgs = {
        inherit inputs homeStateVersion user host;
      };
    };
  };

}
