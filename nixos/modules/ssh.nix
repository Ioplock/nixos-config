{
  # Enable this for vscode-server
  programs.nix-ld.enable = true;

  # Ssh support with default port 22
  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };
};