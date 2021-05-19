#!/bin/sh
CURRENT=$(cd $(dirname $0); pwd)

mkdir -p ~/.vim

ln -sf $CURRENT/.Brewfile ~/.Brewfile
ln -sf $CURRENT/.bash_aliases ~/.bash_aliases
ln -sf $CURRENT/.bash_profile ~/.bash_profile
ln -sf $CURRENT/.bashrc ~/.bashrc
ln -sf $CURRENT/.vim/.vimrc ~/.vimrc
ln -sf $CURRENT/.vim/colors ~/.vim
ln -sf $CURRENT/.gitconfig ~/.gitconfig
ln -sf $CURRENT/.gitignore ~/.gitignore
ln -sf $CURRENT/.irbrc ~/.irbrc
ln -sf $CURRENT/.profile ~/.profile
ln -sf $CURRENT/.tmux.conf ~/.tmux.conf

touch ~/.irb_history

echo "The dotfiles link process was successful."
