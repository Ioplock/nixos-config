{ config, lib, pkgs, stateVersion, ... }:

let
  cfg = config.mySystem.core.system;
in {
  options.mySystem.core.system.enable = lib.mkEnableOption "base system settings";

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      home-manager
    ];

    system.stateVersion = stateVersion;
  };
}
