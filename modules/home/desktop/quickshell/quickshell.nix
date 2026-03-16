{ config, lib, inputs, system, ... }:

let
  cfg = config.myHome.desktop.quickshell;
in {
  options.myHome.desktop.quickshell.enable = lib.mkEnableOption "quickshell";

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.quickshell.packages.${system}.default
    ];
  };
}
