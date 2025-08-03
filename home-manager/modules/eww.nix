{ pkgs, ... }: {

  home.packages = with pkgs; [
    eww
  ];

  programs.eww = {
    enable = true;
    configDir = ./eww/config;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
