{config, ...}: let
  inherit (config.lib.stylix.colors) base00 base01 base02 base05 base08 base09 base0A;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        immediate_render = false;
        text_trim = true;
        fractional_scaling = 2;
        screencopy_mode = 0;
        fail_timeout = 2000;
      };

      auth = {
        pam = {
          enabled = true;
          module = "hyprlock";
        };
        fingerprint = {
          enabled = false;
          ready_message = "(Scan fingerprint to unlock)";
          present_message = "Scanning fingerprint";
          retry_delay = 250;
        };
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 8;
        }
      ];

      animations = {
        enabled = true;
      };

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(${base05})";
          inner_color = "rgb(${base00})";
          font_family = "JetBrains Mono";
          font_color = "rgb(${base05})";
          fade_on_empty = false;
          placeholder_text = "<span><i>Logged in as </i><span>$USER</span></span>";
          hide_input = false;
          check_color = "rgb(${base05})";
          fail_color = "rgb(${base08})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgba(${base09}ff)";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgb(${base05})";
          font_size = 90;
          font_family = "JetBrains Mono";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = "rgb(${base05})";
          font_size = 25;
          font_family = "JetBrains Mono";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}