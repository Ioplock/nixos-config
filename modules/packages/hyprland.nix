{ self, ... }: {
  flake.wrappers.myHyprland = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.hyprland;

    config.flags."--config" = pkgs.writeText "hyprland.conf" ''
      env = NIXOS_OZONE_WL,1
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = QT_QPA_PLATFORM,wayland
      env = XDG_SCREENSHOTS_DIR,$HOME/screens

      monitor = ,1920x1080@60,auto,1

      $mainMod = SUPER
      $terminal = ${self.packages.${pkgs.system}.myGhostty}/bin/ghostty --gtk-single-instance=true
      $fileManager = ${self.packages.${pkgs.system}.myGhostty}/bin/ghostty --gtk-single-instance=true -e ${self.packages.${pkgs.system}.myYazi}/bin/yazi
      $menu = ${self.packages.${pkgs.system}.myWofi}/bin/wofi

      exec-once = ${self.packages.${pkgs.system}.myWaybar}/bin/waybar
      exec-once = ${self.packages.${pkgs.system}.myHyprpaper}/bin/hyprpaper
      exec-once = ${self.packages.${pkgs.system}.myHypridle}/bin/hypridle
      exec-once = ${self.packages.${pkgs.system}.mySwaync}/bin/swaync
      exec-once = ${self.packages.${pkgs.system}.myHyprlock}/bin/hyprlock || ${pkgs.hyprland}/bin/hyprctl dispatch exit
      exec-once = ${self.packages.${pkgs.system}.myGhostty}/bin/ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false
      exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store
      exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store

      general {
        gaps_in = 0
        gaps_out = 0
        border_size = 1
        col.active_border = rgb(cdd6f4)
        col.inactive_border = rgb(45475a)
        resize_on_border = true
        allow_tearing = false
        layout = master
      }

      decoration {
        rounding = 5
        active_opacity = 1.0
        inactive_opacity = 1.0

        shadow {
          enabled = false
        }

        blur {
          enabled = false
        }
      }

      animations {
        enabled = false
      }

      input {
        kb_layout = us,ru
        kb_options = grp:caps_toggle
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_invert = false
        workspace_swipe_forever = true
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      master {
        new_status = slave
        new_on_top = true
        mfact = 0.5
      }

      misc {
        force_default_wallpaper = 0
        disable_hyprland_logo = true
      }

      bind = $mainMod SHIFT, Return, exec, $terminal
      bind = $mainMod SHIFT, C, killactive
      bind = $mainMod SHIFT, Q, exit
      bind = $mainMod, R, exec, $fileManager
      bind = $mainMod, F, togglefloating
      bind = $mainMod SHIFT, F, fullscreen, 1
      bind = $mainMod, D, exec, $menu --show drun
      bind = $mainMod, P, pin
      bind = $mainMod, J, togglesplit
      bind = $mainMod, E, exec, ${pkgs.bemoji}/bin/bemoji -cn
      bind = $mainMod, V, exec, ${pkgs.cliphist}/bin/cliphist list | $menu --dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy
      bind = $mainMod, B, exec, ${pkgs.procps}/bin/pkill -SIGUSR2 waybar
      bind = $mainMod SHIFT, B, exec, ${pkgs.procps}/bin/pkill -SIGUSR1 waybar
      bind = $mainMod, L, exec, ${pkgs.systemd}/bin/loginctl lock-session
      bind = $mainMod, P, exec, ${pkgs.hyprpicker}/bin/hyprpicker -an
      bind = $mainMod, N, exec, swaync-client -t
      bind = , Print, exec, ${pkgs.grimblast}/bin/grimblast --notify --freeze copysave area

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $mainMod SHIFT, left, swapwindow, l
      bind = $mainMod SHIFT, right, swapwindow, r
      bind = $mainMod SHIFT, up, swapwindow, u
      bind = $mainMod SHIFT, down, swapwindow, d

      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bindel = , XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = , XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = , XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = , XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = $mainMod, bracketright, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%+
      bindel = $mainMod, bracketleft, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%-

      bindl = , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next
      bindl = , XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause
      bindl = , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
      bindl = , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous
    '';
  };
}
