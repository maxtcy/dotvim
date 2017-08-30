#!/bin/bash
# Ref Link 1) http://www.2daygeek.com/powerline-adds-powerful-statusline-to-vim-bash-tumx-in-ubuntu-fedora-debian-arch-linux-mint/#
# Ref Link 2) https://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/

setup_screen() {
	scn_rc="$HOME/.screenrc"
	scn_cmd="termcapinfo xterm 'Co#256:AB=\\E[48;5;%dm:AF=\\E[38;5;%dm'"
	if [[ -f ${scn_rc} ]]; then
		rm -r $scn_rc
		printf "#Set Screen color as 256 color\n" >> ${scn_rc}
		printf "${scn_cmd}" >> ${scn_rc}
	fi
}

setup_bash() {
	pwlstr=$(pip3 show powerline-status)
	idx=0
	for i in $pwlstr
	do
		if [[ $idx == 6 ]] ; then
			PWL_SCRIPT=$i"/powerline/bindings/bash/powerline.sh"
		fi
		let "idx++";
	done

	content=$(printf "#POWERLINE SETTING\\
	if [ -f %s ]; then\\
	    export term=\"XTERM-256color\"\\
	    powerline-daemon -q\\
	    POWERLINE_BASH_CONTINUATION=1\\
	    POWERLINE_BASH_SELECT=1\\
	    source %s\\
	fi" "$PWL_SCRIPT" "$PWL_SCRIPT")

	if [[ -f $PWL_SCRIPT ]]; then
		sed -i '$a'"$content" $DST
	fi
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
	setup_screen
else
	case "$1" in
		"p")
			DST="$HOME/.bashrc"
			setup_bash
			source ~/.bashrc
			;;

		"t")
			echo -e "\033[7m(TEST Version)\033[0m"
			DST="$PWD/test.txt"
			if [ ! -f $DST ]; then
				echo -e "123\n4567" >> $DST
			fi
			setup_bash
			cat $DST;
			;;
		"s")
			setup_screen
			;;
		*)
			printf "parameter error!\n"
			echo	"s: for screen test"
			echo	"t: test mode"
			echo	"p: for Bash update"
			;;
	esac
#        if [ "$1" == "p" ]; then
#                DST="$HOME/.bashrc"
#                setup_bash
#                source ~/.bashrc
#        elif [ "$1" == "t" ]; then
#                echo -e "\033[7m(TEST Version)\033[0m"
#                DST="$PWD/test.txt"
#                if [ ! -f $DST ]; then
#                        echo -e "123\n4567" >> $DST
#                fi
#                setup_bash
#                cat $DST;
#        fi
fi