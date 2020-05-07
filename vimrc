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

set background=dark

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


set nu
set ai           " 自動縮排
set shiftwidth=4 " 設定縮排寬度 = 4
set tabstop=4    " tab 的字元數
set colorcolumn=90 "長度超過90字元
set history=100  " 保留 100 個使用過的指令
set cursorline   "Show current cursor
"set cursorcolumn "Show Column cursor"
set hlsearch	 "High Light Search
set autoindent
set laststatus=2
set encoding=utf8
set t_Co=256	 "Powerline color setting
set nocompatible
set clipboard=unnamedplus
autocmd FileType cpp set shiftwidth=4		"Change tabwidth while *.cpp
autocmd FileType cpp set smarttab		"Change tabwidth while *.cpp
autocmd FileType cpp set expandtab		"Change tabwidth while *.cpp

" Platform identification { " schme using by OS type
	silent function! OSX()
		return has('macunix')
	endfunction
	silent function! LINUX()
		return has('unix') && !has('macunix') && !has('win32unix')
	endfunction
	silent function! WINDOWS()
		return  (has('win16') || has('win32') || has('win64'))
	endfunction
	silent function! FREEBSD()
	  let s:uname = system("uname -s")
	  return (match(s:uname, 'FreeBSD') >= 0)
	endfunction

	if OSX()
		colorscheme jammy
	elseif LINUX()
		colorscheme molokai
	endif
" }

augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=5

" Update file automatically
set updatetime=500	"update file time
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-plug . Since Vundle is not maintain anymore
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')	"Make sure you use single quotes
"plugin:{ "core plugins
	"vim-scripts
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'itchyny/lightline.vim'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'majutsushi/Tagbar'
	Plug 'vim-scripts/AutoClose'
	Plug 'vim-scripts/YankRing.vim'
	Plug 'vim-scripts/EnhCommentify.vim'
	Plug 'tpope/vim-vinegar'
	Plug 'gcmt/wildfire.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'ntpeters/vim-better-whitespace'

	"Plug 'jsfaint/gen_tags.vim'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'

	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
	if !(system('uname -s') =~ 'MINGW64')
	    Plug 'Yggdroot/LeaderF', { 'do': './install.sh'}
	endif

	Plug 'vim-scripts/Align'
	Plug 'qpkorr/vim-bufkill'

	Plug 'rking/ag.vim'
	"lug 'mhinz/vim-grepper'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'terryma/vim-multiple-cursors'

	Plug 'easymotion/vim-easymotion'
	" Incsearch: https://github.com/haya14busa/incsearch.vim
	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/incsearch-easymotion.vim'

	Plug 'c9s/colorselector.vim'				"Colorscheme

	Plug 'octol/vim-cpp-enhanced-highlight'		"C++ Syntax Enhance C++11/14
	Plug 'derekwyatt/vim-protodef'
	Plug 'farmergreg/vim-lastplace' 			"reopen files at your last edit positioN

	Plug 'powerman/vim-plugin-AnsiEsc'			"Ansi Escape Code
	Plug 'bfrg/vim-qf-preview'
	Plug 'markabe/bufexplorer'

	Plug 'gosukiwi/vim-atom-dark'
