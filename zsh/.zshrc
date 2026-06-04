eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$HOME/.cache/zcompdump-${HOST}-${ZSH_VERSION}"
export EDITOR='vim'
export VIMINFO="NONE"
export LESSHISTFILE=-

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(fzf)
source $ZSH/oh-my-zsh.sh

alias cat='bat'
alias cls='tput reset'
alias ls='eza --icons --group-directories-first'
alias orb='TERM=xterm-256color orb zsh -l -c "cd ~ && exec zsh"'
alias work='tmux new-session -A -s work'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
