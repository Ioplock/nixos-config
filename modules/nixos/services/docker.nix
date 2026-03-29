{ ... }: {
  flake.nixosModules.services-docker = { pkgs, ... }: {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    environment.systemPackages = [ pkgs.docker pkgs.docker-compose ];
  };
}
