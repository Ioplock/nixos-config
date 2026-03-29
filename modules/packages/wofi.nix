{ ... }: {
  flake.wrappers.myWofi = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.wofi;

    config.flags."--conf" = pkgs.writeText "wofi-config" ''
      allow_markup=true
      allow_images=true
      width=350
      height=450
    '';

    config.flags."--style" = ./wofi/style.css;
  };
}
