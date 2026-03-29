{ ... }: {
  flake.wrappers.myHyprlock = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.hyprlock;

    config.flags."--config" = pkgs.writeText "hyprlock.conf" ''
      general {
        hide_cursor = true
        ignore_empty_input = true
        immediate_render = false
        text_trim = true
        fractional_scaling = 2
        screencopy_mode = 0
        fail_timeout = 2000
      }

      auth {
        pam {
          enabled = true
          module = hyprlock
        }
      }

      background {
        monitor =
        path = screenshot
        blur_passes = 2
        blur_size = 8
      }

      animations {
        enabled = true
      }

      input-field {
        monitor =
        size = 300, 60
        outline_thickness = 4
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = rgb(cdd6f4)
        inner_color = rgb(1e1e2e)
        font_family = JetBrains Mono
        font_color = rgb(cdd6f4)
        fade_on_empty = false
        placeholder_text = <span><i>Logged in as </i><span>$USER</span></span>
        hide_input = false
        check_color = rgb(cdd6f4)
        fail_color = rgb(f38ba8)
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
        capslock_color = rgb(fab387)
        swap_font_color = true
        position = 0, -47
        halign = center
        valign = center
      }

      label {
        monitor =
        text = $TIME
        color = rgb(cdd6f4)
        font_size = 90
        font_family = JetBrains Mono
        position = -30, 0
        halign = right
        valign = top
      }

      label {
        monitor =
        text = cmd[update:43200000] date +"%A, %d %B %Y"
        color = rgb(cdd6f4)
        font_size = 25
        font_family = JetBrains Mono
        position = -30, -150
        halign = right
        valign = top
      }
    '';
  };
}
