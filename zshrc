export PATH=""

# Load default PATH
if [ -x /usr/libexec/path_helper ]; then eval "$(/usr/libexec/path_helper -s)"; fi
if [ -f /etc/environment ]; then source /etc/environment; fi

# Oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Pure theme
source ~ZSH_CUSTOM/plugins/pure/async.zsh
source ~ZSH_CUSTOM/plugins/pure/pure.zsh
PURE_GIT_PULL=0

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# For local customizations
if [ -f ~/.profile ] || [ -h ~/.profile ]; then source ~/.profile; fi

# Mac-specifics
if [ "$(uname -s)" = "Darwin" ]
then
  # Rebuild the Launch Services database
  # (Gets rid of duplicates in the "Open With" submenu)
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

  # Aliases

  alias cp='cp -i'
  alias rm='rm -i'
  alias mv='mv -i -v'
  alias ls='ls -lspa'


  # Add Homebrew to PATH
  if [ -d "/usr/local/Cellar" ]
  then
    PATH="/usr/local/bin:$PATH"
  fi

  # Add Postgres.app to PATH
  if [ -d /Applications/Postgres.app ]
  then
    PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
  fi
fi

# Git commands
alias g="hub"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gm='git merge'
alias go='git checkout '
alias got='git '
alias get='git '
alias gdk='git difftool -y -t Kaleidoscope'
alias gmk='git mergetool -y -t Kaleidoscope'
alias delete-local-branch='git branch -D'
alias delete-remote-branch='git push origin --delete'
alias cleanup-remote-branches='git remote prune origin'
alias cleanup-local-branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias vim-conflicts='vim $(git diff-files --name-only -0)'

function strip-diff {
  (
    set -e
    git diff-files --name-only -0 | while read line; do
      target=$(tempfile)
      git stripspace < "$line" > "$target"
      cat "$target" > "$line"
      rm "$target"
    done
  )
}

# Misc
alias serve='ruby -run -e httpd . -p 9090'
function be { bundle check >/dev/null || bundle install && bundle exec $@; }
alias bi='bundle install'
alias ss='be TDD=0 script/server'
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

#History
alias h='history'
export HISTCONTROL=erasedups
export HISTSIZE=10000
setopt APPEND_HISTORY

# Get rid of autocorrection
unsetopt correct_all

# CLI Horizontal scroll mode
set horizontal-scroll-mode on

# Load nvm
if [ -s ~/.nvm/nvm.sh ]
then
  source ~/.nvm/nvm.sh
fi

# Set editor
export EDITOR='atom -w'

function dev {
  (
    set -e
    cd ~/vagrant
    if vagrant status | grep -q 'powered off'; then vagrant up; fi
    vagrant ssh -- -t 'cd ~/src/shopify && exec $SHELL --login'
  )
}

function forcepush {
  (
    branch=$(git symbolic-ref --short HEAD)
    git push origin +$branch
    echo "Force pushing $branch"
  )
}

setopt no_complete_aliases

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

### MySQL support
export PATH="/usr/local/mysql/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
