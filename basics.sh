#! /bin/bash
# If this is to be a complex bootstrap setup we need to assume that it is run on a blank OS.

sudo apt-get install python3 pip git

# Add Vim8 repository for Ubuntu 16
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
# Install also vim-nox for python support
sudo apt-get install vim vim-nox

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s 

