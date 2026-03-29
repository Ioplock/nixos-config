{ self, ... }: {
  flake.nixosModules.desktop-hyprland = { config, pkgs, ... }: let
    wrappedHyprland = self.packages.${pkgs.system}.myHyprland;
  in {
    services.libinput.enable = true;

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = wrappedHyprland;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${wrappedHyprland}/bin/Hyprland > /dev/null 2>&1";
          user = config.mySystem.meta.user;
        };
        default_session = initial_session;
      };
    };
  };
}
