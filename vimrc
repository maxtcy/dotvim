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
"set cursorcolumn "Show Column cursor"
set hlsearch	 "High Light Search
set autoindent
set laststatus=2
set encoding=utf8
set t_Co=256	 "Powerline color setting
set nocompatible
autocmd FileType cpp set shiftwidth=4		"Change tabwidth while *.cpp
autocmd FileType cpp set smarttab		"Change tabwidth while *.cpp
autocmd FileType cpp set expandtab		"Change tabwidth while *.cpp

" function s:os_type()
"     if system('uname -s') =~ 'MING64'
"         return 'win'
"     elseif system('uname -s') == 'Darwin\n'
"         return 'mac'
"     endif
" endfunction

if (system('uname -s') =~ 'MINGW64')
    colorscheme jammy
else
    colorscheme molokai
endif
"colorscheme kellys
" colorscheme torte
"colorscheme nightshade

augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=5

" Update file automatically
set updatetime=500	"update file time
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

let using_NERD = 0

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
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'vim-scripts/Tagbar'
	Plug 'vim-scripts/AutoClose'
	Plug 'vim-scripts/YankRing.vim'
	Plug 'vim-scripts/EnhCommentify.vim'
	if using_NERD
	    Plug 'scrooloose/nerdtree'
	    Plug 'jistr/vim-nerdtree-tabs'
	endif "NERD
	Plug 'tpope/vim-vinegar'
	Plug 'markabe/bufexplorer'
	Plug 'gcmt/wildfire.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'jsfaint/gen_tags.vim'

	"""""""""""""""
	"    YankRing 	   : copy / paste
	"    EnhCommentify : mark out cod
	"    align	   : align text format
	"    EasyGrep	   : vv to grep for the work under cursor, match all
	""""""""""""""
	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
	if !(system('uname -s') =~ 'MINGW64')
	    Plug 'Yggdroot/LeaderF', { 'do': './install.sh'}
	endif

	Plug 'vim-scripts/Align'
	Plug 'easymotion/vim-easymotion'
	Plug 'qpkorr/vim-bufkill'

	Plug 'rking/ag.vim'
	Plug 'mhinz/vim-grepper'
	"Plug 'vim-scripts/EasyGrep'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
        "Plug 'ronakg/quickr-cscope.vim'
	Plug 'terryma/vim-multiple-cursors'

        "Plug 'Valloric/MatchTagAlways'		"Highlights the XML/HTML tags

	" Incsearch: https://github.com/haya14busa/incsearch.vim
	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/incsearch-easymotion.vim'
	Plug 'haya14busa/incsearch-fuzzy.vim'

	"Plug 'plasticboy/vim-markdown'		"Markdwon
	"Plug 'suan/vim-instant-markdown'

	Plug 'c9s/colorselector.vim'		"Colorscheme
	"Plug 'tomasr/molokai'
	"Plug 'kellys'
	"Plug 'jammy.vim'

	Plug 'octol/vim-cpp-enhanced-highlight'	"C++ Syntax Enhance C++11/14
	Plug 'derekwyatt/vim-protodef'

	Plug 'powerman/vim-plugin-AnsiEsc'	"Ansi Escape Code
	Plug 'lxhillwind/leader-clipboard'	" access system clipped in vim


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
		nnoremap <silent> <F1>   :FZF<cr>				"FZF Search
		nnoremap <silent> <F2>   :wincmd p<cr>				"Switch Window
		if using_NERD
		    nnoremap <silent> <F3>   :TagbarClose<cr>:NERDTreeToggle<cr>
	        else
		    nnoremap <silent> <F3>   :TagbarClose<cr>
		endif
		nnoremap <silent> <F4>   :BufExplorer<cr>
		nnoremap <silent> <F5>   :%s/\s\+$//g<cr>
		nnoremap <silent> <F6>   :cp<cr>				"QuickFix Last message
		nnoremap <silent> <F7>   :YRShow<cr>
		nnoremap <silent> <F8>   :cn<cr>				"QuickFix Next message
		nnoremap <silent> <F9>   :botright copen<cr>			"QuickFix Open
		nnoremap <silent>/<F9>   :ccl<cr>				"QuickFix Close
		nnoremap <silent> <F10>  :GitGutterLineHighlightsToggle<cr>	"HL Git Diff"
		nnoremap <silent>.<F10>  :GitGutterNextHunk<cr>
		nnoremap <silent>,<F10>  :GitGutterPrevHunk<cr>
		nnoremap <silent>/<F10>  :Gblame<cr>				"Show git blame in vim
		nnoremap <silent> <F11>  :TagbarClose<cr>:bn<cr>		"Buffer Next
		nnoremap <silent>.<F11>  :bp<cr>				"Buffer Previous
		nnoremap <silent>/<F11>  :bw<cr>				"Buffer Close
		if using_NERD
		    nnoremap <silent> <F12>  :NERDTreeClose<cr>:TagbarToggle<cr>	"TlistToggle"
		else
		    nnoremap <silent> <F12>  :TagbarToggle<cr>	                "TlistToggle"
		endif
		nnoremap <silent>/<F12> :SelectColorS<cr>			"Selec Color Schema"

                " Bind \ (backword slash) to Lunch Ag Search.
                " add '!' can help turn on the 1st search file in the other window
                " Using Ag to search current cursor word."Using Ag to search current cursor word.
                nnoremap <silent> \ag :Ag! -p ~/.agignore <C-R><C-W><CR>
	"}
"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin" {
	"plugin:Yankring" {
		let g:yankring_replace_n_pkey = '<m-p>'
		if has('nvim')
		    let g:yankring_clipboard_monitor = 0
		endif
	"}
	"
	"plugin:ctags {
		if has("ctags")
                        "set tags=tags
			set tags=./.tags;,.tags
		endif
	"}
	"
	"plugin:tagbar {
		let g:tagbar_ctags_bin = '/proj/mtk16125/bin/u-ctags/bin/ctags' "universal-ctags
                if !executable(g:tagbar_ctags_bin)
                    let g:tagbar_ctags_bin = '/usr/bin/ctags'
		    if !executable(g:tagbar_ctags_bin)
		        let g:loaded_gentags#ctags = 1 "Set 1 as disable ctag
		    endif
		else
		    let g:gen_tags#ctags_bin = g:tagbar_ctags_bin
		    "String Type. below is List Type. Different Way to add 2
                    "let g:gen_tags#ctags_opts = '--fields=+niazS '
                    "let g:gen_tags#ctags_opts .= '--extras=+q ' string

		    let g:gen_tags#ctags_opts =  ['--fields=+niazS','--extras=+q']
		    let g:gen_tags#ctags_opts += ['--c++-kinds=+px', '--c-kinds=+px']
		    let g:gen_tags#ctags_opts += ['--output-format=e-ctags','--exclude=*.mk']
                endif

		let g:tagbar_width      = 30
		let g:tagbar_sort       = 0
		let g:tagbar_autoclose  = 0
	"}
	" gtags {
		"let $GTAGSLABEL = 'native'
		let $GTAGSCONF = '/proj/mtk16125/bin/global/share/gtags/gtags.conf'
		" Copy to $HOME/.globalrc
	" }
	" gen_tags {
		let g:gen_tags#gtags_bin = '/proj/mtk16125/bin/global/bin/gtags'
		if !executable(g:gen_tags#gtags_bin)
	            let g:loaded_gentags#gtags = 1 "Set 1 as disable gtags
	        else
		    let g:gen_tags#gtags_default_map = 1 "using cscope key mapping
		endif

		let g:gen_tags#use_cache_dir = 0 " 0:cache @ <project folder>/.git/tags_dir
		let g:gen_tags#verbose       = 1
		let g:gen_tags#statusline    = 1
		let g:gen_tags#blacklist     = ['$HOME', '$HOME/.vim']

	" }
	"plugin:airline"{
		"let g:airline_theme="powerlineish"
		let g:airline_theme = "light"
		let g:airline_powerline_fonts = 1	" Enable triangle symbol in vim

		if !exists("g:airline_symbols")
			let g:airline_symbols = {}
		endif
		if has('gui_running')		" Add this section can enable Gvim with correct symbol
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
	"
	" plugin:ag {
		let g:ag_working_path_mode = 'r'
		let g:ag_highlight         = 1
	" }
	"
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
	" plugin:Incsearch { " ======== Incsearch ========
		map /   <Plug>(incsearch-easymotion-/)
		map ?   <Plug>(incsearch-easymotion-?)
		map g/  <Plug>(incsearch-easymotion-stay)
		map z/  <Plug>(incsearch-fuzzy-/)
		map z?  <Plug>(incsearch-fuzzy-?)
		map zg/ <Plug>(incsearch-fuzzy-stay)
                ""nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
	" }
	" plugin:vim-cpp-enhanced-highlight {
		let g:cpp_class_scope_highlight           = 1
		"let g:cpp_member_variable_highlight       = 1
		"let g:cpp_class_decl_highlight            = 1
		let g:cpp_experimental_template_highlight = 1
	" }
	" plugin:EnhCommentify {
		let g:EnhCommentifyPretty = 'yes'	"Add space in comment"
		let g:EnhCommentifyAlighRight = 'yes'
	" }
	" LeaderF {
	if has('python') || has('python3')
		let g:Lf_ShortcutF = '<C-F>'
                let g:Lf_Ctags = g:tagbar_ctags_bin
	endif
	" }
	"
	" plugin:vim-grepper {
		let g:grepper = {
		    \ 'tool' : ['ag','grep'],
		    \ 'open' : 1,
		    \ 'quickfix' : 1,
		    \ 'switch' : 1,
		    \ 'prompt' : 1,
		    \}
"                 let g:grepper.quickfix = 1	"Open quickfix after search finished
"                 let g:grepper.open     = 1    "using quickfix window
"                 let g:grepper.switch   = 1    "swtich to quickfix after search
"                 let g:grepper.prompt   = 1    "Show prompt by default
"                 let g:grepper.tools    = ['ag','grep']

                nnoremap <Leader>/ :Grepper<CR>
                nnoremap <Leader>* :Grepper -cword -noprompt<CR>

	" }
	"
	"  plugin:leader-clipboard {
		let g:leader_clipboard#key_mapping = ['vcy', 'npp']
	"  }
	"
	if using_NERD "plugin:NERDTree {
"                    let g:NERDTreeWinPos  = "left"
"                    let NERDChristmasTree = 1
"                    let NERDTreeChDirMode = 1
"                    let NERDTreeIgnore    = ['\.o$', '\.ko$', '\~$', '\.dir$', '\.out$']
	    "}
	    "
	    "plugin:NERDTree-Tab"{
"                    let g:nerdtree_tabs_open_on_console_startup = 0
"                    let g:nerdtree_tabs_open_on_gui_startup     = 0		"Not turn on NERD while gvim or macvim
"                    let g:nerdtree_tabs_autoclose               = 1
"                    let g:nerdtree_tabs_no_startup_for_diff     = 1         "Keep off whil in vimdiff mode
	    "}
	endif " NERDTree
	"
" }
