alias dotcam='git -C ~/dotfiles commit -a -m '
alias dotp='git -C ~/dotfiles push'
alias cddot='cd ~/dotfiles'
alias ..='cd ..'
alias cdkth='cd ~/Documents/kth'
alias cdconfig='cd ~/.config/nvim'
alias gits='git status'
alias gitA='git add -A'
alias gitp='git push'
alias sshkth='ssh toreste@staff-shell.sys.kth.se'
alias hist='$(bat ~/.bash_history | fzf)'
alias dvim='nvim .'
alias gitcam='git commit -a -m '
alias ta='tmux attach'
alias td='tmux detach'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

show_file_or_dir_preview="if [ -d {} ]; then eza --color=always {} | head -200; else bat --color=always --theme gruvbox-dark --line-range :500 {};fi"

function fd() {
    local dirname
    dirname=$(fdfind . ~/ -t d -H| fzf --preview "$show_file_or_dir_preview" ) || return
    cd "$dirname"
}

function fdd() {
    local dirname
    dirname=$(fdfind . ./ -t d -H| fzf --previw "$show_file_or_dir_preview") || return
    cd "$dirname"
}

alias fivm='fvim'
function fvim() {
    local dirname
    dirname=$(fdfind . ~/ -H| fzf --preview "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}

function fvimd() {
    local dirname
    dirname=$(fdfind . ./ -H| fzf --preview  "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}


