{ config, lib, ... }:

let
  cfg = config.myHome.editors.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      colorschemes = {
        catppuccin = {
          enable = true;
          settings = {
            background = {
              light = "macchiato";
              dark = "mocha";
            };
            custom_highlights = ''
              function(highlights)
                return {
                  CursorLineNr = { fg = highlights.peach, style = {} },
                  NavicText = { fg = highlights.text },
                }
              end
            '';
            flavour = "macchiato";
            no_bold = false;
            no_italic = false;
            no_underline = false;
            transparent_background = true;
          };
        };
      };
    };
  };
}
