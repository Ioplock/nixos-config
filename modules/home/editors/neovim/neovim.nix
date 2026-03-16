{ config, lib, inputs, pkgs, ... }:

let
  cfg = config.myHome.editors.neovim;
in {
  options.myHome.editors.neovim.enable = lib.mkEnableOption "neovim";

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./theme.nix
    ./plugins
  ];

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.nixvim = {
      enable = true;

      defaultEditor = true;
      nixpkgs.useGlobalPackages = true;

      viAlias = true;
      vimAlias = true;

      luaLoader.enable = true;
    };
  };
}
