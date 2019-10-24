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
Plugin 'fatih/vim-go'
Plugin 'genutils'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'paranoida/vim-airlineish'
Plugin 'prettier/vim-prettier'
Plugin 'python/black'
Plugin 'Raimondi/delimitMate'
Plugin 'shougo/neocomplete'
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tclem/vim-arduino'
Plugin 'toyamarinyon/vim-swift'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

" Finish Vundle setup "
call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""
" PLUGIN OPTIONS
"""""""""""""""""""""""""""""

" Vim notes Options "
let g:notes_directories = ['~/notes']
let g:notes_suffix = '.vn'
let g:notes_unicode_enabled=1
let g:notes_smart_quotes=1

" Latex Options "
let g:tex_conceal = ""

" NERDTree Options "
autocmd bufenter * if (winnr("$") == 1 &&
\ exists("b:NERDTreeType") && b:NERDTreeType == "primary")
\ | q | endif

" Tagbar Options "
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=30

" Airline Options "
if has('gui_running')
    set laststatus=2
    let g:airline_theme='airlineish'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#hunks#enabled = 1
endif

" Syntastic Options "
let g:syntastic_quiet_messages={"level": "warnings"}
let g:syntastic_quiet_messages={"type": "style"}
let g:syntastic_warning_symbol = 'WW'
let g:syntastic_error_symbol = 'EE'
let g:syntastic_ocaml_checkers = ['merlin']

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

" Neosnippets options "
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Merlin Options "
" let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Prettier Options "
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Python Black Options "
let g:black_linelength = 80

" Vim Go Options "
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


"""""""""""""""""""""""""""""
" KEY MAPPINGS
"""""""""""""""""""""""""""""

" Enable IDE-esque plugins with control shortcuts "
noremap <C-a> :NeoCompleteToggle<CR>
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-t> :TagbarToggle<CR>

" Use macros with ';' "
noremap ; @

" Navigate wrapped lines like broken ones "
nnoremap j gj
nnoremap k gk

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

" Neocomplete key mappings "
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

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

" MAC Only "
nnoremap ,v :e ~/.vimrc<CR>
nnoremap ,b :e ~/.bashrc<CR>
nnoremap ,f :Black<CR>
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
