{ self, inputs, ... }:
let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  unstablePkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  flake.nixosConfigurations.nix-laptop = inputs.nixpkgs.lib.nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs self unstablePkgs;
    };

    modules = [
      self.nixosModules.nix-laptop-hardware
      self.nixosModules.meta
      self.nixosModules.core-boot
      self.nixosModules.core-system
      self.nixosModules.core-users
      self.nixosModules.networking-base
      self.nixosModules.services-audio
      self.nixosModules.services-bluetooth
      self.nixosModules.services-docker
      self.nixosModules.services-ssh
      self.nixosModules.desktop-hyprland
      self.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      ({ config, pkgs, unstablePkgs, ... }: let
        dendriticPkgs = self.packages.${pkgs.system};
      in {
        mySystem.meta = {
          host = "nix-laptop";
          user = "ioplock";
          stateVersion = "25.05";
          homeStateVersion = "25.05";
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs self;
          };
          users.${config.mySystem.meta.user} = {
            imports = [ self.homeManagerModules.apps-spicetify ];
            stylix.targets.spicetify.enable = false;
            home = {
              username = config.mySystem.meta.user;
              homeDirectory = "/home/${config.mySystem.meta.user}";
              stateVersion = config.mySystem.meta.homeStateVersion;
            };
          };
        };

        environment.systemPackages =
          (with dendriticPkgs; [
            myNvim
            myGhostty
            myWaybar
            myWofi
            myYazi
            myHyprland
            myHyprlock
            myHypridle
            myHyprpaper
            mySwaync
            touchmk
            magicf
          ])
          ++ (with pkgs; [
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
            bc
            playerctl
            cliphist
            wl-clipboard
            brightnessctl
            grimblast
            hyprpicker
            udisks
            ntfs3g
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
            lavat
            termdown
            libnotify
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
            fzf
            zoxide
            python311
            uv
            nodejs_24
            yarn-berry
            bemoji
            libreoffice
            papirus-icon-theme
            pcmanfm-qt
            networkmanagerapplet
          ])
          ++ (with unstablePkgs; [
            opencode
            quickshell
          ]);

        environment.sessionVariables = {
          EDITOR = "nvim";
          SAL_USE_VCLPLUGIN = "gtk3";
        };

        programs.git.enable = true;

        environment.etc."gitconfig".text = ''
          [user]
            name = Ioplock
            email = ioplock.me@gmail.com
        '';
      })
    ];
  };

  flake.homeConfigurations.nix-laptop = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    extraSpecialArgs = {
      inherit inputs self;
    };

    modules = [
      self.homeManagerModules.apps-spicetify
      {
        home = {
          username = "ioplock";
          homeDirectory = "/home/ioplock";
          stateVersion = "25.05";
        };
      }
    ];
  };
}
