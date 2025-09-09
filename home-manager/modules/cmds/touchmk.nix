{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "touchmk" ''
      #!${pkgs.bash}/bin/bash
      set -euo pipefail

      # touchmk: mkdir -p for parent dirs, then touch the file(s)
      if [ "$#" -eq 0 ]; then
        echo "Usage: touchmk <path/to/file> [more/files...]" >&2
        exit 1
      fi

      for filepath in "$@"; do
        dirpath="$(${pkgs.coreutils}/bin/dirname -- "$filepath")"
        # Only mkdir -p if there is a directory component
        if [ "$dirpath" != "." ]; then
          ${pkgs.coreutils}/bin/mkdir -p -- "$dirpath"
        fi
        ${pkgs.coreutils}/bin/touch -- "$filepath"
      done
    '')
  ];
}

