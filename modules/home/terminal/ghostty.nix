{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.terminal.ghostty;
in {
  options.myHome.terminal.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ghostty
    ];

    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;

      settings = {
        theme = "catppuccin-mocha";

        cursor-style = "bar";
        cursor-style-blink = "true";

        background-opacity = "0.8";
        background-blur-radius = "20";

        window-vsync = "false";
        window-decoration = "false";

        window-save-state = "never";

        shell-integration = "zsh";
      };
    };
  };
}
