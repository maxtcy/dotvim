" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
set ai           " 自動縮排
set shiftwidth=8 " 設定縮排寬度 = 4
set tabstop=8    " tab 的字元數
set colorcolumn=90 "長度超過90字元
set history=100  " 保留 100 個使用過的指令
set cursorline   "Show current cursor
set cursorcolumn "Show Column cursor"
set hlsearch	 "High Light Search
set autoindent
set laststatus=2
set encoding=utf8
set t_Co=256	 "Powerline color setting
set nocompatible
autocmd FileType cpp set shiftwidth=4		"Change tabwidth while *.cpp

"colorscheme nightshade
"colorscheme jammy
"colorscheme kellys
colorscheme torte
"colorscheme nightshade

augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-plug . Since Vundle is not maintain anymore
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')	"Make sure you use single quotes
"plugin:{
	"core plugins
	"vim-scripts
	"Plug 'Lokaltog/vim-powerline'		"replace by vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'vim-scripts/Tagbar'		"replace by Tagbar
	Plug 'taglist.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'markabe/bufexplorer'
	Plug 'gcmt/wildfire.vim'
	Plug 'Yggdroot/indentLine'

	"""""""""""""""
	"    YankRing 	   : copy / paste
	"    EnhCommentify : mark out cod
	"    Lookupfile    : search files with vim
	"    genutils	   : necessary by Lookupfile
	"    align	   : align text format
	"    EasyGrep	   : vv to grep for the work under cursor, match all
	"    unite	   : something like ctrlp
	"    ctrlp	   : Turn on document
	"    Command-T     : Turn on document
	""""""""""""""
	Plug 'YankRing.vim'
	Plug 'AutoClose'
	Plug 'EnhCommentify.vim'
	"Plug 'lookupfile'
	"Plug 'genutils'
	"Plug 'Shougo/unite.vim'
	"Plug 'kien/ctrlp.vim'
	"Plug 'wincent/Command-T'
	Plug 'vim-scripts/Align'
	"Plug 'Lokaltog/vim-easymotion'

	Plug 'mileszs/ack.vim'
	Plug 'rking/ag.vim'
	Plug 'vim-scripts/EasyGrep'
	Plug 'airblade/vim-gitgutter'
	""Plug 'brookhong/cscope.vim'
	""Plug 'vim-scripts/cscope_macros.vim'
	Plug 'terryma/vim-multiple-cursors'

	"Colorscheme
	Plug 'c9s/colorselector.vim'
	"Plug 'flazz/vim-colorschemes'
	"Plug 'nightshade.vim'
	"Plug 'kellys'
	"Plug 'jammy.vim'

"}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Using Vundle to install plugin
"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
""set rtp+=~/.vim/bundle/Vundle.vim/
""call vundle#rc()
""
"""vndle Plugin:{
""	" Core plugins
""	"vim-scripts
""	Plugin 'vim-airline/vim-airline'
""	Plugin 'vim-airline/vim-airline-themes'
""	Bundle 'vim-scripts/Tagbar'
""	Bundle 'scrooloose/nerdtree'
""	Bundle 'jistr/vim-nerdtree-tabs'
""	Bundle 'markabe/bufexplorer'
""	"Bundle 'Lokaltog/vim-powerline'
""	"Bundle 'taglist.vim'
""	Bundle 'gcmt/wildfire.vim'
""	Bundle 'Yggdroot/indentLine'
""
""	"""""""""""""""
""	"    YankRing 	   : copy / paste
""	"    EnhCommentify : mark out cod
""	"    Lookupfile    : search files with vim
""	"    genutils	   : necessary by Lookupfile
""	"    align	   : align text format
""	"    EasyGrep	   : vv to grep for the work under cursor, match all
""	"    unite	   : something like ctrlp
""	"    ctrlp	   : Turn on document
""	"    Command-T     : Turn on document
""	""""""""""""""
""	Bundle 'YankRing.vim'
""	Bundle 'AutoClose'
""	Bundle 'EnhCommentify.vim'
""	"Bundle 'lookupfile'
""	"Bundle 'genutils'
""	"Bundle 'Shougo/unite.vim'
""	"Bundle 'kien/ctrlp.vim'
""	"Bundle 'wincent/Command-T'
""	Bundle 'vim-scripts/Align'
""	"Bundle 'Lokaltog/vim-easymotion'
""
""	Bundle 'mileszs/ack.vim'
""	Bundle 'rking/ag.vim'
""	Bundle 'vim-scripts/EasyGrep'
""	Bundle 'airblade/vim-gitgutter'
""	""Bundle 'brookhong/cscope.vim'
""	""Bundle 'vim-scripts/cscope_macros.vim'
""	Bundle 'terryma/vim-multiple-cursors'
""
""	"Colorscheme
""	Bundle 'c9s/colorselector.vim'
""	"Bundle 'flazz/vim-colorschemes'
""	"Bundle 'nightshade.vim'
""	"Bundle 'kellys'
""	"Bundle 'jammy.vim'
"}

" Brief help {
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" }
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Key Mapping" {
	"key for Generic{
		"let mapleader="\\"
	"}

	"key for build code"{
		noremap <silent> \j :make -j16<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
		noremap <silent> \b :cd ../;make bootimage -j16; cd kernel<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
	"}
	"key for Plugins{
		nnoremap <silent> <F2>  :wincmd p<cr>			"Switch Window
		nnoremap <silent> <F3>  :BufExplorer<cr>
		nnoremap <silent> <F4>  :NERDTreeToggle<cr>
		nnoremap <silent> <F5>  :%s/\s\+$//g<cr>
		nnoremap <silent> <F6>  :cp<cr>				"QuickFix Last message
		nnoremap <silent> <F7>  :YRShow<cr>
		nnoremap <silent> <F8>  :cn<cr>				"QuickFix Next message
		nnoremap <silent> <F9>  :TagbarToggle<cr>		"TlistToggle"
		nnoremap <silent> <F10> :GitGutterLineHighlightsToggle<cr>	"HL Git Diff"
		nnoremap <silent>.<F10> :GitGutterNextHunk<cr>
		nnoremap <silent>,<F10> :GitGutterPrevHunk<cr>
		nnoremap <silent> <F11> :bn<cr>				"Buffer Next
		nnoremap <silent>/<F11> :bd<cr>				"Buffer Close
		nnoremap <silent> <F12> :botright copen<cr>		"QuickFix Open
		nnoremap <silent>/<F12> :ccl<cr>			"QuickFix Close
		""nmap <S-F12> :cclose<cr>
		""nnoremap <silent> <F10> :SelectColorS<cr>

	"}
"}

"Plugin" {
	"plugin:Yankring" {
		let g:yankring_replace_n_pkey = '<m-p>'
	"}
	"
	"plugin:ctags {
		if has("ctags")
			if filereadable("tags")
				set tags=tags
			endif
		endif
	"}
	"plugin:taglist"{
		let Tlist_Ctags_Cmd            = '/usr/bin/ctags'
		let Tlist_Show_One_File        = 1	"不同时显示多个文件的tag，只显示当前文件的
		let Tlist_Exit_OnlyWindow      = 1	"如果taglist窗口是最后一个窗口，则退出vim
		""let Tlist_Auto_Open          = 1	"自動打開taglistgg視窗
		let Tlist_Inc_Winwidth         = 0	"禁止自动改变当前Vim窗口的大小
		""let Tlist_Use_Right_Window   = 1	"把方法列表放在屏幕的右侧
		let Tlist_File_Fold_Auto_Close = 1	"让当前不被编辑的文件的方法列表自动折叠起来
	"}
	"
	"plugin:tagbar"{
		let g:tagbar_ctags_bin = '/usr/bin/ctags'
		""autocmd FileType c nested :TagbarOpen	"Auto Turn on while file type is c, cpp
		" "autocmd VimEnter * nested :TagbarOpen
		let g:tagbar_width = 30
		let g:tagbar_sort = 0			"List by position
	"}
	"
	"plugin:airline"{
		"let g:airline_theme="powerlineish"
		let g:airline_theme="light"
		""let g:airline_theme="base16"
		let g:airline_powerline_fonts                  = 1	" Enable triangle symbol in vim

		if !exists("g:airline_symbols")
			let g:airline_symbols = {}
		endif
		if has('gui_running')					" Add this section can enable Gvim with correct symbol
			set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline
		endif

		let g:airline#extensions#whitespace#enabled     = 0
		let g:airline#extensions#tabline#enabled        = 1	" Enable Tabline
		let g:airline#extensions#tabline#tab_nr_type    = 1	" tab number
		let g:airline#extensions#tabline#buffer_nr_show = 1	" Show Buffer number
		let g:airline#extensions#tabline#show_buffers   = 1
		let g:airline#extensions#tabline#fnamecollapse  = 1	" collapsing parent directories in buffer name
		let g:airline#extensions#hunks#non_zero_only    = 1	" git gutter
		let g:airline#extensions#tagbar#enabled         = 1
                "let g:airline#extensions#syntastic#enabled     = 1	" Need extra plugin syntastic [Not used]
                "let g:airline#extensions#branch#enabled        = 1
                "let g:airline#extensions#branch#empty_message  = "No SCM"
	"}
	"
	"plugin:Easygrep"{
		let g:EasyGrepMode=2	"Default 0:All file, 2-Track the current extension
	"}
	"
	"plugin:NERDTree{
		let g:NERDTreeWinPos  = "left"
		let NERDChristmasTree = 1
		let NERDTreeChDirMode = 1
		let NERDTreeIgnore    = ['\.o$', '\.ko$', '\~$', '\.dir$']
	"}
	"
	"plugin:NERDTree-Tab{
		let g:nerdtree_tabs_open_on_console_startup = 0
		let g:nerdtree_tabs_open_on_gui_startup     = 0		"Not turn on NERD while gvim or macvim
		let g:nerdtree_tabs_autoclose               = 1
	"}
	"
	"plugin:quickfix{
                aug QFClose
                        au!
                        au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
                aug END
	"}
	"
	"plugin:Git Gutter {
		let g:gitgutter_eager = 0	"  To notice change to git index
		"let g:gitgutter_highlight_lines = 1 "  To turn on line highlight by default
	"}
"}
