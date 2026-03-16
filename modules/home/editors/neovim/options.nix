{ config, lib, ... }:

let
  cfg = config.myHome.editors.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      opts = {
        number = true;
        relativenumber = true;
        tabstop = 2;
        softtabstop = 2;
        showtabline = 2;
        expandtab = true;
        smartindent = true;
        shiftwidth = 2;
        breakindent = true;
        cursorline = true;
        scrolloff = 8;
        mouse = "a";
        foldmethod = "manual";
        foldenable = false;
        linebreak = true;
        spell = false;
        swapfile = false;
        timeoutlen = 300;
        termguicolors = true;
        showmode = false;
        splitbelow = true;
        splitkeep = "screen";
        splitright = true;
        cmdheight = 0;
        fillchars = {
          eob = " ";
        };
      };
    };
  };
}
