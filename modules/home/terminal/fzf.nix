{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.terminal.fzf;
in {
  options.myHome.terminal.fzf.enable = lib.mkEnableOption "fzf";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fzf
    ];

    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
