#!/usr/bin/env bash

echo "Début de l'installation"
#Vérifie si Homebrew est déjà installé
if test ! $(which brew); then
    echo "Installing homebrew…"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap "homebrew/bundle"

echo "Installation des apps…"
brew bundle install

#Vérifie si Oh-My-Zsh est installé
if [ -d ~/.oh-my-zsh ]; then
    echo "Oh-My-Zsh déjà installé…"
else
    echo "Installation de Oh-My-Zsh…"
    ruby -e "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi

sh init_conf_macOs.sh
sh install_fonts.sh

echo "Nettoyage…"
brew cleanup

echo "Mise à jour automatique des brews"
brew autoupdate start --upgrade --greedy --cleanup

echo "Installation terminée"