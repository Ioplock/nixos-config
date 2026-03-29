{ ... }: {
  flake.wrappers.myHyprpaper = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.hyprpaper;

    config.flags."--config" = pkgs.writeText "hyprpaper.conf" ''
      preload = ${../../assets/catpuccin-nixos-background.jpg}
      wallpaper = ,${../../assets/catpuccin-nixos-background.jpg}
      splash = false
    '';
  };
}
