#!/bin/sh
current=$(tmux show -gv @theme 2>/dev/null)

if [ "$current" = "light" ]; then
  tmux source-file "$HOME/.config/tmux/themes/catppuccin-mocha.conf"
  tmux set -g @theme "dark"
  tmux display-message "theme: catppuccin mocha"
else
  tmux source-file "$HOME/.config/tmux/themes/rose-pine-dawn.conf"
  tmux set -g @theme "light"
  tmux display-message "theme: rose pine dawn"
fi
