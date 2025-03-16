
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# configuring plugins
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
export ZVM_VI_SURROUND_BINDKEY=s-prefix

zinit cdreplay -q

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

# bindkey -e
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


export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval eval -- "$(/usr/bin/starship init zsh --print-full-init)"

export FZF_CTRL_T_COMMAND="fdfind . ~/ -u"
eval "$(fzf --zsh)"

# atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"
bindkey '^r' atuin-search
# bind -x '"\C-r": __atuin_history'

if [[ -z $TMUX ]]; then
    echo "Not in TMUX session, attaching"
    tmux attach
    if [ $? != 0 ]; then
	echo "attaching failed, restoring sessions"
	tmux 
    fi

fi


