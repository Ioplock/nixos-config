{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "f" ''
      #!${pkgs.bash}/bin/bash
      # "f": run fzf standalone or with command output
      if [ "$#" -eq 0 ]; then
        ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
        exit 0
      fi
      "$@" | ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
    '')
  ];
}
