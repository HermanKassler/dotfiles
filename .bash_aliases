alias dotcam='git -C ~/dotfiles commit -a -m '
alias dotp='git -C ~/dotfiles push'
alias cdkth='cd ~/Documents/kth'
alias gits='git status'
alias gitcam='git commit -a -m '
alias gitA='git add -A'
alias sshkth='ssh toreste@staff-shell.sys.kth.se'
alias hist='cat ~/.bash_history | fzf'

show_file_or_dir_preview="if [ -d {} ]; then eza --color=always {} | head -200; else bat --color=always --line-range :500 {};fi"

function fd() {
    local dirname
    dirname=$(find ~/ -type d | fzf --preview "$show_file_or_dir_preview" ) || return
    cd "$dirname"
}

function fdd() {
    local dirname
    dirname=$(find ./ -type d| fzf --previw "$show_file_or_dir_preview") || return
    cd "$dirname"
}

function fvim() {
    local dirname
    dirname=$(find ~/ | fzf --preview "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}

function fvimd() {
    local dirname
    dirname=$(find ./ | fzf --preview  "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}


