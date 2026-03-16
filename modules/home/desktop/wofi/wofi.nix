{ config, lib, ... }:

let
  cfg = config.myHome.desktop.wofi;
in {
  options.myHome.desktop.wofi.enable = lib.mkEnableOption "wofi";

  config = lib.mkIf cfg.enable {
    programs.wofi = {
      enable = true;
      settings = {
        allow_markup = true;
        allow_images = true;
        width = 350;
        height = 450;
      };
    };

    home.file.".config/wofi/style.css".source = ./style.css;
  };
}
