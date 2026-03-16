{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.terminal.zoxide;
in {
  options.myHome.terminal.zoxide.enable = lib.mkEnableOption "zoxide";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zoxide
    ];

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
