{ config, lib, ... }:

let
  cfg = config.myHome.editors.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.nixvim.plugins.markdown-preview = {
      enable = true;

      settings = {
        auto_close = 1;
        theme = "dark";
      };
    };
  };
}
