{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./theme.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };

}
