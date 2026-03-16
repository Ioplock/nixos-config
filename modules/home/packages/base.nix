{ config, lib, pkgs, unstablePkgs, ... }:

let
  cfg = config.myHome.packages.base;
in {
  options.myHome.packages.base.enable = lib.mkEnableOption "base home packages";

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    home.packages =
      (with pkgs; [
        # Desktop
        parsec-bin
        vscode
        obsidian
        code-cursor
        imv
        mpv
        vesktop
        pavucontrol
        ayugram-desktop
        firefox
        geckodriver
        chromium
        chromedriver
        bruno

        # Utilities
        bc
        playerctl
        cliphist
        wl-clipboard
        brightnessctl
        grimblast
        hyprpicker
        udisks
        ntfs3g

        # Terminal tools
        fastfetch
        bottom
        htop
        inxi
        pastel
        jq
        bat
        tree
        eza
        ffmpeg
        silicon
        wget
        curl
        usql
        mongosh

        # Rice stuff
        lavat
        termdown

        # WM stuff
        libnotify
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland

        # Programming
        python311
        uv
        nodejs_24
        yarn-berry

        # Other
        bemoji
      ])
      ++ (with unstablePkgs; [
        # Terminal tools
        opencode
      ]);
  };
}
