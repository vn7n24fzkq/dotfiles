#!/bin/sh -e
cd

#language
sudo locale-gen en_US.UTF-8

#install What I need 
sudo apt-get update
sudo apt-get -y install  curl git tmux
sudo apt-get -y install  python-pip python-dev build-essential
sudo apt-get -y install  build-essential cmake
sudo apt-get -y install  python-dev python3-dev
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:jonathonf/vim
sudo apt -y install vim

git clone https://github.com/vn7n24fzkq/my-linux-config.git

#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src # for YouCompleteMe rust

#java
sudo apt-get -y install default-jdk

#npm
sudo apt-get -y install nodejs npm

#tmux 
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf 
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf.local 

#powerline-shell
if [! -d ~/.config ]; then
    mkdir ~/.config
fi
ln -s -f ~/my-linux-config/config/.config/powerline-shell ~/.config/powerline-shell
pip install --user  powerline-shell
ln -s -f ~/my-linux-config/config/.my-powerline-themes 

#vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s -f ~/my-linux-config/config/.vimrc 
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --all

#git
ln -s -f ~/my-linux-config/config/.gitconfig

#LS_COLORS
ln -s -f ~/my-linux-config/config/.dircolors 
. $HOME/.bashrc
