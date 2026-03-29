{ ... }: {
  flake.nixosModules.services-bluetooth = { ... }: {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = true;
  };
}
