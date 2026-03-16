{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.apps.libreoffice;
in {
  options.myHome.apps.libreoffice.enable = lib.mkEnableOption "libreoffice";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice
    ];

    home.sessionVariables = {
      SAL_USE_VCLPLUGIN = "gtk3";
    };
  };
}
