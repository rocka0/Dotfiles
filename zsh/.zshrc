if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$HOME/.local/bin

export ZSH="/home/tushie/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
plugins=(git nvm fzf)

source $ZSH/oh-my-zsh.sh

alias cat='bat'
alias clip='clip.exe'
alias cls='tput reset'
alias ls='lsd'

export EDITOR='nvim'
export LESSHISTFILE=-

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
