# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
#
ZSH_THEME="af-magic"
ZSH_THEME="spaceship"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set-up icons for files/folders in terminal
alias l='eza -l --icons --git -a'
alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=2 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Z oxide setup
eval "$(zoxide init zsh)"
alias cd='z'

# alias 
alias c='clear'
alias zed="/usr/bin/zeditor"
alias task="/home/alex/alex/scripts/mytodo.sh"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# add custome scripts
alias fi='~/hyprdots/scripts/tmux-sessionizer/new.sh'
alias list='~/hyprdots/scripts/lists/main.sh'


# eval "$(starship init zsh)"
# export STARSHIP_CONFIG=~/.config/starship.toml
#

# Auto-completion for your script in Zsh
_list_script_completion() {
    local cur=${words[CURRENT]}
    local prev=${words[CURRENT-1]}
    local -a opts lists

    opts=("create" "read" "add" "delete" "lists")
    lists=($(ls ~/lists 2>/dev/null | sed 's/\.txt$//'))

    case "$prev" in
        create|delete|read|add)
            compadd -W "" -a lists
            ;;
        *)
            compadd -W "" -a opts
            ;;
    esac
}

compdef _list_script_completion ~/hyprdots/scripts/lists/main.sh
