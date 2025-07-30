{
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

      animations = {
        enabled = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 8;
          background_color = "rgba(0, 0, 0, 0.5)";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(235, 219, 178, 1.0)";
          inner_color = "rgba(40, 40, 40, 1.0)";
          font_color = "rgba(235, 219, 178, 1.0)";
          fade_on_empty = false;
          placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password…</span></i>";
          hide_input = false;
          check_color = "rgba(235, 219, 178, 1.0)";
          fail_color = "rgba(204, 34, 34, 1.0)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgba(250, 189, 47, 1.0)";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(235, 219, 178, 1.0)";
          font_size = 90;
          font_family = "JetBrains Mono";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = "rgba(235, 219, 178, 1.0)";
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