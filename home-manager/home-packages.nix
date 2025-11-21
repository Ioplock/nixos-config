{ pkgs, unstablePkgs, inputs, system, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = 
    (with pkgs; [
      # Section for stable version packages

      # Desktop
      parsec-bin # Remote control client (no server functions)
      vscode # Code editor
      obsidian # Notes and MD files
      code-cursor # Cursor IDE
      imv # Image viewer
      mpv # Video player
      vesktop # Discord with built-in vencord
      pavucontrol # Audio control
      ayugram-desktop # Telegram
      firefox # Firefox
      geckodriver # Driver for selenium
      chromium # Opensource chrome browser
      chromedriver # Driver for selenium


      # Utilities
      bc # Calculator
      playerctl # Media player
      cliphist # Clipboard history
      wl-clipboard # Clipboard
      brightnessctl # LCD brightness
      grimblast # Screenshots
      hyprpicker # Color picker
      udisks # Access and manipulate disks
      ntfs3g # NTFS support

      # Terminal tools
      fastfetch # System info
      bottom # Process manager
      htop # Process manager
      inxi # System info
      pastel # Color tool
      jq # JSON processor
      bat # Better cat
      tree
      eza # Better ls
      ffmpeg # Video&Audio processor
      silicon # Code to image
      wget # Downloader
      curl # HTTP client
      usql # Universal cli tool for SQL databases
      mongosh # MongoDB cli tool

      # Rice stuff
      lavat # Lavalamp in terminal
      termdown # Countdown timer & clock

      # WM stuff
      libnotify
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland

      # Programming
      python311
      uv # Package manager for python
      nodejs_24 # Javascript
      yarn-berry # Node.js package manager

      # Other
      bemoji
    ])
    ++ (with unstablePkgs; [
      # Section for unstable version packages
      
      # Terminal tools
      opencode # Terminal AI agent
    ]);

}
