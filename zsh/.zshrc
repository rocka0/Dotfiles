if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

alias cat='bat'
alias cls='tput reset'
alias ls='eza'
alias work='tmux new-session -A -s work'

export EDITOR='nvim'
export LESSHISTFILE=-

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
