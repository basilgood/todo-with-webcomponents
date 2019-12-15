{ config, options, lib, pkgs, ... }: {
  programs.bash = {
    shellAliases = {
      grep = "grep --color=auto";
      hid =
        "${pkgs.gawk}/bin/gawk -i inplace '!a[$0]++' $HISTFILE; ${pkgs.gnused}/bin/sed -i 's/[[:space:]]*$//' $HISTFILE";
    };
    promptInit = ''
      GIT_PS1_SHOWUNTRACKEDFILES=1
      GIT_PS1_SHOWUPSTREAM="auto"
      GIT_PS1_SHOWCOLORHINTS=1
      GIT_PS1_SHOWDIRTYSTATE=1
      bold=$(tput bold)
      red=$(tput setaf 1)
      yellow=$(tput setaf 3)
      cyan=$(tput setaf 6)
      magenta=$(tput setaf 5)
      reset=$(tput sgr0)
      prompt_command(){
        local retval="''${?#0}"
        local prompt="\n"
        local prompt_end=""
        local jobsval=`jobs -p | wc -l`
        [ -n "$retval" ] && prompt+="$red$retval$reset "
        [ -n "$IN_NIX_SHELL" ] && prompt+="$cyan $reset "
        prompt+="$bold$yellow\w$reset"
        [ $jobsval -ne 0 ] && prompt_end+=" $jobsval"
        prompt_end+="\n"
        [ $(id -u) -eq 0 ] && prompt_end+="\[$red\]#\[$reset\]" || prompt_end+="\[$magenta\]❯\[$reset\]"
        __git_ps1 "$prompt" "$prompt_end "
        history -a
      }
      PROMPT_COMMAND=prompt_command
    '';
    interactiveShellInit = ''
      PROMPT_DIRTRIM=3
      set -o notify
      shopt -s checkwinsize
      shopt -s globstar 2> /dev/null
      shopt -s nocaseglob;
      shopt -s autocd 2> /dev/null
      shopt -s dirspell 2> /dev/null
      shopt -s cdspell 2> /dev/null
      shopt -s histappend
      shopt -s cmdhist
      bind "set completion-ignore-case on"
      bind "set completion-map-case on"
      bind "set show-all-if-ambiguous on"
      bind "set menu-complete-display-prefix on"
      bind "set mark-symlinked-directories on"
      bind "set colored-stats on"
      bind "set visible-stats on"
      bind "set page-completions off"
      bind "set skip-completed-text on"
      bind "set bell-style none"
      bind '"\t": menu-complete'
      bind '"\e[Z": menu-complete-backward'
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'
      bind '"\e[M": kill-word'
      bind '"\C-h": backward-kill-word'
      HISTFILESIZE=-1
      HISTSIZE=''${HISTFILESIZE}
      HISTCONTROL="erasedups:ignoreboth"
      HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:?:??"

      eval `${pkgs.coreutils}/bin/dircolors "${./dircolors}"`
      source ${pkgs.fzf}/share/fzf/completion.bash
      source ${pkgs.fzf}/share/fzf/key-bindings.bash
      FZF_CTRL_T_OPTS="--preview '${pkgs.bat}/bin/bat --color=always --line-range :500 {}'"
      FZF_DEFAULT_COMMAND='${pkgs.fd}/bin/fd --type f --hidden --follow --exclude .git'

      stty -ixon
    '';
  };
}
