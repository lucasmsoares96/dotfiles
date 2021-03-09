# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucas/.zshrc'

autoload -Uz compinit
compinit

PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/home/lucas/Android/Sdk/emulator"
export PATH="$PATH:/home/lucas/.gem/ruby/2.7.0/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lucas/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lucas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lucas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lucas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
alias ls='exa -las type'
alias cat='bat'
