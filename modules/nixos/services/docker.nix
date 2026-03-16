{ config, lib, pkgs, ... }:

let
  cfg = config.mySystem.services.docker;
in {
  options.mySystem.services.docker.enable = lib.mkEnableOption "docker";

  config = lib.mkIf cfg.enable {
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    environment.systemPackages = [ pkgs.docker pkgs.docker-compose ];
  };
}
