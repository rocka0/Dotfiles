if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$HOME/.local/bin

export ZSH="/home/tushie/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_BASE=$HOME/packages/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
plugins=(git nvm fzf)

source $ZSH/oh-my-zsh.sh

alias bc='bat cache --build'
alias cat='bat'
alias clip='xclip -sel c'
alias cls='tput reset'
alias fd='fdfind'
alias lgin="curl 'http://172.16.0.30:8090/login.xml' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.9' -H 'Connection: keep-alive' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: http://172.16.0.30:8090' -H 'Referer: http://172.16.0.30:8090/' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36' --data-raw 'mode=191&username=REDACTED&password=REDACTED&a=$(date +%s%3N)&producttype=0' --compressed --insecure"
alias ls='lsd'

export EDITOR='nvim'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
