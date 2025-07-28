{ config, pkgs, ... }:
let

  myAliases = {
    rebuild-nixos = "sudo nixos-rebuild switch --flake ~/nix/.";
    rebuild-hm = "home-manager switch --flake ~/nix/.";
    ll = "ls -l";
    ".." = "cd ..";
  };

in {
	home = {
		username = "ioplock";
		homeDirectory = "/home/ioplock";
		stateVersion = "25.05";

		packages = with pkgs; [
			neofetch
			htop
			inxi
		];
	};
	
	programs.bash = {
		enable = true;
		shellAliases = myAliases;
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = myAliases;
	};

	programs.git = {
		enable = true;
		userName = "Ioplock";
		userEmail = "ioplock.me@gmail.com";
	};
}
