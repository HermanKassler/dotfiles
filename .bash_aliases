#!/bin/zsh
#------------------GIT------------------
alias gitcam='git commit -a -m '
alias gits='git status'
alias gitA='git add -A'
alias gitp='git push'
alias gitc='git commit'
alias dotcam='git -C ~/dotfiles commit -a -m '
alias dotp='git -C ~/dotfiles push'
alias gl='git log --graph --abbrev-commit --decorate --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'\'' --all'
alias lg='lazygit'

#------------------NVIM------------------
alias v='nvim'
alias v.='nvim .'
alias dvim='nvim .'
alias cdconfig='cd ~/.config/nvim'
alias vdot='nvim ~/dotfiles/'

#------------------TMUX------------------
alias tls='tmux ls'
alias tas='tmux attach -t'
alias ta='tmux attach'
alias td='tmux detach'


#------------------SSH------------------
alias sshkth='ssh toreste@staff-shell.sys.kth.se'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#-----------------CLIs/Related------------
alias neofetch='fastfetch'
alias pbcopy='xclip -selection clipboard'
alias dircp='pwd | pbcopy'
alias hist='$(bat ~/.bash_history | fzf)'

function zopen(){
    zathura $1 &
}

#------------------Movement------------------
alias cdkth='cd ~/Documents/kth'
alias cddot='cd ~/dotfiles'
alias ..='cd ..'

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

function fda() {
    local dirname
    dirname=$(fdfind . / -t d -H| fzf --preview "$show_file_or_dir_preview") || return
    cd "$dirname"
}

alias fivm='fvim'
alias fv='fvim'
function fvim() {
    local dirname
    dirname=$(fdfind . ~/ -H| fzf --preview "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}

function fva() {
    local dirname
    dirname=$(fdfind . / -H| fzf --preview "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}

function fvimd() {
    local dirname
    dirname=$(fdfind . ./ -H| fzf --preview  "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}


# styling
function gruvbox() {
    local names 
    names=("bg_h" "bg" "bg1" "bg2" "bg3" "bg4" "fg" "fg1" "fg2" "fg3" "fg4" "red" "green" "yellow" "blue" "purple" "aqua" "gray" "orange" "red-dim" "green-dim" "yellow-dim" "blue-dim" "purple-dim" "aqua-dim" "gray-dim" "orange-dim")
    local colors 
    colors=( "#1d2021" "#282828" "#3c3836" "#504945" "#665c54" "#7c6f64" "#fbf1c7" "#ebdbb2" "#d5c4a1" "#bdae93" "#a89984" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#928374" "#fe8019" "#cc2412" "#98971a" "#d79921" "#458588" "#b16286" "#689d6a" "#a89984" "#d65d0e")

    for ((i=1; i <= $#names; i++)) print -P "%K{${colors[$i]}} %F{#000000} ${names[$i]} - ${colors[$i]}"

    # for i in ${seq 0 ${#names}}
    # do
    #     echo "${names[$i]} ${colors[$i]}"
    # done
}
