#!/bin/bash
sudo add-apt-repository ppa:pgolm/the-silver-searcher
echo "-=update repository=-"
sudo apt-get update &>/dev/null
echo "-=update Done=-"
echo "[1] Cscope"
sudo apt install cscope &>/dev/null

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

echo "[3] ctags"
sudo apt-get install ctags &>/dev/null
