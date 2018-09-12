#!/bin/sh -e
cd
git clone https://github.com/vn7n24fzkq/my-linux-config.git
#install What I need 
sudo apt-get update
sudo apt-get install curl git tmux vim 
sudo apt-get install python-pip python-dev build-essential
sudo apt-get install build-essential cmake
sudo apt-get install build-essential cmake3
sudo apt-get install python-dev python3-dev

#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#rust
curl https://sh.rustup.rs -sSf | sh

#java
sudo apt-get install default-jdk
sudo apt-get install default-jre

#npm
sudo apt-get install nodejs npm

#tmux 
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf 
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf.local 

#powerline-shell
pip install powerline-shell
ln -s -f ~/my-linux-config/config/.my-powerline-themes 
if [! -d ~/.config ]; then
    mkdir ~/.config
fi
ln -s -f ~/my-linux-config/config/.config/powerline-shell/ ~/.config

#vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s -f ~/my-linux-config/config/.vimrc 
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --rust-completer --java-completer 

#git
ln -s -f ~/my-linux-config/config/.gitconfig

#LS_COLORS
cp ~/my-linux-config/config/.dircolors 
. $HOME/.bashrc
