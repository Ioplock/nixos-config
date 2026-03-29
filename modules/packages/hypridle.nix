{ self, ... }: {
  flake.wrappers.myHypridle = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.hypridle;

    config.flags."--config" = pkgs.writeText "hypridle.conf" ''
      general {
        before_sleep_cmd = ${pkgs.systemd}/bin/loginctl lock-session
        after_sleep_cmd = ${pkgs.hyprland}/bin/hyprctl dispatch dpms on
        ignore_dbus_inhibit = false
        lock_cmd = ${pkgs.procps}/bin/pidof hyprlock || ${self.packages.${pkgs.system}.myHyprlock}/bin/hyprlock
      }

      listener {
        timeout = 180
        on-timeout = ${pkgs.brightnessctl}/bin/brightnessctl -s set 30
        on-resume = ${pkgs.brightnessctl}/bin/brightnessctl -r
      }

      listener {
        timeout = 300
        on-timeout = ${pkgs.systemd}/bin/loginctl lock-session
      }

      listener {
        timeout = 600
        on-timeout = ${pkgs.hyprland}/bin/hyprctl dispatch dpms off
        on-resume = ${pkgs.hyprland}/bin/hyprctl dispatch dpms on
      }

      listener {
        timeout = 1200
        on-timeout = ${pkgs.systemd}/bin/systemctl suspend
      }
    '';
  };
}
