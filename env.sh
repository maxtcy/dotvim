#!/bin/bash

MY_HOME=$HOME
MY_VIM="$HOME/.vim"
MY_FONT="$HOME/.font"
###########################
machine_mac() {
	echo "[1] Cscope"
	brew install cscope &>/dev/null
	###########################
	echo "[2] ag (somethig like grep, but faster)"
	brew install the_silver_searcher &>/dev/null
	###########################
	echo "[3] ctags"
	brew install ctags &>/dev/null
}

machine_linux() {
	sudo add-apt-repository ppa:pgolm/the-silver-searcher
	echo "-=update repository=-"
	sudo apt-get update &>/dev/null
	echo "-=update Done=-"

	###########################
	echo "[1] Cscope"
	sudo apt install cscope &>/dev/null
	###########################
	echo "[2] ag (somethig like grep, but faster)"
	sudo apt-get install silversearcher-ag &>/dev/null

	outstr=$(ag --version) # To get ag version
	N=3
	ver=$(echo $outstr | awk -v N=$N '{print $N}') #echo $ver
	num=$(echo $ver | awk -F'.' '{print $1}') #echo $num

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
}

airline_font() {
	echo "[0] Airline Necessary Font"
	cd "$HOME"
	if [ -d "$MY_FONT" ] ; then
		echo "Folder exist!!"

		read -p  $'Would you like to \033[31mdelete\033[0m the old one \n\tand download new one (y/n) ?' ans
		case ${ans:0:1} in
			y|Y )
				rm -rf "$MY_FONT"
				mkdir -p "$MY_FONT"
				cd "$MY_FONT"
				git clone https://github.com/Lokaltog/powerline-fonts.git &>/dev/null
				gitresult=$?
				if [[ $gitresult -ne 0 ]]
				then
					echo -e "!!![ git clone \033[33mFAIL\033[0m]!!!
					\n\033[31m!!![Terminate Script]!!!\033[0m"
					exit
				fi
				;;
			n|N )
				echo -e "\033[31m!!![Terminate Script]!!!\033[0m"
				exit
				;;
			*)
				echo -e "\033[31mNot legal input(${ans})\n!!![Terminate Script]!!!\033[0m"
				exit
				;;
		esac
	fi
	cd powerline-fonts/
	./install.sh
}
###########################

unamestr="$(uname -s)" #echo $OSTYPE
case "${unamestr}" in
	Linux*)	machine=Linux
		echo -e "-= Setup Env is \e[7m(${machine})\e[0m =-"
#                sudo apt-get install git-core curl tig &>/dev/null
		;;
	Darwin*) machine=Mac
		echo -e "-= Setup Env is \033[7m(${machine})\033[0m =-"
		brew update
		brew install vim --override-system-vim
		brew install git curl tig
		;;
	CYGWIN*) machine=Cygwin ;;
	*)
		echo "Unknown OS type!! Abort following steps"
		exit ;;
esac
###########################
#echo -e "[-= Script Start =-]\tFetch dotvim.git from github"
#if [ ! -d "$MY_VIM" ]; then
#        git clone git://github.com/maxtcy/dotvim.git "$MY_VIM" &>/dev/null #2>&1
#        gitresult=$?
#        if [[ $gitresult -ne 0 ]]
#        then
#                echo -e "!!![ git clone \033[33mFAIL\033[0m]!!!
#                \n\033[31m!!![Terminate Script]!!!\033[0m"
#                exit
#        fi
#else
#        echo -e "\033[7m($MY_VIM)\033[0m already \033[7mEXIST\033[0m !!"
#        read -p  $'Would you like to \033[31mdelete\033[0m the old one \n\tand download new one (y/n) ?' ans
#        case ${ans:0:1} in
#                y|Y )
#                        rm -f "$MY_VIM"
#                        git clone git://github.com/maxtcy/dotvim.git "$MY_VIM" &>/dev/null #2>&1
#                        gitresult=$?
#                        if [[ $gitresult -ne 0 ]]
#                        then
#                                echo -e "!!![ git clone \033[33mFAIL\033[0m]!!!
#                                \n\033[31m!!![Terminate Script]!!!\033[0m"
#                                exit
#                        fi
#                        ;;
#                n|N )
#                        echo -e "\033[31m!!![Terminate Script]!!!\033[0m"
#                        exit
#                        ;;
#                *)
#                        echo -e "\033[31mNot legal input(${ans})\n!!![Terminate Script]!!!\033[0m"
#                        exit
#                        ;;
#        esac
#fi
###########################
#ln -s ~/.vim/vimrc ~/.vimrc
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null
###########################
airline_font
###########################
case "${machine}" in
	Linux*)
		machine_linux
		;;
	Mac*)
		machine_mac
		#cp ~/.vim/vimrc /usr/share/vim/
		;;
	CYGWIN*)
		;;
	*)
		echo "Unknown OS type!! Abort following steps"
		exit ;;
esac
###########################
echo -e  "\033[92m[-= End of this Script =-] DONE!!! "
