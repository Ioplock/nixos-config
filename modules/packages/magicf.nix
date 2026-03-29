{ ... }: {
  perSystem = { pkgs, ... }: {
    packages.magicf = pkgs.writeShellScriptBin "f" ''
      #!${pkgs.bash}/bin/bash
      if [ "$#" -eq 0 ]; then
        ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
        exit 0
      fi

      "$@" | ${pkgs.fzf}/bin/fzf | ${pkgs.coreutils}/bin/sort
    '';
  };
}
