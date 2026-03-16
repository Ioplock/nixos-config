{ config, lib, ... }:

let
  cfg = config.mySystem.services.audio;
in {
  options.mySystem.services.audio.enable = lib.mkEnableOption "audio";

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
