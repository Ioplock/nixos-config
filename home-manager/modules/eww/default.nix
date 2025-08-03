{ pkgs, ... }: {

  home.packages = with pkgs; [
    eww
  ];

  programs.eww = {
    enable = true;
    configDir = ./config;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
