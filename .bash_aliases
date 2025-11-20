#!/bin/zsh


#------------------KTH------------------
alias compsec="~/bin/docker run -it --rm -v .:/workdir -w /workdir compsec"

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
alias vdot='nvim ~/dotfiles/'
alias öq='echo "not in vim dumbass"'
alias öwq='echo "not in vim dumbass"'

#------------------TMUX------------------
alias tls='tmux ls'
alias tas='tmux attach -t'
alias ta='tmux attach'
alias td='tmux detach'

#------------------SSH------------------
alias sshkth='ssh toreste@staff-shell.sys.kth.se'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias mntkth='sshfs toreste@staff-shell.sys.kth.se ~/Documents/kth/ssh-mnt'

#-----------------CLIs/Related------------
alias neofetch='fastfetch'
alias dircp='pwd | wl-copy'
alias y='yazi'
alias note='v /tmp/scratchpad'
alias top='btop'
alias mntwin='sudo mount /dev/sda3 /mnt/windows'
alias cdwin='cd /mnt/windows/Users/toreg/'
alias mtgn='cd /mnt/windows/Users/toreg/Pictures/Mottagningen\ 25/'
alias notes='nvim ~/Documents/kth/notes/home.md'

function wiki(){
    local pattern=$(fdfind --base-directory /usr/share/doc/arch-wiki/html/en/ -t f --strip-cwd-prefix=always | sed 's/\.[^.]*$//'| fzf ) || return
    local file=$(fdfind . /usr/share/doc/arch-wiki/html/en/ | rg -m 1 $pattern)
    echo "Opening page for $pattern in browser"
    zen-browser "$file"
}

function zopen(){
    zathura $1 &
}

function lcroc(){
    croc relay&
    ip=$( hostname -i )
    croc --relay "$ip:9009" send $1 || killall croc
    killall croc
}

#------------------Movement------------------
alias cdkth='cd ~/Documents/kth'
alias dot='cd ~/dotfiles'
alias ..='cd ..'
alias ../..='cd ../..'

show_file_or_dir_preview="if [ -d {} ]; then tree -L 1 -C --dirsfirst {} | head -200; else bat --color=always --theme gruvbox-dark --line-range :500 {};fi"
# show_file_or_dir_preview="if [ -d {} ]; then eza --color=always {} | head -200; else bat --color=always --theme gruvbox-dark --line-range :500 {};fi"
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

alias fvd='fvimd'
function fvimd() {
    local dirname
    dirname=$(fdfind . ./ -H| fzf --preview  "$show_file_or_dir_preview" -m --preview-window '~3') || return
    nvim "$dirname"
}


