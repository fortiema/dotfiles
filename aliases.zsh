# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# exa
export TIME_STYLE="long-iso"
LS_FLAGS="--all --group-directories-first --sort=name"
alias ls="exa ${LS_FLAGS} --across"
alias ll="exa ${LS_FLAGS} --long --header --binary --created --modified --git --classify"
alias lld="exa -lbhHFGmuSa --group-directories-first"
alias l="ls"
alias tree="ll --tree"

# MacOS
alias f='open -a Finder ./' # Opens current directory in apps
alias netstat="sudo lsof -i -P" # Replace netstat command on macOS to find ports used by apps

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"

# Vim
alias vim='nvim'
alias vi='nvim'
alias v="nvim"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias diff="git diff"
alias gstash="git stash -u"
alias gpop="git stash pop"
alias gpull="git pull"
alias gpush="git push"

# File Assoc
alias -s {md,markdown,rst,toml,json}=code
alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,wav,webm}=iina