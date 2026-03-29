{ inputs, ... }: {
  imports = [ inputs.wrapper-modules.flakeModules.wrappers ];
  systems = [ "x86_64-linux" ];

  perSystem = { pkgs, ... }: {
    wrappers.pkgs = pkgs // {
      lndir = pkgs.xorg.lndir;
    };
  };
}
