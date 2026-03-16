{ config, lib, ... }:

let
  cfg = config.mySystem.services.ssh;
in {
  options.mySystem.services.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;

    services.openssh = {
      enable = true;
      ports = [ 22 ];
    };
  };
}
