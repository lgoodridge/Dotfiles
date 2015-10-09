" Set up Vundle "
set nocompatible           
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Added plugins "
Plugin 'bling/vim-airline'
Plugin 'genutils'
Plugin 'majutsushi/tagbar'
Plugin 'paranoida/vim-airlineish'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tclem/vim-arduino'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'honza/vim-snippets'
Plugin 'toyamarinyon/vim-swift'

" Finish Vundle setup "
call vundle#end()            
filetype plugin indent on    

" Airline Options "
if has('gui_running')
	set laststatus=2
	let g:airline_theme='airlineish'
	let g:airline_powerline_fonts=1
    let g:airline#extensions#hunks#enabled = 1
endif

" NERDTree Options "
autocmd bufenter * if (winnr("$") == 1 && 
\ exists("b:NERDTreeType") && b:NERDTreeType == "primary")
\ | q | endif

" Notes Options "
let g:notes_directories = ['~/git/Personal-Projects/notes', '~/Notes',
\ '~/git/Personal-Projects/cos226/notes', '~/git/Personal-Projects/cos318/notes', 
\ '~/git/Personal-Projects/cos326/notes']
let g:notes_suffix = '.vn'
let g:notes_unicode_enabled=1
let g:notes_smart_quotes=1

" Syntastic Options "
let g:syntastic_quiet_messages={"level": "warnings"}
let g:syntastic_quiet_messages={"type": "style"}
let g:syntastic_warning_symbol = 'WW'
let g:syntastic_error_symbol = 'EE'
let g:syntastic_ocaml_checkers = ['merlin']

" Merlin Options "
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" General Options  "
set tabstop=4
set shiftwidth=4
set softtabstop=4
set clipboard=unnamedplus
set encoding=utf-8
set confirm
set smarttab
set expandtab
set ruler
set nu

" Set visual options for gvim "
if has('gui_running')
    colorscheme xoria256
    colorscheme aptana
    set guifont=Inconsolata\ for\ Powerline:h14
    
" Set visual options for console vim "
else
endif

" Key Mappings "
map <C-c> y
map <C-x> x
map <C-v> P
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
