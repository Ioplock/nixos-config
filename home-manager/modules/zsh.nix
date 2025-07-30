{
  programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		initExtra = ''
			# Start UWSM
      if uwsm check may-start > /dev/null; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    '';
	};
}
