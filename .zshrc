#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ ! -f ${ZDOTDIR:-${HOME}}/.antidote/antidote.zsh ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-${HOME}}/.antidote
fi

source ~/.antidote/antidote.zsh
antidote load

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Export section
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'


# Required due to GTK 4.20 breaking dead keys (~^ etc). Look up a better fix
# Relevant: https://github.com/ghostty-org/ghostty/discussions/8899
export GTK_IM_MODULE=simple


# configuring plugins
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
export ZVM_VI_SURROUND_BINDKEY=s-prefix
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZVM_VI_EDITOR="$EDITOR"
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

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
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[4~'   end-of-line        # Linux console
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey "^[^?" backward-kill-dir # alt+backspace

# fzf
export FZF_CTRL_T_COMMAND="fdfind . ~/ -u"
eval "$(fzf --zsh)"

# atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
    bindkey '^r' atuin-search
  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"


# tmux
alias tat='([ -s ~/.tmux/resurrect/last ] || (find ~/.local/share/tmux/resurrect/ -size 0 -print -delete && ln -sf $(ls -t ~/.local/share/tmux/resurrect/tmux_resurrect_* | head -1) ~/.local/share/tmux/resurrect/last)) && tmux attach'
if [[ -z $TMUX ]]; then
    echo "Not in TMUX session, attaching"
    tat
    if [ $? != 0 ]; then
        echo "attaching failed, restoring sessions"
        tmux 
    fi
fi

