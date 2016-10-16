" Set up Vundle "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Added plugins "
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'genutils'
Plugin 'majutsushi/tagbar'
Plugin 'paranoida/vim-airlineish'
Plugin 'Raimondi/delimitMate'
Plugin 'shougo/neocomplete'
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdcommenter'
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

" Neocomplete Options "
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#source#synatx#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_patter = '\*ku\*'

" Neocomplete dictionary and keywords "
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Neocomplete omni completion "
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Neocomplete key mappings "
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Neosnippets options "
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Neosnippets key mappings "
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrReturnEmptyString()<CR>
function! s:ExpandSnippetOrReturnEmptyString()
    if pumvisible()
        if neosnippet#expandable()
            return "\<Plug>(neosnippet_expand)"
        else
            return "\<C-y>\<CR>"
        endif
    else
        return "\<CR>"
endfunction

" Neosnippets tab display / cycle "
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NERDTree Options "
autocmd bufenter * if (winnr("$") == 1 &&
\ exists("b:NERDTreeType") && b:NERDTreeType == "primary")
\ | q | endif

" Tagbar Options "
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=30

" Notes Options "
let g:notes_directories = ['~/git/Personal-Projects/notes', '~/Notes',
\ '~/git/Old-Projects/cos226/notes', '~/git/Old-Projects/cos318/notes',
\ '~/git/Old-Projects/cos326/notes', '~/git/Personal-Projects/cos398/notes',
\ '~/git/Old-Projects/cos432/notes', '~/git/Old-Projects/cos461/notes',
\ '~/git/Personal-Projects/cos418/notes', '~/git/Personal-Projects/cos498/notes',
\ '~/git/Personal-Projects/cos516/notes',
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

" Vim Go Options "
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

" Latex Options "
let g:tex_conceal = ""

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
set scrolloff=8

" Set visual options for gvim "
if has('gui_running')
    colorscheme xoria256
    colorscheme xuphoria

" Set visual options for console vim "
else
endif

" General Key Mappings "
let mapleader=" "
map <C-c> y
map <C-x> x
map <C-v> P
map <C-a> :NeoCompleteToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
map ; @
map <Leader>j }
map <Leader>k {
map <Leader>w <C-w>
inoremap <S-CR> <ESC>

" Go-specific key mappings "
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au Filetype go nmap <Leader>d <Plug>(go-doc)
au Filetype go nmap <Leader>i <Plug>(go-info)
au Filetype go nmap <Leader>v <Plug>(go-vet)

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
nnoremap ,v :e ~/.vimrc<CR>
nnoremap ,b :e ~/.bashrc<CR>
if has('gui_running')
    set guifont=Inconsolata\ for\ Powerline:h14
endif

" Fedora Only "
" nnoremap ,v :e ~/.vimrc<CR>
" if has('gui_running')
"     set guifont=Inconsolata\ Medium\ 11
" endif

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
