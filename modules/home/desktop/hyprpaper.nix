{ config, lib, ... }:

let
  cfg = config.myHome.desktop.hyprpaper;
in {
  options.myHome.desktop.hyprpaper.enable = lib.mkEnableOption "hyprpaper";

  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
    };
  };
}
