{ ... }: {
  flake.nixosModules.networking-base = { ... }: {
    networking = {
      networkmanager.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [ 22 80 5432 8080 27017 ];
      };
    };

    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";
  };
}
