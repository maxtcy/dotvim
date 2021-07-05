
autocmd! bufwritepost $MYVIMRC source $MYVIMRC                      "Make change effect right the way

filetype on                     "Detect file tpye
filetype plugin on              "By diff file type with diff indent
filetype indent on

set ai           				"Auto Indent
set nu
set autowrite					"Automatically save before commands like :next and :make
set background=dark
set clipboard=unnamedplus
set cursorline   				"Show current cursor
set colorcolumn=80 				"Line Length over 90
set encoding=utf8
set history=50  				"Keep command used.
set hlsearch	 				"High Light Search
set incsearch					"Incremental search
set laststatus=2
set mouse=a					    "Enable mouse usage
set nocompatible
" ++ Indent Related ++
set smarttab
set autoindent
set shiftwidth=4 		"Impact Tab behavior,
set tabstop=4    		"Impact Display show Width, but not Tab behavior
"set expandtab	 		"Impact insert tab with specific space count. count is the same as tabstop

set t_Co=256	 		"Powerline color setting
set viminfo+='500,n~/.vim/viminfo

autocmd FileType c,cpp set tabstop=4 shiftwidth=4 noexpandtab		"Change tabwidth while *.c *.cpp
autocmd FileType c,cpp set list lcs=tab:\|\                         "Put space here on purpose

" Platform identification { " schme using by OS type
	silent function! OSX()
		return has('macunix')
	endfunction
	silent function! LINUX()
		return has('linux') && has('unix') && has('macunix') && !has('win32unix')
	endfunction

	if filereadable( expand("$HOME/.vim/colors/atom-dark-256.vim"))
		colorscheme atom-dark-256
	endif

	if &term == 'screen'
		colorscheme atom-dark
	endif
" }

augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"automated installation of vimplug if not installed
if empty(glob('$HOME/.vim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')	"Make sure you use single quotes
"plugin:{ "core plugins
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    "Plug 'itchyny/lightline.vim'
    "Plug 'mengelbrecht/lightline-bufferline'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'

	Plug 'vim-scripts/AutoClose'
	Plug 'vim-scripts/YankRing.vim'
	Plug 'vim-scripts/EnhCommentify.vim'
	Plug 'tpope/vim-vinegar'
	Plug 'gcmt/wildfire.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'ntpeters/vim-better-whitespace'

	Plug 'ludovicchabant/vim-gutentags'
	Plug 'skywind3000/gutentags_plus'
    Plug 'skywind3000/vim-preview'

	Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	if !(system('uname -s') =~ 'MINGW64')
	    Plug 'Yggdroot/LeaderF', { 'do': './install.sh'}
	endif

	Plug 'vim-scripts/Align'
	Plug 'qpkorr/vim-bufkill'

	Plug 'rking/ag.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'mhinz/vim-signify'					"Something like gitgutter
	Plug 'terryma/vim-multiple-cursors'

	Plug 'easymotion/vim-easymotion'
	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/incsearch-easymotion.vim'

	Plug 'octol/vim-cpp-enhanced-highlight'		"C++ Syntax Enhance C++11/14
	Plug 'derekwyatt/vim-protodef'
	Plug 'farmergreg/vim-lastplace' 			"reopen files at your last edit positioN

	Plug 'powerman/vim-plugin-AnsiEsc'			"Ansi Escape Code
	Plug 'markabe/bufexplorer'

	Plug 'jremmen/vim-ripgrep'

	if !filereadable( expand("$HOME/.vim/colors/atom-dark-256.vim"))
		Plug 'gosukiwi/vim-atom-dark'
	endif
"}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Key Mapping" {
	"key for Generic {
		let mapleader="\\"
	" }
	"key for build code {
	"	noremap <silent> \j :make -j16<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
	"	noremap <silent> \b :cd ../;make bootimage -j16; cd kernel<cr> :TagbarToggle<cr>:cw<cr>:TagbarToggle<cr>
	" }
	"key for Plugins{
		nnoremap <silent>z<F1>   :winc j<cr>:bd<cr>
		nnoremap <silent>a<F1>   :Buffers<cr>
		nnoremap <silent> <F1>   :FZF -i<cr>
		nnoremap <silent> <F2>   :wincmd p<cr>							"Switch Window
		nnoremap <silent> <F3>   <cr>
		nnoremap <silent> <F4>   <cr>
		nnoremap <silent> <F5>   :%s/\s\+$//g<cr>						"Remove tail space
		nnoremap <silent> <F6>   :PreviewTag<cr>						"vim-preview
		nnoremap <silent>/<F6>   :PreviewClose<cr>						"QuickFix Last message
		nnoremap <silent> <F7>   :YRShow<cr>
		nnoremap <silent> <F8>   :cn<cr>								"QuickFix Next message
		nnoremap <silent> <F9>   :botright copen<cr>					"QuickFix Open
		nnoremap <silent> <F10>  :GitGutterLineHighlightsToggle<cr>		"HL Git Diff"
		nnoremap <silent>.<F10>  :GitGutterNextHunk<cr>
		nnoremap <silent>,<F10>  :GitGutterPrevHunk<cr>
		nnoremap <silent>/<F10>  :Gblame<cr>							"Show git blame in vim
		nnoremap <silent> <F11>  :bn<cr>								"Buffer Next
		nnoremap <silent>.<F11>  :bp<cr>								"Buffer Previous
		nnoremap <silent>/<F11>  :bw<cr>								"Buffer Close
		nnoremap <silent> <F12>  :LeaderfFunction!<cr>					"Show Func
		nnoremap <Esc><Esc><Esc> :ccl <CR>

		noremap <m-u> :PreviewScroll -1<cr>
		noremap <m-d> :PreviewSScrol +1<cr>

		" Bind \ (backword slash) to Lunch Ag Search.
		" add '!' can help turn on the 1st search file in the other window
		" Using Ag to search current cursor word."Using Ag to search current cursor word.
		nnoremap <silent> \ag :Ag! -p ~/.agignore <C-R><C-W><CR>
		nnoremap <silent> \ah :Ag! -G h$ -p ~/.agignore <C-R><C-W><CR>
		"nnoremap <silent> \rg :Rg <C-R><C-W><CR>
		nnoremap <silent> \rg :Leaderf rg -S <C-R><C-W><CR>
		nnoremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR>
		nnoremap <Leader>h :<C-U><C-R>=printf("Leaderf! rg -e %s -th", expand("<cword>"))<CR>

		" plugin:incsearch { " ======== incsearch ========
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
		"}
		" plugin LeaderF {
			noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
			noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
			noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
			noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
			noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
		" }
	"}
"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin" {
	"plugin:lightline {
		"set showtabline=2
		"let g:lightline#bufferline#show_number      = 1
		"let g:lightline#bufferline#shorten_path     = 0
		"let g:lightline#bufferline#min_buffer_count = 2
		"let g:lightline#bufferline#unamed           = '[NoName]'

		"let g:lightline                  = {}
		"let g:lightline.colorscheme 	  = 'wombat'
		"let g:lightline.tabline          = {'left':[['buffers']], 'right':[['close']]}
		"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
		"let g:lightline.component_type   = {'buffers': 'tabsel'}
	"}

	"plugin:airline {
		let g:airline_theme = "lucius"
		let g:airline_powerline_fonts = 1	" Enable triangle symbol in vim
		if !exists("g:airline_symbols")
			let g:airline_symbols = {}
		endif
        "if has('gui_running')		" Add this section can enable Gvim with correct symbol
        "    set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline
        "endif

		let g:airline#extensions#whitespace#enabled     = 0

		let g:airline#extensions#tabline#enabled        = 1	" Enable Tabline
		let g:airline#extensions#tabline#tab_nr_type    = 1	" tab number
		let g:airline#extensions#tabline#buffer_nr_show = 1	" Show Buffer number
		let g:airline#extensions#tabline#show_buffers   = 1
		let g:airline#extensions#tabline#fnamecollapse  = 1	" collapsing parent directories in buffer name
        let g:airline#extensions#tabline#fnamemod       = ':t'  "Only show fileName in tab``

		let g:airline#extensions#tagbar#enabled         = 1

		let g:airline#extensions#hunks#non_zero_only    = 1	" git gutter

        let g:airline_inactive_collapse=0

        "let g:airline#extensions#syntastic#enabled     = 1	 " Need extra plugin syntastic [Not used]
        let g:airline#extensions#branch#enabled         = 0  " Disable show git branch info

        let g:airline#extensions#gutentags#enabled      = 0  " Not show Gen Tag string

        let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' "Not show this fileformat
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
	"plugin:globle/gtags {
		if executable('gtags') && executable('gtags-cscope')
			set csprg=/usr/local/bin/gtags-cscope
		endif
        let $GTAGSLABEL = 'native-pygments'
        "let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
	"}
	"plugin:tagbar {
        let g:tagbar_ctags_bin = '/usr/local/bin/ctags' 			"universal-ctags
        if !executable(g:tagbar_ctags_bin)
            let g:tagbar_ctags_bin = '/usr/bin/ctags'
            let g:loaded_gentags#ctags = 1 							"Set 1 as disable ctag
        endif

		let g:tagbar_width      = 30
		let g:tagbar_sort       = 0
		let g:tagbar_autoclose  = 0
	"}
	" plugin:vim-gutentags {
        set statusline+=%{gutentags#statusline()}
        let g:gutentags_modules                  = ['ctags', 'gtags_cscope']

        let g:gutentags_project_root             = ['.root', '.svn', '.git', '.hg', '.project']
        let g:gutentags_exclude_project_root     = ['~/', '/home/max/.vim/']
		let g:gutentags_exclude_filetypes		 = ['*.mk', '*.d']
        let g:gutentags_define_advanced_commands = 1

        let g:gutentags_ctags_extra_args =  ['--fields=+niazS','--extras=+q']
        let g:gutentags_ctags_extra_args += ['--c++-kinds=+px', '--c-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

		let g:gutentags_ctags_exclude = [
			\ '/home/max/.vim/*',
			\ '.git',
			\ '*.mk',
			\]
		" AMD Specific ++++
		let g:gutentags_ctags_exclude = [
			\ '/mnt/c/P4_src/main/drivers/dal/dmub_fw/dmu/include_legacy/*',
			\ '/mnt/c/P4_src/main/drivers/dal/test/*',
			\ '/mnt/c/P4_src/main/drivers/dal/diags_dm/*',
			\ '/mnt/c/P4_src/main/drivers/dal/amdgpu_dm/*',
			\]
		" AMD Specific ----

        let g:gutentags_auto_add_gtags_cscope = 0

        let g:gutentags_ctags_tagfile = '.tags'
        " check ~/.cache/tags exist or not. if not create new.
        let s:hostname = substitute(system('hostname'), '\n', '', '')
        if s:hostname  == 'maxtseng-linux'
            let s:vim_tags = expand('~/.vim/tags')
        else
            let s:vim_tags = expand('~/.cache/tags')
        endif

        let g:gutentags_cache_dir = s:vim_tags
        if !isdirectory(s:vim_tags)
            silent! call mkdir(s:vim_tags, 'p')
        endif

        let g:gutentags_define_advanced_command = 0    "Show More Debug Message

        "augroup MyGutentagsStatusLineRefresher
        "    autocmd!
        "    autocmd User GutentagsUpdating call lightline#update()
        "    autocmd User GutentagsUpdated call lightline#update()
        "augroup END
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
		" let g:fzf_layout = { 'down': '~35%'}
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
		let g:EnhCommentifyPretty     = 'yes'	"Add space in comment
		let g:EnhCommentifyAlighRight = 'yes'
	" }
	" plugin:LeaderF {
		if executable(g:tagbar_ctags_bin)
			let g:Lf_Ctags = g:tagbar_ctags_bin
		endif
		let g:Lf_WindowPosition = 'bottom'
		let g:Lf_StlSeparator = { 'left': '', 'right': '' }
		"let g:Lf_GtagsStoreInProject = '/local/mnt/workspace/.cache/tags'
		if has('python') || has('python3')
			let g:Lf_ShortcutF = '<C-F>'
		endif

		let g:Lf_StlColorscheme = 'powerline'
		let g:Lf_WildIgnore = {
				\ 'dir': ['.svn','.git','.hg'],
				\ 'file': ['*.d','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
				\}

		let g:Lf_NormalMap = {
			\ "File": 		[["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
			\ "Function":	[["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
			\}

		let g:Lf_GtagsAutoGenerate = 1
		let g:Lf_Gtagslabel     = 'native-pygments'
		let g:Lf_Gtagsconf      = "$HOME/.globalrc"
		let g:Lf_PreviewInPopup = 1

		let g:Lf_PreviewInPopup = 1
		let g:Lf_WindowHeight   = 0.30
		let g:Lf_StlColorscheme = 'powerline'
		let g:Lf_PreviewResult  = {
				\ 'File'        : 0,
				\ 'Buffer'      : 0,
				\ 'Mru'         : 0,
				\ 'Tag'         : 0,
				\ 'BufTag'      : 1,
				\ 'Function'    : 0,
				\ 'Line'        : 1,
				\ 'Colorscheme' : 0,
				\ 'Rg'          : 1,
				\ 'Gtags'       : 1
				\}
	" }
	" plugin:lastplace {
		let g:lastplace_ignore         = "gitcommit,gitrebase,svn,hgcommit"
		let g:lastplace_ignore_buftype = "quickfix.nofile,help"
	" }
	" plugin:incsearch {
		set hlsearch
		let g:incsearch#auto_nohlsearch = 1
	" }
	"plugin:vim-ripgrep {
		let g:rg_command = 'rg --vimgrep -S'
	" }
	" plugin: vim-preview {
		autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
		autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
	" }
" }




