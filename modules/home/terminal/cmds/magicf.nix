{ config, lib, pkgs, ... }:

let
  cfg = config.myHome.terminal.cmds.magicf;
in {
  options.myHome.terminal.cmds.magicf.enable = lib.mkEnableOption "magicf";

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "f" ''
        #!${pkgs.bash}/bin/bash
        if [ "$#" -eq 0 ]; then
          ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
          exit 0
        fi
        "$@" | ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
      '')
    ];
  };
}
