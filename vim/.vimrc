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
\ '~/git/Old-Projects/cos226/notes', '~/git/Personal-Projects/cos318/notes',
\ '~/git/Personal-Projects/cos326/notes', '~/git/Personal-Projects/cos398/notes',
\ '~/git/Personal-Projects/cos461/notes', '~/git/Personal-Projects/cos432/notes',
\ '~/git/Personal-Projects/quadcopter/notes']
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

" Scroll before cursor reaches bottom of the screen "
set scrolloff=10

" Set visual options for gvim "
if has('gui_running')
    colorscheme xoria256
    colorscheme aptana

" Set visual options for console vim "
else
endif

" Key Mappings "
map <C-c> y
map <C-x> x
map <C-v> P
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
map ; @
inoremap <S-CR> <ESC>

" Macros "
let @f = "mfgg=G'f"
let @c = "0i<!-- $a -->j"
let @u = "0d5l$d4hj"


" Custom Functions "

" Removes all trailing white space "
function! Strip_trailing_ws()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
command! -nargs=* StripTws call Strip_trailing_ws()

" Replaces carriage returns with newlines "
function! Replace_cr_newline()
    let l = line(".")
    let c = col(".")
    %s/\r/\r/g
    call cursor(l, c)
endfunction

" Replaces carriage returns with spaces "
function! Replace_cr_space()
    let l = line(".")
    let c = col(".")
    %s/\r/\ /g
    call cursor(l, c)
endfunction


" Auto commands "

" Auto reload vimrc on change"
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
"    \ | if has('gui_running') && filereadable($MYGVIMRC) | so $MYGVIMRC | endif
augroup END


" MAC Only "
nnoremap ,v :e /Users/Lance/.vimrc<CR>
if has('gui_running')
    set guifont=Inconsolata\ for\ Powerline:h14
endif

" Ubuntu Only "
" nnoremap ,v :e ~/.vimrc<CR>
" if has('gui_running')
"     set guifont=Ubuntu\ Mono\ 12
" endif

" Windows Only "
" nnoremap ,v :e C:\Users\lgoodrid\Documents\vim\_vimrc<CR>
" cd C:\Users\lgoodrid\Desktop\Notes
" if has('gui_running')
"     set guifont=Consolas:h10:cANSI
" endif
