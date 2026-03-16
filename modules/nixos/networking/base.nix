{ config, lib, host, ... }:

let
  cfg = config.mySystem.networking.base;
in {
  options.mySystem.networking.base.enable = lib.mkEnableOption "networking";

  config = lib.mkIf cfg.enable {
    networking.hostName = host;
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Moscow";

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 22 5432 27017 80 8080 ];
    };
  };
}
