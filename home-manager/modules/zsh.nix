{
  programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ls = "eza --icons=always";
			ll = "eza --icons=always -l";
			la = "eza --icons=always -la";
			tree = "eza --icons=always --tree";
			term-clock = "termdown -f larry3d -z -Z '%H:%M'";
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
