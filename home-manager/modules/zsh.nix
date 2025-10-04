{
  programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			# Aliases for office suite
			writer = "soffice --writer";
			calc = "soffice --calc";
			impress = "soffice --impress";
			# Replacing default cmds with better ones
			ls = "eza --icons=always";
			ll = "eza --icons=always -l";
			la = "eza --icons=always -la";
			tree = "eza --icons=always --tree";
			cd = "z";
			cdi = "zi";
			# Shortcuts
			term-clock = "termdown -f larry3d -z -Z '%H:%M'";
			nrsf = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#nix-laptop";
			hmsf = "cd ~/nixos-config && home-manager switch --flake .";
		};

		history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
			ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
			];
			theme = "clean";
		};

		initContent = ''
			# Start UWSM
			if uwsm check may-start > /dev/null; then
				exec systemd-cat -t uwsm_start uwsm start default
			fi
		'';
	};
}
