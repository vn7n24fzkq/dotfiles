#!/bin/sh -e
cd

sudo apt-get install -y locales

#language
sudo locale-gen en_US.UTF-8

#install What I need 
sudo apt install man
sudo apt-get update
sudo apt-get -y install  curl git tmux
sudo apt-get -y install  python-pip python-dev build-essential
sudo apt-get -y install  build-essential cmake
sudo apt-get -y install  python-dev python3-dev
sudo apt-get -y install software-properties-common
sudo apt -y install nvim

git clone https://github.com/vn7n24fzkq/my-linux-config.git

#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src # for YouCompleteMe rust
rustup component add rls --toolchain stable-x86_64-unknown-linux-gnu
rustup component add rls rust-analysis rust-src

#java
sudo apt-get install openjdk-11-jre openjdk-11-jdk

#npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs npm

#tmux 
cp ~/my-linux-config/config/.tmux/.tmux.conf .tmux.conf
cp ~/my-linux-config/config/.tmux/.tmux.conf.local .tmux.conf.local

#powerline-shell
if [! -d ~/.config ]; then
    mkdir ~/.config
fi
mkdir -p ~/.config && cp -R ~/my-linux-config/config/.config/powerline-shell ~/.config/powerline-shell
pip install --user  powerline-shell
cp -R ~/my-linux-config/config/.my-powerline-themes  .my-powerline-themes  

#vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/my-linux-config/config/.vimrc .vimrc 
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --all

reset

#git
cp ~/my-linux-config/config/.gitconfig .gitconfig

#LS_COLORS
cp ~/my-linux-config/config/.dircolors .dircolors
. $HOME/.bashrc
