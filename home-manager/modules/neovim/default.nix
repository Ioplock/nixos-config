{ inputs, pkgs, ... }: {

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./theme.nix
  ];
  
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

}
