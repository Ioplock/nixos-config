{ config, lib, pkgs, user, ... }:

let
  cfg = config.mySystem.core.users;
in {
  options.mySystem.core.users.enable = lib.mkEnableOption "user accounts";

  config = lib.mkIf cfg.enable {
    environment.shells = with pkgs; [ bash zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" "docker" ];
      linger = true;
    };
  };
}
