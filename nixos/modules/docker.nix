{ config, pkgs, ... }:
{
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;  # exports DOCKER_HOST for you
  };

  environment.systemPackages = [ pkgs.docker pkgs.docker-compose ];
}
