Max's Vimrc
===========
Author: Chuanyu Tseng (Max_Tseng) <maxtcy@gmail.com>

Quick Start
----------------
1. Description:

	* Th is specific for Vim and it is working with [Vundle](https://github.com/gmarik/Vundle.vim).
	* The installation requires [Git](http://git-scm.com/) and triggers [`git clone`](http://gitref.org/creating/#clone)

2. Steps:

```
 git clone git://github.com/maxtcy/dotvim.git ~/.vim
 git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

```

3. Install plugins in VIM:

```
Launch `VIM` and keyin `:BundleInstall` in terminal.

[Mac Env needs to know]
If the platform is Mac, Must copy ~/.vim/vimrc to /usr/share/vim/
```	
4. airline detail

```
Need to install extra font (powerline used)
mkdir .font/
cd .font/
git clone https://github.com/Lokaltog/powerline-fonts.git
cd powerline-fonts/
./install.sh

```

Furture Work
------------
Improve of vimrc more readable
