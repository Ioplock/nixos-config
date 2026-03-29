{ ... }: {
  flake.wrappers.myZsh = { config, wlib, pkgs, ... }: {
    imports = [ wlib.modules.default ];

    config.package = pkgs.zsh;

    config.env.ZDOTDIR = toString (pkgs.runCommandLocal "zsh-zdotdir" { } ''
      mkdir -p "$out"
      cat > "$out/.zshrc" <<'ZSHRC'
      autoload -Uz compinit && compinit

      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      HISTFILE=~/.zsh_history
      HISTSIZE=10000
      SAVEHIST=10000
      setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

      alias writer='soffice --writer'
      alias calc='soffice --calc'
      alias impress='soffice --impress'
      alias ls='eza --icons=always'
      alias ll='eza --icons=always -l'
      alias la='eza --icons=always -la'
      alias tree='eza --icons=always --tree'
      alias cd='z'
      alias cdi='zi'
      alias term-clock="termdown -f larry3d -z -Z '%H:%M'"
      alias nrsf='cd ~/nixos-config && sudo nixos-rebuild switch --flake .#nix-laptop'

      if uwsm check may-start > /dev/null 2>&1; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
      ZSHRC
    '');
  };
}
