#!/bin/bash
# Ref Link 1) http://www.2daygeek.com/powerline-adds-powerful-statusline-to-vim-bash-tumx-in-ubuntu-fedora-debian-arch-linux-mint/#
# Ref Link 2) https://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/

setup_bash() {
sed -i '$a LINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh\
if [ -f $LINE_SCRIPT ]; then\
	source $LINE_SCRIPT\
fi' $DST
}

if [ $# -eq 0 ]; then
	sudo apt install python3-pip

	sudo pip3 install git+https://github.com/Lokaltog/powerline

	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	fc-cache -vf /usr/share/fonts/
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

	DST="$HOME/.bashrc"
	setup_bash
	source ~/.bashrc
else
	echo -e "\033[7m(TEST Version)\033[0m"
	DST="$PWD/test.txt"
	if [ ! -f $DST ]; then
		echo -e "123\n4567" >> $DST
	fi
	setup_bash
	cat $DST;
fi
