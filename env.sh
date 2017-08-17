#!/bin/bash

MY_HOME=$HOME
###########################
echo "[vimrc download]Fetch dotvim.git from github"
git clone git://github.com/maxtcy/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

###########################
sudo add-apt-repository ppa:pgolm/the-silver-searcher
echo "-=update repository=-"
sudo apt-get update &>/dev/null
echo "-=update Done=-"

###########################
echo "[0] Airline Necessary Font"
cd "$HOME"
mkdir -p ~/.font
if [ -d ~/.font ]
then
echo "Folder exist!!"
fi
cd ~/.font
git clone https://github.com/Lokaltog/powerline-fonts.git &>/dev/null
cd powerline-fonts/
./install.sh
###########################
echo "[1] Cscope"
sudo apt install cscope &>/dev/null
###########################
echo "[2] ag (somethig like grep, but faster)"
sudo apt-get install silversearcher-ag &>/dev/null

outstr=$(ag --version)
# To get ag version
N=3
ver=$(echo $outstr | awk -v N=$N '{print $N}')
#echo $ver
num=$(echo $ver | awk -F'.' '{print $1}')
#echo $num

if [ $num > 0 ]
then
	echo "New version, No need to update"
else
        echo "[******] Need to using wget to install new version"
        wget http://launchpadlibrarian.net/323511019/silversearcher-ag_2.0.0-1_amd64.deb
        sudo dpkg -i silversearcher-ag_2.0.0-1_amd64.deb
fi

###########################
echo "[3] ctags"
sudo apt-get install ctags &>/dev/null

###########################
echo "[End of this Script] DONE!!! "