"}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Key Mapping" {
	"key for Generic{
		let mapleader="\\"
	"}
	"key for build code"{
	"	noremap <silent> \j :make -j16<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
	"	noremap <silent> \b :cd ../;make bootimage -j16; cd kernel<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
	"}
	"key for Plugins{
		nnoremap <silent>z<F1>   :q<cr>
		nnoremap <silent> <F1>   :FZF -i<cr>
		nnoremap <silent> <F2>   :wincmd p<cr>							"Switch Window
		nnoremap <silent> <F3>   :LeaderfFunction!<cr>
		nnoremap <silent>f<F3>   :LeaderfBuffer<cr>
		nnoremap <silent> <F4>   :BufExplorer<cr>
		nnoremap <silent> <F5>   :%s/\s\+$//g<cr>						"Remove tail space
		nnoremap <silent> <F6>   :cp<cr>								"QuickFix Last message
		nnoremap <silent> <F7>   :YRShow<cr>
		nnoremap <silent> <F8>   :cn<cr>								"QuickFix Next message
		nnoremap <silent> <F9>   :botright copen<cr>					"QuickFix Open
		nnoremap <silent> <F10>  :GitGutterLineHighlightsToggle<cr>		"HL Git Diff"
		nnoremap <silent>.<F10>  :GitGutterNextHunk<cr>
		nnoremap <silent>,<F10>  :GitGutterPrevHunk<cr>
		nnoremap <silent>/<F10>  :Gblame<cr>							"Show git blame in vim
		nnoremap <silent> <F11>  :TagbarClose<cr>:bn<cr>				"Buffer Next
		nnoremap <silent>.<F11>  :bp<cr>								"Buffer Previous
		nnoremap <silent>/<F11>  :bw<cr>								"Buffer Close
		nnoremap <silent> <F12>  :TagbarToggle<cr>	                	"TlistToggle"
		nnoremap <silent>/<F12>  :! trace_m.sh 1<cr>:GenGTAGS<cr>		"BuildTag  mtkcam folder
		nnoremap <silent>.<F12>  :! trace_m.sh 2<cr>:! trace_m.sh 3<cr>	"Unlink  mtkcam folder
		nnoremap <Esc><Esc><Esc> :ccl <CR>

		" Bind \ (backword slash) to Lunch Ag Search.
		" add '!' can help turn on the 1st search file in the other window
		" Using Ag to search current cursor word."Using Ag to search current cursor word.
		nnoremap <silent> \ag :Ag! -p ~/.agignore <C-R><C-W><CR>
		nnoremap <silent> \ah :Ag! -G .h -p ~/.agignore <C-R><C-W><CR>

		" plugin:Incsearch { " ======== Incsearch ========
			nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

			map /  <Plug>(incsearch-easymotion-/)
			map ?  <Plug>(incsearch-easymotion-?)
			map g/ <Plug>(incsearch-easymotion-stay)
			map n  <Plug>(incsearch-nohl-n)
			map N  <Plug>(incsearch-nohl-N)
			map *  <Plug>(incsearch-nohl-*)
			map #  <Plug>(incsearch-nohl-#)
			map g* <Plug>(incsearch-nohl-g*)
			map g# <Plug>(incsearch-nohl-g#)
		" }
	"}
"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin" {
	"plugin:lightline {
		set showtabline=2
		let g:lightline#bufferline#show_number      = 1
		let g:lightline#bufferline#shorten_path     = 0
		let g:lightline#bufferline#min_buffer_count = 2
		let g:lightline#bufferline#unamed           = '[NoName]'

        let g:lightline                  = {}
		let g:lightline.colorscheme 	 = 'wombat'
        let g:lightline.tabline          = {'left':[['buffers']], 'right':[['close']]}
        let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
        let g:lightline.component_type   = {'buffers': 'tabsel'}
	"}
	"plugin:Easymotion" {
		let g:EasyMotion_smartcase = 1
	"}
	"plugin:Yankring" {
		let g:yankring_replace_n_pkey = '<m-p>'
		if has('nvim')
		    let g:yankring_clipboard_monitor = 0
		endif
		let g:yankring_max_history = 50
		let g:yankring_history_dir = '~/.vim'
	"}
	"plugin:bufexplorer {
		let g:bufExplorerShowRelativePath = 1 "Show Relatvie paths in buffer explorer
	"}
	"plugin:ctags {
		if has("ctags")
			"set tags=./.tags;,.tags 	"set tags=tags
			set tags=./.git/tags_dir/prj_tags
		endif
	"}
	"plugin:globle/gtags {
		if has("gtags-cscope")
			set csprg=/usr/loca/bin/gtags-cscope
		endif
	"}
	"plugin:tagbar {
		let g:tagbar_ctags_bin = '/usr/local/bin/ctags' "universal-ctags
		if !executable(g:tagbar_ctags_bin)
			let g:tagbar_ctags_bin = '/usr/bin/ctags'
			let g:loaded_gentags#ctags = 1 "Set 1 as disable ctag
		endif

		let g:tagbar_width      = 30
		let g:tagbar_sort       = 0
		let g:tagbar_autoclose  = 0
	"}
	" gtags {
		"let $GTAGSLABEL = 'native'
		let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
		" Copy to $HOME/.globalrc
	" }
	" plugin:vim-gutentags {
		let g:gutentags_define_advanced_commands=1
		let g:gutentags_modules = ['ctags', 'gtags_cscope']
		set statusline+=%{gutentags#statusline()}
		let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
		let g:gutentags_exclude_project_root = ['~/', '~/.vim/']

		let g:gutentags_ctags_tagfile = '.tags'
		let s:vim_tags = expand('~/.cache/tags')
		let g:gutentags_cache_dir = s:vim_tags

		let g:gutentags_ctags_extra_args =  ['--fields=+niazS','--extras=+q']
		let g:gutentags_ctags_extra_args += ['--c++-kinds=+px', '--c-kinds=+px']
		let g:gutentags_ctags_extra_args += ['--output-format=e-ctags','--exclude=*.mk']

		let g:gutentags_auto_add_gtags_cscope = 0

		" check ~/.cache/tags exist or not. if not create new.
		if !isdirectory(s:vim_tags)
			silent! call mkdir(s:vim_tags, 'p')
		endif

        augroup MyGutentagsStatusLineRefresher
            autocmd!
            autocmd User GutentagsUpdating call lightline#update()
            autocmd User GutentagsUpdated call lightline#update()
        augroup END
	" }
	"plugin:quickfix{
		aug QFClose
			au!
			au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
		aug END
	"}
	"plugin:Git Gutter {
		let g:gitgutter_eager = 0	"  To notice change to git index
		"let g:gitgutter_highlight_lines = 1 "  To turn on line highlight by default
	"}
	" plugin:ag {
		let g:ag_working_path_mode = 'r'
		let g:ag_highlight         = 1
	" }
	" plugin:FZF {
		" For default extra key bindings
		let g:fzf_action = {
		  \ 'ctrl-x': 'split',
		  \ 'ctrl-v': 'vsplit' }
		" Defaut fzf layout : down/up/left/right
		let g:fzf_layout = { 'down': '~35%'}
		" using fd tool as default search tool (http://github.com/sharkdp/fd)
		" Need to generate .agignore manually.
		let $FZF_DEFAULT_COMMAND = 'fd --type f --ignore-file ~/.agignore'
		if system('uname -n') =~ "mtkslt"
			set rtp +=$HOME/bin/
		elseif system('uname -s') == 'Darwin\n'
			set rtp +=/usr/local/opt/fzf
		else
			set rtp +=$HOME/.fzf
		endif
	" }
	" plugin:vim-cpp-enhanced-highlight {
		let g:cpp_class_scope_highlight           = 1
		let g:cpp_member_variable_highlight       = 1
		let g:cpp_class_decl_highlight            = 1
		let g:cpp_experimental_template_highlight = 1
	" }
	" plugin:EnhCommentify {
		let g:EnhCommentifyPretty = 'yes'	"Add space in comment"
		let g:EnhCommentifyAlighRight = 'yes'
	" }
	" LeaderF {
        let g:Lf_Ctags = g:tagbar_ctags_bin
        "let g:Lf_GtagsStoreInProject = '/local/mnt/workspace/.cache/tags'
        if has('python') || has('python3')
            let g:Lf_ShortcutF = '<C-F>'
        endif
	" }
	" plugin:lastplace {
		let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
		let g:lastplace_ignore_buftype = "quickfix.nofile,help"
	" }
	"plugin:vim-qf-preview {
		augroup qfpreview
			autocmd!
			autocmd FileType qf nmap <buffer> p <plug>(qf-preview-open)
		augroup END

		let g:qfpreview = {'sign': {'linehl': 'CursorLine'}}
	"}
	"plugin:incsearch {
	    set hlsearch
	    let g:incsearch#auto_nohlsearch = 1
	"}
	"plugin:incsearch {
	    set hlsearch
	    let g:incsearch#auto_nohlsearch = 1
	"}
	" gen_tags {
	"	let g:gen_tags#gtags_bin = '/usr/local/bin/gtags'
	"	if !executable(g:gen_tags#gtags_bin)
	"		let g:loaded_gentags#gtags = 1 "Set 1 as disable gtags
	"	else
	"	    let g:gen_tags#gtags_default_map = 1 "using cscope key mapping
	"	endif

	"	let g:gen_tags#use_cache_dir = 0 " 0:cache @ <project folder>/.git/tags_dir
	"	let g:gen_tags#verbose       = 1
	"	let g:gen_tags#statusline    = 1
	"	let g:gen_tags#blacklist     = ['$HOME', '$HOME/.vim']

	"	if executable(g:tagbar_ctags_bin)
	"	    let g:gen_tags#ctags_bin = g:tagbar_ctags_bin

	"	    let g:gen_tags#ctags_opts =  ['--fields=+niazS','--extras=+q']
	"	    let g:gen_tags#ctags_opts += ['--c++-kinds=+px', '--c-kinds=+px']
	"	    let g:gen_tags#ctags_opts += ['--output-format=e-ctags','--exclude=*.mk']
	"	endif
	" }
	"plugin:airline"{
	"	let g:airline_theme="powerlineish"
	"	let g:airline_theme = "light"
	"	let g:airline_powerline_fonts = 1	" Enable triangle symbol in vim
    "
	"	if !exists("g:airline_symbols")
	"		let g:airline_symbols = {}
	"	endif
	"	if has('gui_running')		" Add this section can enable Gvim with correct symbol
	"		set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline
	"	endif
    "
	"	let g:airline#extensions#whitespace#enabled     = 0
	"	let g:airline#extensions#tabline#enabled        = 1	" Enable Tabline
	"	let g:airline#extensions#tabline#tab_nr_type    = 1	" tab number
	"	let g:airline#extensions#tabline#buffer_nr_show = 1	" Show Buffer number
	"	let g:airline#extensions#tabline#show_buffers   = 1
	"	let g:airline#extensions#tabline#fnamecollapse  = 1	" collapsing parent directories in buffer name
	"	let g:airline#extensions#hunks#non_zero_only    = 1	" git gutter
	"	let g:airline#extensions#tagbar#enabled         = 1
    "            let g:airline#extensions#syntastic#enabled     = 1	" Need extra plugin syntastic [Not used]
    "            let g:airline#extensions#branch#enabled        = 1
    "            let g:airline#extensions#branch#empty_message  = "No SCM"
	"}
" }
