{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    colorschemes.catppuccin.enable = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    opts = import ./options.nix;
  };

}
