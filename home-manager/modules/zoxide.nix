{ pkgs, ... }: {

  home.packages = with pkgs; [
    zoxide # Better cd
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}