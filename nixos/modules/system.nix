{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    wget
    kitty
    home-manager
  ];

  system.stateVersion = "25.05";
} 