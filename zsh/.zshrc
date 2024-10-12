if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$HOME/.bin

export ZSH="/home/tushchen/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

alias cat='batcat'
alias clean='rm -rf ~/.cache ~/.local ~/.zcompdump* ~/.wget-hsts ; source ~/.zshrc ; cls'
alias clip='clip.exe'
alias cls='tput reset'
alias ls='lsd'

export EDITOR='nvim'
export LESSHISTFILE=-

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
