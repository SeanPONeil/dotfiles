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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'mason-org/mason.nvim',
Plug 'rmagatti/auto-session',
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'memgraph/cypher.vim'
Plug 'craigmac/vim-mermaid'
Plug 'zhaozg/vim-diagram'
Plug 'habamax/vim-asciidoctor'
Plug 'alaviss/nim.nvim'
Plug '2kabhishek/nerdy.nvim'
Plug 'mechatroner/rainbow_csv'
Plug 'b0o/schemastore.nvim',
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

set completeopt+=menu,menuone,popup,preview,fuzzy

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

" Map Telescope to ctrl - p
nnoremap <silent> <C-p> :Telescope<CR>

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



lua require('init')
