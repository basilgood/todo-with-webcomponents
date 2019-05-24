{ config, options, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestions = {
      enable = true;
      highlightStyle = "fg=241";
    };
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      source ${pkgs.zshPlugins.nix-shell}/nix-shell.plugin.zsh
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      bindkey -e
      bindkey '^P' up-history
      bindkey '^N' down-history
      zmodload zsh/terminfo
      bindkey "$terminfo[kcuu1]" history-substring-search-up
      bindkey "$terminfo[kcud1]" history-substring-search-down
      bindkey '\e[3~' delete-char
      bindkey '^H' vi-backward-kill-word
      bindkey '^w' vi-backward-kill-word
      bindkey '^R' history-incremental-pattern-search-backward
      bindkey '\e[1;5C' vi-forward-word            # C-Right
      bindkey '\e[1;5D' vi-backward-word           # C-Left
      bindkey '\e[5~'   history-search-backward # PgUp
      bindkey '\e[6~'   history-search-forward  # PgDn
      export EDITOR=nvim
      eval `${pkgs.coreutils}/bin/dircolors "${./dircolors}"`
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=yellow,bold'
      alias ..="cd ../"
      stty -ixon
    '';

    promptInit = ''
      function spaceship_nix_shell(){
        if [[ -n "$IN_NIX_SHELL" ]]; then
          spaceship::section "cyan" " nix"
        fi
      }
      export SPACESHIP_PROMPT_ORDER=(
        user          # Username section
        dir           # Current directory section
        host          # Hostname section
        git           # Git section (git_branch + git_status)
        package       # Package version
        node          # Node.js section
        exec_time     # Execution time
        line_sep      # Line break
        jobs          # Background jobs indicator
        exit_code     # Exit code section
        char          # Prompt character
      )
      export SPACESHIP_RPROMPT_ORDER=(
        nix_shell
      )
      autoload -U promptinit select-word-style && promptinit && prompt spaceship
    '';
  };
  environment.systemPackages = with pkgs; [zshThemes.spaceship];
}
