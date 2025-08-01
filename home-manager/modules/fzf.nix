{ pkgs, ... }: {

  home.packages = with pkgs; [
    fzf # Fuzzy finder
  ];

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}