{ inputs, ... }: {
  flake.homeManagerModules.apps-spicetify = { pkgs, ... }: let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

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
