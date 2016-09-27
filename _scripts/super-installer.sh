#!/bin/sh

# The Iron Yard - Nashville - FEE Fall 2016
# Super Install Script
#
# Heavily borrowing on the shoulders of giants
# MIT or similar license probably applies
# Thanks to Jacob Smith from the GVL campus of The Iron Yard

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install Git, Trash and io.js
clis=(
  hub
  git
  trash
  node
  watchman
  phantomjs
)
echo "installing cli tools and languages..."
brew install ${clis[@]}

brew cleanup

# Apps
apps=(
  alfred
  google-chrome
  atom
  slack
  iterm2

  flux
  quicklook-json
  spectacle
  dash

  #mou
  #github
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Setting Git to use Atom as default editor"
git config --global core.editor "atom --wait --safe"

echo "Setting up Git Ignore"
wget https://gist.githubusercontent.com/octocat/9257657/raw/3f9569e65df83a7b328b39a091f0ce9c6efc6429/.gitignore -O ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Let's make the Terminal Great AGAIN!
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

mkdir ~/bin

# Node Modules
node_modules=(
  eslint
  eslint-config-rtablada
  ember-cli
  yo
  generator-qunit-broccoli
  generator-sass-broccoli
  generator-adonis-broccoli
  adonis-cli
)

npm install ${node_modules[@]}

wget https://gist.githubusercontent.com/rtablada/616652322eb096a0e476/raw/a5e595962a155583ff162a5940b3a65e971bab79/batcharge.py -O ~/bin/batcharge.py
wget https://gist.githubusercontent.com/rtablada/616652322eb096a0e476/raw/a5e595962a155583ff162a5940b3a65e971bab79/doubleend.zsh-theme -O ~/.oh-my-zsh/themes/doubleend.zsh-theme
