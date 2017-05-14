"<-----------------<>------------------>"
"   Speedlight NeoVim configuration     "
"       For saltedbox repository        "
" https:/github.com/speedlight/dotfiles "
"<-----------------<>------------------>"

" Required:
set runtimepath+={{ grains.homedir }}/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('{{ grains.homedir }}/.config/dein/')
    call dein#begin('{{ grains.homedir }}/.config/dein/')

    call dein#add('{{ grains.homedir }}/.config/dein/')
    call dein#add('{{ grains.homedir }}/.config/dein/repos/github.com/Shougo/dein.vim')

    " The Shougo collection
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/deoplete.nvim')

    " IDE type
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('vim-airline/vim-airline')

    " Required:
    call dein#end()
    call dein#save_state()
endif

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" All of your Plugins must be added before the following line
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jnurmine/Zenburn'
"Plugin 'kien/ctrlp.vim'
"Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'Yggdroot/indentLine'
"Plugin 'hdima/python-syntax'
"Plugin 'davidhalter/jedi-vim'

" Required:

" Put your non-Plugin stuff after this line
colors Tomorrow-Night-Eighties
set encoding=utf-8
set nu
set laststatus=2
set t_Co=256
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab

let g:airline_powerline_fonts = 1
let g:indentLine_color_term = 239
let python_highlight_all=1

" PEP8 Tabulation
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2

" Keybinds 
let mapleader=","
" F2 para abrir NERDTree
map <F2> :NERDTreeToggle<CR>
" pega sin formato el texto
nmap <MouseMiddle> <esc>
" buffer next/previous
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
" tabs
map + :tabnew<CR>
map - :tabclose<CR>
map <S-Tab> :tabn<CR>
map <S-A-Tab> :tabp<CR>
syntax on
