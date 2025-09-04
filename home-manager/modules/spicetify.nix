{ pkgs, inputs, ... }: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify 
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      beautifulLyrics
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
