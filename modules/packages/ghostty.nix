{ ... }: {
  flake.wrappers.myGhostty = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.ghostty;

    config.flags."--config-file" = pkgs.writeText "ghostty-config" ''
      theme = catppuccin-mocha
      cursor-style = bar
      cursor-style-blink = true
      background-opacity = 0.8
      background-blur-radius = 20
      window-vsync = false
      window-decoration = false
      window-save-state = never
      shell-integration = zsh
    '';
  };
}
