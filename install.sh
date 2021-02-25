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
sudo apt-get -y install gawk net-tools coreutils
sudo apt-get -y install neovim 
sudo apt-get -y install ctags
sudo apt-get -y install silversearcher-ag

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/vn7n24fzkq/my-linux-config.git

#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#npm
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get -y install nodejs npm
sudo npm install -g tmux-mem
sudo npm install -g tmux-cpu

#tmux 
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s -f ~/my-linux-config/config/.tmux/.tmux.conf.local

#zsh
sudo apt-get -y install zsh
sudo apt-get -y install powerline fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cd ~/.config/nvim/
ln -s -f ~/my-linux-config/config/nvim/init.vim 
ln -s -f ~/my-linux-config/config/nvim/coc-settings.json
nvim +PluginInstall +qall

reset

#git
ln -s -f ~/my-linux-config/config/.gitconfig

#LS_COLORS
ln -s -f ~/my-linux-config/config/.dircolors
. $HOME/.bashrc
source ~/.zshrc
