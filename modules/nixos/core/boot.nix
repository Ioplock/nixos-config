{ config, lib, ... }:

let
  cfg = config.mySystem.core.boot;
in {
  options.mySystem.core.boot.enable = lib.mkEnableOption "boot loader";

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
