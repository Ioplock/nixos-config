{ config, lib, ... }:

let
  cfg = config.myHome.dev.git;
in {
  options.myHome.dev.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Ioplock";
      userEmail = "ioplock.me@gmail.com";
    };
  };
}
