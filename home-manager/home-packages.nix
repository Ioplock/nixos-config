{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    
    # Terminal tools
    fastfetch # System info
    jq # JSON processor
    yazi # File manager
    bat # Better cat
    tree
    eza # Better ls
    ffmpeg # Video&Audio processor

    # Rice stuff
    lavat # Lavalamp in terminal
    termdown # Countdown timer & clock

    # WM stuff
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    
  ];

}