{ pkgs, user, ... }:

{
  environment.shells = with pkgs; [ bash zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager", "docker" ]; # Enable 'sudo' for the user.
    linger = true;
  };
} 
