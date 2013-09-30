# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux command-not-found compleat copydir copyfile extract fasd git git-extras git-remote-branch gitfast history last-working-dir pip postgres python rsync ssh-agent systemd virtualenv virtualenvwrapper web-search)

export WORKON_HOME=~/.venv
source /usr/bin/virtualenvwrapper.sh

export PATH="/usr/bin/site_perl:$PATH";
export projects="$HOME/Projects";
export kivears="$HOME/Projects/kivears";
export hydra="$HOME/Projects/hydra";
export minotaure="$HOME/Projects/minotaure";

export PAGER=less;
export GREP_COLOR=31;

bindkey "^[OH" beginning-of-line # Home
bindkey "^[OF" end-of-line # End


for dir in $(ls ~/Projects); do
    if [ -d ~/Projects/$dir ]; then 
        export $dir="$(realpath ~/Projects/$dir)"
    fi
done

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

# Ignores duplicates in history
setopt HIST_IGNORE_DUPS
alias bépow="xmodmap ~/.bepow.map"

eval "$(fasd --init auto)"
eval `dircolors -b ~/.dircolors`
eval "cd"

source $ZSH/oh-my-zsh.sh
