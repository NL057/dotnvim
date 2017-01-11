#!/bin/bash

echo 'Looking for nvim in $PATH'
command -v nvim >/dev/null 2>&1 || { echo "Nvim required, but not foud.  Aborting." >&2; exit 1; }

nvimdir="$XDG_CONFIG_HOME/nvim"
if [ -d ${nvimdir} ];then
    echo "Moving existing nvim config directory to nvim.bak."
    mv "${nvimdir}" "${nvimdir}.bak"
fi

mkdir -p "${nvimdir}" && cd "${nvimdir}"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat>>"${nvimdir}/init.vim"<<EOF

"================================ Plugins =====================================
call plug#begin('~/.config/nvim/bundles')

Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentline'
Plug 'Konfekt/FastFold'
Plug 'sjl/gundo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-ragtag' 
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-repeat' 
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vinarise.vim'
Plug 'godlygeek/tabular'
Plug 'metakirby5/codi.vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim', { 'for': 'html' } 
Plug 'gregsexton/MatchTag', { 'for': 'html' } 
Plug 'othree/html5.vim', { 'for': 'html' } 
Plug 'mustache/vim-mustache-handlebars' 
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] } 
Plug 'vim-scripts/closetag.vim', { 'for': ['xml', 'html'] }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } 
Plug 'moll/vim-node', { 'for': 'javascript' } 
Plug 'othree/yajs.vim', { 'for': 'javascript' } 
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } 
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } 
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } 
Plug 'groenewege/vim-less', { 'for': 'less' } 
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } 
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } 
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } 
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } 
Plug 'tpope/vim-markdown', { 'for': 'markdown' } 
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Shougo/deoplete-zsh'
Plug 'Shougo/deoplete-go'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'rking/ag.vim'
Plug 'tsukkee/unite-help'
Plug 'noahfrederick/vim-skeleton'
Plug 'pbrisbin/vim-mkdir'

call plug#end()
"================================ General ====================================="
autocmd! bufWritePost init.vim source %
set nocompatible
set autoread
set history=4096
set backupdir=~/.config/nvim/.backupdir
set backup
set writebackup
set noswapfile
set undolevels=65535
set undoreload=65535
set undofile
set undodir=$HOME/.config/nvim/undo
set vfile=/home/jroskam/.config/nvim/messages
set ttyfast
set novisualbell
set autowrite
set mouse=
set ve=block
"================================ Appearance =================================="
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldclose=
set splitbelow
set splitright
set wildmode=full
set wildmenu 
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set so=8
set hidden
set showcmd
set noshowmode
set showmatch
set mat=2
set title
set noerrorbells
set visualbell
set t_vb=
set tm=500
set ls=2 stal=2
set invlist
set nolist
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>
nmap <leader>. <c-^>
nnoremap <leader>i :set cursorline!<cr>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set t_Co=256
set background=dark
colorscheme molokai
hi Normal ctermbg=none
hi Visual ctermbg=016
set number  
set rnu
set tw=80   
set nowrap  
set fo-=t   
set colorcolumn=81
set mouse=
"================================ Mappings ===================================="
let mapleader = ","
nmap ; :
nmap <leader><space> :%s/\s\+$<cr>
noremap Q <NOP>
noremap <C-n> :nohl<CR>
noremap <C-Z> :update<CR>
noremap <Leader>e :quit<CR>  
noremap <Leader>E :qa!<CR>   
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv
nmap > >>
nmap < <<
vmap Q gq
cmap Q q
cmap W w
nmap <leader><space> :%s/\s\+$<cr>
nmap <F11> :resize -2<cr>
nmap <F12> :resize +2<cr>
imap <C-K>     <Plug>(neosnippet_expand_or_jump)
smap <C-K>     <Plug>(neosnippet_expand_or_jump)
xmap <C-K>     <Plug>(neosnippet_expand_target)
nmap <Leader>$ $<BS>
nmap <leader><CR> $<BS><C-]>
nmap <Leader>m :bn<CR>
nmap <Leader>n :nohl<CR>
nmap <C-CR> <C-]>
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
nnoremap <Leader>Z :set nofoldenable<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <Leader>! :VimuxPromptCommand<CR>
nnoremap <Leader>c! :VimuxCloseRunner<CR>
nmap <Leader>i :set cul!<CR>
nmap <Leader>l :set list!<CR>
autocmd FileType help map <buffer> q :q<CR>
autocmd FileType help map <buffer> <CR> <C-]>
nmap <Leader>/ zc
nmap <F8> :VimF
"================================ Other ======================================="
set history=5000
set undolevels=65535
set undoreload=65535
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set noswapfile
set ttyfast
set novisualbell
set matchtime=1
set timeoutlen=1500
set pvh=20
set sidescrolloff=10
set backspace=indent,eol,start
set matchpairs=(:),{:},[:],":",<:>

"================================ Autocmd ====================================="
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufEnter *.json set conceallevel=0
autocmd BufReadPost * hi Normal ctermbg=none
autocmd FileType nerdtree hi Normal ctermbg=none
autocmd BufEnter * lcd %:p:h
autocmd BufReadPre *zshrc set foldmethod=marker
autocmd BufRead *.theme.zsh set filetype=zsh_theme
autocmd BufRead _* set filetype=zsh

"================================ Plugin-conf ================================="
"=====AirLine====="
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 0
"================="
"=====Deoplete===="
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
"================="
"======Jedi======="
"================="
EOF

nvim -c 'PlugInstall|q|q' -- ~/.config/nvim/init.vim
