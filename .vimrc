" install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-sensible'     " sets some normal standards
Plug 'tpope/vim-eunuch'       " unix commands (especially :SudoWrite)
Plug 'tpope/vim-vinegar'      " better netrw
Plug 'tpope/vim-fugitive'     " git functions
Plug 'tpope/vim-commentary'   " add coments with `gcc`
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'ryanoasis/vim-devicons' " always last

call plug#end()

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

lua vim.opt.termguicolors = true
lua require("noice").setup()

set completeopt=menu,menuone,noselect

" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq

" Resize vim panes when host terminal is resized
autocmd VimResized * wincmd =

set endofline
set fixendofline

filetype on
filetype plugin indent on
syntax on

set noshowmode
set showcmd

" enable line numbers
set number

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Normal clipboard behavior
if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

" backup behavior
set nobackup
set noswapfile
set nowritebackup

" Map fzf to ctrl - space
nnoremap <silent> <C-p> :FZF<CR>

" set list          " Display whitespace characters
set splitbelow    " `:split`'s appear below
set splitright    " `:vsplit`'s appear right

set nofoldenable " Don't automatically fold everything when opening a file

" Set automatic case sensitive search
" /test - case insensitive
" /Test - case sensitive
set smartcase

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set autoindent
set smartindent

" map smashing jk to escape
inoremap jk <esc>
inoremap kj <esc>

set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

