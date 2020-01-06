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

        [ $jobsval -ne 0 ] && prompt_end+=" $bold$cyan$jobsval$reset"
        prompt_end+="\n"
        [ $(id -u) -eq 0 ] && prompt_end+="\[$red\]#" || prompt_end+="\[$magenta\]❯"
        prompt_end+="\[$reset\] "

        if type -t __git_ps1 > /dev/null 2>&1 ; then
          __git_ps1 "$prompt" "$prompt_end"
        else
          PS1="$prompt $prompt_end"
        fi
        history -a
      }
      PROMPT_COMMAND=prompt_command
    '';
    interactiveShellInit = ''
      HISTFILE=$HOME/.bash_history
      HISTFILESIZE=-1
      HISTSIZE=''${HISTFILESIZE}
      HISTCONTROL="erasedups:ignoreboth"
      HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:?:??"

      # Words are separated using space
      WORDCHARS='''

      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'

      # tab complete
      bind '"\t": menu-complete'
      bind '"\e[Z": menu-complete-backward'

      bind '"\e[M": kill-word'
      bind '"\C-h": backward-kill-word'

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
      bind "set echo-control-characters off"

      # Toggle backgrounding with <C-z>
      stty susp undef
      bind '"\C-z":"fg > /dev/null\015"'

      # Save multi-line commands as one command
      shopt -s cmdhist

      # Do not overwrite history file
      shopt -s histappend

      # Automatically add  cd  when entering a path by itself
      shopt -s autocd 2> /dev/null

      # Correct spelling errors
      shopt -s dirspell 2> /dev/null
      shopt -s cdspell 2> /dev/null

      # More globbing options!
      shopt -s globstar 2> /dev/null
      shopt -s extglob

      # Case-insensitive globbing (used in pathname expansion)
      shopt -s nocaseglob

      # Update window size after every command
      shopt -s checkwinsize

      PROMPT_DIRTRIM=3

      eval `${pkgs.coreutils}/bin/dircolors "${./dircolors}"`

      stty -ixon
    '';
  };
}
