{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
} 