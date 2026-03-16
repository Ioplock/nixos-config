{ config, lib, ... }:

let
  cfg = config.mySystem.services.bluetooth;
in {
  options.mySystem.services.bluetooth.enable = lib.mkEnableOption "bluetooth";

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = true;
  };
}
