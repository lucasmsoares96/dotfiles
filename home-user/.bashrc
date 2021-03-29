#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
source "$HOME/.cargo/env"

alias ls='exa -las type'
alias cat='bat'

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/lucas/xi-electron/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/lucas/xi-electron/node_modules/tabtab/.completions/electron-forge.bash