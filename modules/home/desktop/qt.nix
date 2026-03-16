{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.desktop.qt;
in {
  options.myHome.desktop.qt.enable = lib.mkEnableOption "qt";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      papirus-icon-theme
      pcmanfm-qt
    ];

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        package = pkgs.adwaita-qt;
        name = "adwaita-dark";
      };
    };
  };
}
