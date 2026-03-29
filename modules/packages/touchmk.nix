{ ... }: {
  perSystem = { pkgs, ... }: {
    packages.touchmk = pkgs.writeShellScriptBin "touchmk" ''
      #!${pkgs.bash}/bin/bash
      set -euo pipefail

      if [ "$#" -eq 0 ]; then
        echo "Usage: touchmk <path/to/file> [more/files...]" >&2
        exit 1
      fi

      for filepath in "$@"; do
        dirpath="$(${pkgs.coreutils}/bin/dirname -- "$filepath")"
        if [ "$dirpath" != "." ]; then
          ${pkgs.coreutils}/bin/mkdir -p -- "$dirpath"
        fi
        ${pkgs.coreutils}/bin/touch -- "$filepath"
      done
    '';
  };
}
