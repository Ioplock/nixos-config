{ config, lib, ... }:

let
  cfg = config.myHome.editors.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.nixvim.plugins.web-devicons = {
      enable = true;
    };
  };
}
