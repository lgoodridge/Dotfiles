"""""""""""""""""""""""""""""
" .vimrc
"
" Author: Lance Goodridge
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
" PLUGIN INSTALLATION
"""""""""""""""""""""""""""""

" Set up Vundle "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Plugins to install "
Plugin 'bling/vim-airline'
Plugin 'craigemery/vim-autotag'
Plugin 'fatih/vim-go'
Plugin 'fisadev/vim-isort'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mgedmin/python-imports.vim'
Plugin 'paranoida/vim-airlineish'
Plugin 'prettier/vim-prettier'
Plugin 'python/black'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

" Finish Vundle setup "
call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""
" PLUGIN OPTIONS
"""""""""""""""""""""""""""""

" Airline options "
if has('gui_running')
    set laststatus=2
    let g:airline_theme='airlineish'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#hunks#enabled = 1
endif

" Autotag options "
let g:autotagTagsFile=".git/.tags"

" Fzf options "
set rtp+=/usr/local/opt/fzf

" Latex options "
let g:tex_conceal = ""

" NERDCommenter options "
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" NERDTree options "
autocmd bufenter * if (winnr("$") == 1 &&
\ exists("b:NERDTreeType") && b:NERDTreeType == "primary")
\ | q | endif

" Prettier options "
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Python Black options "
let g:black_linelength = 80

" Syntastic options "
let g:syntastic_quiet_messages={"level": "warnings"}
let g:syntastic_quiet_messages={"type": "style"}
let g:syntastic_warning_symbol = 'WW'
let g:syntastic_error_symbol = 'EE'
let g:syntastic_ocaml_checkers = ['merlin']

" Tagbar options "
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=35

" Vim Go options "
let g:go_fmt_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_version_warning = 0

" Vim notes options "
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.vn'
let g:notes_unicode_enabled=1
let g:notes_smart_quotes=1
let g:notes_conceal_url=0

" Vim notes styling "
highlight link notesName Normal


"""""""""""""""""""""""""""""
" VIM OPTIONS
"""""""""""""""""""""""""""""

" Set default encoding to UTF-8 "
set encoding=utf-8

" Show current position "
set ruler

" Show line numbers "
set nu

" Enable mouse use in all modes "
set mouse=a

" Set all tabs to be 4 spaces wide "
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use soft tabs "
set expandtab
set smarttab

" Open new files in split window (instead of current) "
set splitright
set splitbelow

" Notify user of unsaved changes when quitting "
set confirm

" Fix backspace
set backspace=indent,eol,start

" Scroll before cursor reaches bottom of the screen "
set scrolloff=8

" Use the system clipboard "
if system('uname -s') == "Darwin\n"
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" Prevent quote concealment for JSON files "
set conceallevel=0

" Set where to find tags "
set tags^=./.git/tags;

" Ensure 256 color mode is set (for tmux, etc.) "
if &term == "screen"
    set t_Co=256
endif


"""""""""""""""""""""""""""""
" TAB COMPLETION
"""""""""""""""""""""""""""""

set wildmode=list:longest,list:full

" Insert tab if at beginning of line, do completion otherwise "
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-p>

" Tab complete scan buffers:     "
" .  current buffer              "
" b  other loaded buffers        "
" u  unloaded buffers            "
" w  buffers from other windows  "
" t  tag completion              "
set complete=.,b,u,w,t,]

" Custom keyword list "
set complete+=k~/.vim/keywords.txt


"""""""""""""""""""""""""""""
" KEY MAPPINGS
"""""""""""""""""""""""""""""

" Enable IDE-esque plugins with control shortcuts "
noremap <C-n> :NERDTreeToggle<CR> <c-w>=
noremap <C-t> :TagbarToggle<CR> <c-w>=

" Use macros with ';' "
noremap ; @

" Navigate wrapped lines like broken ones "
nnoremap j gj
nnoremap k gk

" Add newlines w/o entering insert mode with <Enter> "
nnoremap <Enter> o<ESC>

" Map jj to Esc in insert mode "
inoremap jj <Esc>

" Set leader key to space "
let mapleader=" "

" Navigate windows with leader key "
map <Leader>w <C-w>

" Go-specific key mappings "
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au Filetype go nmap <Leader>d <Plug>(go-doc)
au Filetype go nmap <Leader>i <Plug>(go-info)
au Filetype go nmap <Leader>v <Plug>(go-vet)

" Python-specific key mappings "
au FileType python noremap ,f :Black<CR>
au FileType python noremap ,i :ImportName<CR>
au FileType python noremap ,s :Isort<CR>


"""""""""""""""""""""""""""""
" SAVED MACROS
"""""""""""""""""""""""""""""

" Auto format document "
let @f = "mfgg=G'f"

" Add HTML comment to line "
let @c = "0i<!-- $a -->j"

" Remove HTML comment from line "
let @u = "0d5l$d4hj"


"""""""""""""""""""""""""""""
" CUSTOM FUNCTIONS
"""""""""""""""""""""""""""""

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

" Replaces hard tabs with spaces "
function! Fix_tabs()
    set tabstop=4
    retab
endfunction
command! -nargs=* Fixtabs call Fix_tabs()


"""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""

" Auto reload vimrc on change "
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC
augroup END

" Replace tabs with spaces upon writing a Go file "
augroup filetype_go
    au!
    au BufWrite *.go set expandtab | retab
augroup END

" Reformat python files with Black on save "
" autocmd BufWritePre *.py execute ':Black'


"""""""""""""""""""""""""""""
" COLOR / STYLE OPTIONS
"""""""""""""""""""""""""""""

syntax on
colorscheme xoria256
colorscheme xuphoria


"""""""""""""""""""""""""""""
" SYSTEM SPECIFIC OPTIONS
"""""""""""""""""""""""""""""

" Unix Options "
if has('unix')
    nnoremap ,v :e ~/.vimrc<CR>
    nnoremap ,b :e ~/.bashrc<CR>
    if has('gui_running')
        " Set font based on OS (OS X, Fedora, Ubuntu) "
        set guifont=Inconsolata\ for\ Powerline:h14,Inconsolata\ Medium\ 11,Ubuntu\ Mono\ 12
    endif

" Windows Options "
elseif has('win32') || has('win64')
    nnoremap ,v :e C:\Users\lgoodrid\Documents\vim\_vimrc<CR>
    cd C:\Users\lgoodrid\Desktop\Notes
    if has('gui_running')
        set guifont=Consolas:h10:cANSI
    endif
endif
