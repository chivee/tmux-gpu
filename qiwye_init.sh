#!/usr/bin/env bash
cd ~
echo "============"
echo "Install package"
echo "============"
sudo apt update -y
sudo apt install tmux git zsh nodejs npm python3-dev python3-pip python3-setuptools -y

echo "============"
echo "Install oh-My-ZSH"
echo "============"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "============"
echo "Install oh-My-Tmux"
echo "============"
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# instaling gpu mod
cd .tmux
wget https://raw.githubusercontent.com/chivee/tmux-gpu/master/gpu.js ./
cd ~

echo "============"
echo "Install TPMk"
echo "============"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "set -g @plugin 'tmux-plugins/tpm'" >> .tmux.conf.local
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> .tmux.conf.local
echo "set -g @plugin 'nhdaly/tmux-better-mouse-mode'" >> .tmux.conf.local
echo "set-option -g mouse on" >> .tmux.conf.local
echo "run -b '~/.tmux/plugins/tpm/tpm'" >> .tmux.conf.local

echo "============"
echo "Install TheF**K"
echo "============"
sudo pip3 install thefuck
echo "eval $(thefuck --alias)" >> .zshrc
echo "eval $(thefuck --alias)" >> .bashrc


