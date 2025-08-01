{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Desktop
    vscode # Code editor
    code-cursor # Cursor IDE
    imv # Image viewer
    mpv # Video player
    vesktop # Discord with built-in vencord
    pavucontrol # Audio control
    ayugram-desktop # Telegram
    
    # Utilities
    bc # Calculator
    bottom # Process manager
    htop # Process manager
    inxi # System info
    playerctl # Media player
    cliphist # Clipboard history
    wl-clipboard # Clipboard
    brightnessctl # LCD brightness
    grimblast # Screenshots
    udisks # Access and manipulate disks
    ntfs3g # NTFS support

    # Terminal tools
    fastfetch # System info
    jq # JSON processor
    yazi # File manager
    bat # Better cat
    tree
    eza # Better ls
    ffmpeg # Video&Audio processor
    silicon # Code to image
    wget # Downloader
    curl # HTTP client

    # Rice stuff
    lavat # Lavalamp in terminal
    termdown # Countdown timer & clock

    # WM stuff
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    # libsForQt5.xwaylandvideobridge

    # Other
    bemoji

  ];

}