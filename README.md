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

	- You can execute the scripts under ~/.vim/.
		1. 'env.sh' would setup the correspondings of vim.
		2. 'bash_pwl.sh' would setup the powerline within terminal prompt.

	- Using symbolic link command to link `.vimrc` to `~/.vim/vimrc`
		$ ln -s src dst
		$ ln -s ~/.vim/vimrc ~/.vimrc

	- Launch `VIM` and keyin `:PlugInstall` in terminal.

	[Mac Env needs to know]
	- If the platform is Mac, Must copy ~/.vim/vimrc to /usr/share/vim/

**4. Airline detail**

	- Need to install extra font (powerline used)

5. Install universal-ctags & global

	- [universal-ctags](https://blog.csdn.net/wanghuasn911/article/details/86851825)
	- [Global]
		$ wget http://tamacom.com/global/global-6.6.4.tar.gz
		$ ./configure
		$ make -j4
		$ sudo make install
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
>> 	sudo apt-get remove nodejs
>>	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
>>	sudo apt-get install -y nodejs
>
> -  npm
>> 	sudo apt install npm
>
> -  instant-markdown-d
>> 	 sudo npm -g install instant-markdown-d

Furture Work
------------
Improve of vimrc more readable
