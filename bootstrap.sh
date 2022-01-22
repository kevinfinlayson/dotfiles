#!/usr/bin/env bash

# Use shared functions
. shared.sh


# ==============================================================================
# SET UP CONFIG FILES
# ==============================================================================

header "Setting up config files"

# Config files
ensure_symlink ~/dotfiles/zshrc ~/.zshrc
ensure_symlink ~/dotfiles/gitconfig ~/.gitconfig
ensure_symlink ~/dotfiles/gitignore ~/.gitignore
ensure_symlink ~/dotfiles/gemrc ~/.gemrc


# ==============================================================================
# SET UP PACKAGES
# ==============================================================================

header "Setting up packages"

# Shell
ensure_repo ~/.oh-my-zsh git@github.com:robbyrussell/oh-my-zsh.git
ensure_repo ~/.oh-my-zsh/custom/plugins/pure git@github.com:sindresorhus/pure.git
ensure_symlink ~/.oh-my-zsh/custom/plugins/pure/async.zsh /usr/local/share/zsh/site-functions/async
ensure_repo ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting git@github.com:zsh-users/zsh-syntax-highlighting.git

# Set ZSH as the default shell
chsh -s /bin/zsh

# Ruby
# ensure_repo ~/.rbenv git@github.com:sstephenson/rbenv.git
# ensure_repo ~/.rbenv/plugins/ruby-build git@github.com:sstephenson/ruby-build.git
# sudo gem install bundler

# Node
# ensure_repo ~/.nvm git@github.com:creationix/nvm.git

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install hub


# ==============================================================================
# INSTALL APPS
# ==============================================================================

header "Installing apps"

# Essentials
brew cask install one-password
brew cask install things
brew cask install Kaleidoscope
brew cask install Github

# Quicklook extensions (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen quicklook-json


# ==============================================================================
# OSX TWEAKS
# ==============================================================================

header "Tweaking OSX Preferences"

# Fix doc hiding and showing (http://kevinclark.ca/articles/hide-your-dock-without-losing-your-mind)
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -float 0.5; killall Dock


# ==============================================================================
# SET UP VSCODE
# ==============================================================================

# Symlink config files
ln -s -f ~/dotfiles/vscode/argv.json ~/.vscode/argv.json

# Install packages
code --install-extension dbaeumer.vscode-eslint # ESLint Javascript
code --install-extension shd101wyy.markdown-preview-enhanced # Better Markdown previews
code --install-extension quicktype.quicktype #Paste JSON as code
code --install-extension esbenp.prettier-vscode #Format code with prettier