{ inputs, ... }: {
  flake.nixosModules.stylix = { lib, pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      image = ../../assets/catpuccin-nixos-background.jpg;

      cursor = {
        name = "DMZ-Black";
        size = 24;
        package = pkgs.vanilla-dmz;
      };

      fonts = {
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        monospace = {
          name = "JetBrains Mono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };
        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };
        sizes = {
          terminal = 13;
          applications = 11;
          desktop = 11;
        };
      };

      opacity.terminal = 0.8;

      homeManagerIntegration.autoImport = true;
    };
  };
}
