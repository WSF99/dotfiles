export ZSH="$HOME/.oh-my-zsh"
pokemon-colorscripts --no-title -s -r

ZSH_THEME="xiong-chiamiov-plus"

plugins=(git zsh-eza zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#fastfetch -c "${PWD}"/config/fastfetch/config.jsonc

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias clear='clear && zsh'
alias fastfetch='fastfetch -c $HOME/.config/fastfetch/config.jsonc'
export PATH="$PATH:/opt/nvim-linux64/bin"

