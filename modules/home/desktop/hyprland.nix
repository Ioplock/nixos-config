{ config, lib, ... }:

let
  cfg = config.myHome.desktop.hyprland;
  inherit (config.lib.stylix.colors) base03 base07;
in {
  options.myHome.desktop.hyprland.enable = lib.mkEnableOption "Hyprland";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      settings = {
        env = [
          "NIXOS_OZONE_WL,1"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "QT_QPA_PLATFORM,wayland"
          "XDG_SCREENSHOTS_DIR,$HOME/screens"
        ];

        monitor = ",1920x1080@60,auto,1";
        "$mainMod" = "SUPER";
        "$terminal" = "ghostty --gtk-single-instance=true";
        "$fileManager" = "$terminal -e sh -c 'yazi'";
        "$menu" = "wofi";

        exec-once = [
          "waybar"
          "hyprlock || hyprctl dispatch exit"
          "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 1;
          "col.active_border" = "rgb(${base07})";
          "col.inactive_border" = "rgb(${base03})";
          resize_on_border = true;
          allow_tearing = false;
          layout = "master";
        };

        decoration = {
          rounding = 5;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = false;
          };
          blur = {
            enabled = false;
          };
        };

        animations = {
          enabled = false;
        };

        input = {
          kb_layout = "us,ru";
          kb_options = "grp:caps_toggle";
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_invert = false;
          workspace_swipe_forever = true;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "slave";
          new_on_top = true;
          mfact = 0.5;
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        bind = [
          "$mainMod SHIFT, Return, exec, $terminal"
          "$mainMod SHIFT, C, killactive,"
          "$mainMod SHIFT, Q, exit,"
          "$mainMod,       R, exec, $fileManager"
          "$mainMod,       F, togglefloating,"
          "$mainMod SHIFT, F, fullscreen, 1"
          "$mainMod,       D, exec, $menu --show drun"
          "$mainMod,       P, pin,"
          "$mainMod,       J, togglesplit,"
          "$mainMod,       E, exec, bemoji -cn"
          "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
          "$mainMod,       B, exec, pkill -SIGUSR2 waybar"
          "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar"
          "$mainMod,       L, exec, loginctl lock-session"
          "$mainMod,       P, exec, hyprpicker -an"
          "$mainMod,       N, exec, swaync-client -t"
          ", Print, exec, grimblast --notify --freeze copysave area"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod SHIFT, left,  swapwindow, l"
          "$mainMod SHIFT, right, swapwindow, r"
          "$mainMod SHIFT, up,    swapwindow, u"
          "$mainMod SHIFT, down,  swapwindow, d"

          "$mainMod CTRL, left,  resizeactive, -60 0"
          "$mainMod CTRL, right, resizeactive,  60 0"
          "$mainMod CTRL, up,    resizeactive,  0 -60"
          "$mainMod CTRL, down,  resizeactive,  0  60"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

          "$mainMod,       S, togglespecialworkspace,  magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
          ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          "$mainMod, bracketright, exec, brightnessctl s 10%+"
          "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
        ];

        bindl = [
          ", XF86AudioNext,  exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay,  exec, playerctl play-pause"
          ", XF86AudioPrev,  exec, playerctl previous"
        ];
      };
    };
  };
}
