{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.myHome.apps.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  options.myHome.apps.spicetify.enable = lib.mkEnableOption "spicetify";

  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        beautifulLyrics
        adblockify
        hidePodcasts
        shuffle
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
  };
}
