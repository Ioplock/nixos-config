{ ... }: {
  flake.nixosModules.meta = { config, lib, ... }: {
    options.mySystem.meta = {
      host = lib.mkOption {
        type = lib.types.str;
        description = "Host name for the current machine.";
      };
      user = lib.mkOption {
        type = lib.types.str;
        description = "Primary user name.";
      };
      stateVersion = lib.mkOption {
        type = lib.types.str;
        description = "NixOS state version.";
      };
      homeStateVersion = lib.mkOption {
        type = lib.types.str;
        description = "Home Manager state version.";
      };
    };

    config = {
      networking.hostName = config.mySystem.meta.host;
      system.stateVersion = config.mySystem.meta.stateVersion;
    };
  };
}
