{ ... }: {
  flake.nixosModules.core-system = { config, pkgs, ... }: {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [ pkgs.home-manager ];

    system.stateVersion = config.mySystem.meta.stateVersion;
  };
}
