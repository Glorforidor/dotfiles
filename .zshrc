# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker encode64 git git-extras golang pip python rsync ruby rust web-search wd zsh-vi-mode tmux nmap pass vagrant ssh-agent gh gopass)

# Plugin configuration

# Source Oh My ZSH after plugin configuration
source $ZSH/oh-my-zsh.sh

# User configuration
#
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='$HOME/.local/bin/vim'
else
    export EDITOR='$HOME/.local/bin/vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cal='ncal -w -b -M -W 4'

# Set terminal keybindings to vi.
set -o vi

if [[ -z "$TMUX" ]]; then
    figlet -c -t -f banner 'Hail the Omnissiah!'
fi

# Setup FZF
#
export FZF_DEFAULT_OPTS='--bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-/:toggle-preview'
if command -v bat &> /dev/null; then
    alias fb='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
else
    alias fb='fzf --preview "less {}"'
fi

# This is a fix for zsh-vi-mode overwriting fzf keybindings.
function zvm_after_init() {
   [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Git plugin makes an alias for gcd - which I do not use and I want that name!
unalias gcd

# Traverse to the root of a git repo.
function gcd() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]
    then
        cd $(git rev-parse --show-toplevel)
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
