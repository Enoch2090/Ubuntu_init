#!/bin/bash

#----INIT proxy----
# export https_proxy=http://192.168.0.102:7890 http_proxy=http://192.168.0.102:7890 all_proxy=socks5://192.168.0.102:7891
#------------------
sudo apt update -y
sudo apt-get update -y
sudo apt install zsh -y
sudo apt-get install curl -y
sudo apt install git -y
sudo wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
sudo dpkg -i lsd_0.18.0_amd64.deb
sudo apt install powerline fonts-powerline -y


# cmake
cmk_exists=`which cmake`
if [ ${#cmk_exists} -eq 0 ]
then
    sudo snap install cmake --classic
else
    echo 'Cmake already installed.'
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
sudo chsh -s `which zsh`
sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y