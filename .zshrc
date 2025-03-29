#!/bin/zsh
# tmux
if [[ -z $TMUX ]]; then
    echo "Not in TMUX session, attaching"
    tmux attach
    if [ $? != 0 ]; then
	echo "attaching failed, restoring sessions"
	tmux 
    fi
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export VISUAL=nvim
export EDITOR="$VISUAL"
#
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
zinit light romkatv/powerlevel10k

# configuring plugins
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
export ZVM_VI_SURROUND_BINDKEY=s-prefix
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zinit cdreplay -q

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
alias ls='ls --color'

# keybinds
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[1;5C" forward-word # ctrl-right
bindkey "^[[1;5D" backward-word # ctrl left
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey "^[^?" backward-kill-dir # alt+backspace


# # starship 
# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(/usr/bin/starship init zsh --print-full-init)"

# fzf
export FZF_CTRL_T_COMMAND="fdfind . ~/ -u"
eval "$(fzf --zsh)"

# atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"
#
# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
    bindkey '^r' atuin-search
  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
