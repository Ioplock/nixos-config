{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  mySystem = {
    core = {
      boot.enable = true;
      system.enable = true;
      users.enable = true;
    };
    networking.base.enable = true;
    services = {
      audio.enable = true;
      bluetooth.enable = true;
      docker.enable = true;
      ssh.enable = true;
    };
    desktop.hyprland.enable = true;
  };
}
