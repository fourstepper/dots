# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Wayland + virt-viewer
xhost + &> /dev/null

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1

# Export kubeconfig to rpis
export KUBECONFIG=~/.kube/rpi-cluster-k3s/config

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Command auto-correction.
ENABLE_CORRECTION="true"

# ZSH plugins
plugins=(git rsync brew osx colored-man-pages kubectl)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

#Alias ssh for logs to the following command
# Source zsh with zshreload
alias zshreload="source ~/.zshrc"
alias ytdlbestmp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias ans='cd ~/Documents/Programming/Personal/ansible'
# Configure vim = nvim + v = nvim 
alias vim="nvim"
alias v="nvim"
# Kitty aliases
alias code="~/Documents/Programming"
alias h="history -20"
alias tree='exa --tree'
alias search='rg --files --hidden --no-messages --no-ignore-vcs | fzf'
alias mpvplaylist='mpv * "$@" &> /dev/null & disown'

alias dots="cd ~/.dotfiles/dots/"

# Navigating the FS
alias exthdd="cd /run/media/robinopletal/cea2d37b-4ec8-4161-91e3-785ae362e0ab/personalStuff"
alias inthdd="cd /run/media/robinopletal/InternalHDD1"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /home/robinopletal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
