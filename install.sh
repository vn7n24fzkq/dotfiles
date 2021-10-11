#!/bin/sh -e
cd

sudo apt-get install -y locales

#language
sudo locale-gen en_US.UTF-8

#install What I need 
sudo apt install man
sudo apt update
sudo apt install -y curl git tmux
sudo apt install -y python-pip python-dev build-essential
sudo apt install -y build-essential cmake
sudo apt install -y python-dev python3-dev
sudo apt install -y software-properties-common
sudo apt install -y gawk net-tools coreutils
sudo apt install -y neovim 
sudo apt install -y ctags
sudo apt install -y silversearcher-ag

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/vn7n24fzkq/my-linux-config.git

#fzf installation
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


#setbashrc
cat ~/my-linux-config/config/.mybashrc >> ~/.bashrc

#npm
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get -y install nodejs npm
sudo npm install -g tmux-mem
sudo npm install -g tmux-cpu

#tmux 
git clone https://github.com/gpakosz/.tmux.git
ln -sf .tmux/.tmux.conf
ln -sf ~/my-linux-config/config/.tmux/.tmux.conf.local

#zsh
sudo apt-get -y install zsh
sudo apt-get -y install powerline fonts-powerline
#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cd ~/.config/nvim/
ln -sf ~/my-linux-config/config/nvim/init.vim 
ln -sf ~/my-linux-config/config/nvim/colors
ln -sf ~/my-linux-config/config/nvim/autoload
ln -sf ~/my-linux-config/config/nvim/doc
ln -sf ~/my-linux-config/config/nvim/coc-settings.json
nvim +PluginInstall +qall

reset

#git
ln -sf ~/my-linux-config/config/.gitconfig

#LS_COLORS
ln -sf ~/my-linux-config/config/.dircolors
source ~/.bashrc
source ~/.zshrc
