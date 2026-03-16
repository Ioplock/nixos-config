{ config, lib, user, ... }:

let
  cfg = config.mySystem.desktop.hyprland;
in {
  options.mySystem.desktop.hyprland.enable = lib.mkEnableOption "Hyprland desktop";

  config = lib.mkIf cfg.enable {
    services.libinput.enable = true;

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "hyprland > /dev/null 2>&1";
          user = user;
        };
        default_session = initial_session;
      };
    };
  };
}
