#------------------GIT------------------
alias gitcam='git commit -a -m '
alias gits='git status'
alias gitA='git add -A'
alias gitp='git push'
alias gitc='git commit'
alias dotcam='git -C ~/dotfiles commit -a -m '
alias dotp='git -C ~/dotfiles push'

#------------------NVIM------------------
alias v='nvim'
alias v.='nvim .'
alias dvim='nvim .'
alias cdconfig='cd ~/.config/nvim'

#------------------SSH------------------
alias sshkth='ssh toreste@staff-shell.sys.kth.se'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#------------------OTHER------------------
alias pbcopy='xclip -selection clipboard'
alias dircp='pwd | pbcopy'
alias cddot='cd ~/dotfiles'
alias ..='cd ..'
alias cdkth='cd ~/Documents/kth'
alias hist='$(bat ~/.bash_history | fzf)'
alias ta='tmux attach'
alias td='tmux detach'

show_file_or_dir_preview="if [ -d {} ]; then eza --color=always {} | head -200; else bat --color=always --theme gruvbox-dark --line-range :500 {};fi"
function fd() {
    local dirname
    dirname=$(fdfind . ~/ -t d -H| fzf --preview "$show_file_or_dir_preview" ) || return
    cd "$dirname"
}

function fdd() {
    local dirname
    dirname=$(fdfind . ./ -t d -H| fzf --preview "$show_file_or_dir_preview") || return
    cd "$dirname"
}

alias fivm='fvim'
alias fv='fvim'
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


