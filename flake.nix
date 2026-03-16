{
  description = "My system configuration :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    libNP = nixpkgs.lib;
    libHM = home-manager.lib;
    system = "x86_64-linux";
    version = "25.05";
    stateVersion = version;
    homeStateVersion = version;
    user = "ioplock";
    host = "nix-laptop";
    pkgs = nixpkgs.legacyPackages.${system};
    unstablePkgs = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations.${host} = libNP.nixosSystem {
      inherit system;
      modules = [
        ./hosts/${host}/configuration.nix
      ];
      specialArgs = {
        inherit inputs unstablePkgs stateVersion user host system;
      };
    };

    homeConfigurations.${user} = libHM.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./hosts/${host}/home.nix
      ];
      extraSpecialArgs = {
        inherit inputs unstablePkgs homeStateVersion user host system;
      };
    };
  };
}
