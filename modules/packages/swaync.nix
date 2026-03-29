{ ... }: {
  flake.wrappers.mySwaync = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.swaynotificationcenter;

    config.env.XDG_CONFIG_HOME = toString (pkgs.runCommandLocal "swaync-config-home" { } ''
      mkdir -p "$out/swaync"
      cat > "$out/swaync/config.json" <<'EOF'
      {
        "positionX": "right",
        "positionY": "top",
        "control-center-radius": 1,
        "fit-to-screen": true,
        "layer-shell": true,
        "layer": "overlay",
        "control-center-layer": "overlay",
        "cssPriority": "user",
        "notification-icon-size": 64,
        "notification-body-image-height": 100,
        "notification-body-image-width": 200,
        "timeout": 10,
        "timeout-low": 5,
        "timeout-critical": 0,
        "widgets": [
          "inhibitors",
          "dnd",
          "mpris",
          "notifications"
        ],
        "widget-config": {
          "title": {
            "text": "Notifications",
            "clear-all-button": true,
            "button-text": "Clear All"
          },
          "dnd": {
            "text": "Do Not Disturb"
          },
          "mpris": {
            "image-size": 96,
            "blur": true
          }
        }
      }
      EOF
    '');
  };
}
