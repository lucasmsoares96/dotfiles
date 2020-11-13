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
