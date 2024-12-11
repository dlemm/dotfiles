# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/dennis.lemm/.zsh/completions:"* ]]; then export FPATH="/Users/dennis.lemm/.zsh/completions:$FPATH"; fi

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias repo="cd ~/repositories/"


# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

alias pbc='pbcopy'
alias pbp='pbpaste'


alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget

# typos
alias brwe=brew
alias igt=git

# grow
alias grow='pipenv run grow'

# zsh
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias reload!='. ~/.zshrc'



# nvim
alias nvh="nvim ~/.config/nvim/"
alias vnim="nvim"
alias vim="nvim"
alias v="nvim"
alias keymap="nvim ~/.config/nvim/lua/314rate/core/keymaps.lua"

# Tmux
alias t=tmux
alias ta='tmux attach'

# Obsidian

alias oo='cd $HOME/repositories/zettelkasten/'
alias or='nvim $HOME/repositories/zettelkasten/Fleeting/*.md'

# navigate to global ssh directory
alias sshhome="cd ~/.ssh"

###
# time to upgrade `ls`
# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='gls -AFh ${colorflag} --group-directories-first'
alias lsd='ls -l | grep "^d"' # only directories

###

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias fix="git diff --name-only | uniq | xargs subl"

# File size
alias fs="stat -f \"%z bytes\""

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew -v upgrade --all; brew cleanup; brew cask cleanup; brew prune; brew doctor"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-rdoc --no-ri'

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"

# thefuck package https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# Password copy
alias pwc="opswd"

source <(fzf --zsh)

# fnm
export PATH=/home/$USER/.fnm:$PATH
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. "/Users/dennis.lemm/.deno/env"
