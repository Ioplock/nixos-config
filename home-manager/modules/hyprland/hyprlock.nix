{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = false;
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
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 4;
          dots_size = 0.25;
          dots_spacing = 0.15;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgba(17, 17, 17, 1.0)";
          inner_color = "rgba(200, 200, 200, 1.0)";
          font_color = "rgba(10, 10, 10, 1.0)";
          font_family = "JetBrains Mono";
          fade_on_empty = true;
          fade_timeout = 2000;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          hide_input_base_color = "rgba(153, 170, 187, 1.0)";
          rounding = -1;
          check_color = "rgba(204, 136, 34, 1.0)";
          fail_color = "rgba(204, 34, 34, 1.0)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 0;
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