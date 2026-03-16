{ homeStateVersion, user, ... }:

{
  imports = [
    ../../modules/home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  myHome = {
    packages.base.enable = true;

    terminal = {
      zsh.enable = true;
      fzf.enable = true;
      zoxide.enable = true;
      yazi.enable = true;
      ghostty.enable = true;
      cmds.touchmk.enable = true;
      cmds.magicf.enable = false;
    };

    editors.neovim.enable = true;

    desktop = {
      hyprland.enable = true;
      hyprlock.enable = true;
      hypridle.enable = true;
      hyprpaper.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      swaync.enable = true;
      quickshell.enable = true;
      qt.enable = true;
    };

    apps = {
      libreoffice.enable = true;
      spicetify.enable = true;
    };

    dev.git.enable = true;

    theme.stylix.enable = true;
  };
}
