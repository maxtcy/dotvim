Max's Vimrc
===========
Author: Chuanyu Tseng (Max_Tseng) <maxtcy@gmail.com>

Quick Start
----------------
**1. Description:**

- [~~Vundle~~](https://github.com/gmarik/Vundle.vim) is not maintain anymore.
- Using ([plug](https://github.com/junegunn/vim-plug) ) instead

**2. Steps:**
- Unix Like Env.
```
- git clone git://github.com/maxtcy/dotvim.git ~/.vim
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

**3. Install plugins in VIM:**

	- Using symbolic link command to link `.vimrc` to `~/.vim/vimrc`
		$ ln -s src dst
		$ ln -s ~/.vim/vimrc ~/.vimrc

	- Launch `VIM` and keyin `:PlugInstall` in terminal.

	[Mac Env needs to know]
	- If the platform is Mac, Must copy ~/.vim/vimrc to /usr/share/vim/

**4. Airline detail**

	- Need to install extra font (powerline used)
```
	mkdir .font/
	cd .font/
	git clone https://github.com/Lokaltog/powerline-fonts.git
	cd powerline-fonts/
	./install.sh
```

Others
----------
- Markdown Preview [Ref_Link](http://www.jianshu.com/p/24aefcd4ca93)
> - Node.js
>
>> 	sudo apt repository ppa:chris-lea/node.js
>
>>	sudo apt udpate
>
>>	sudo ap install nodejs
>
> -  npm
>> 	sudo apt install npm
>
> -  instant-markdown-d
>> 	 sudo npm -g install instant-markdown-d

Furture Work
------------
Improve of vimrc more readable
