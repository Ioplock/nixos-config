{ self, ... }: {
  flake.nixosModules.core-users = { config, pkgs, ... }: {
    environment.shells = [ pkgs.bash pkgs.zsh ];
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      histSize = 10000;
      histFile = "$HOME/.zsh_history";
      setOptions = [
        "HIST_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_IGNORE_SPACE"
      ];
      shellAliases = {
        writer = "soffice --writer";
        calc = "soffice --calc";
        impress = "soffice --impress";
        ls = "eza --icons=always";
        ll = "eza --icons=always -l";
        la = "eza --icons=always -la";
        tree = "eza --icons=always --tree";
        cd = "z";
        cdi = "zi";
        term-clock = "termdown -f larry3d -z -Z '%H:%M'";
        nrsf = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .#nix-laptop";
      };
      interactiveShellInit = ''
        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source ${pkgs.fzf}/share/fzf/key-bindings.zsh
        source ${pkgs.fzf}/share/fzf/completion.zsh
        eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

        if uwsm check may-start > /dev/null 2>&1; then
          exec systemd-cat -t uwsm_start uwsm start default
        fi
      '';
    };

    users.users.${config.mySystem.meta.user} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "input" "networkmanager" "docker" ];
      linger = true;
    };
  };
}
