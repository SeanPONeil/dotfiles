call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-sensible'     " sets some normal standards
Plug 'tpope/vim-eunuch'       " unix commands (especially :SudoWrite)
Plug 'tpope/vim-vinegar'      " better netrw
Plug 'tpope/vim-fugitive'     " git functions
Plug 'tpope/vim-commentary'   " add coments with `gcc`
Plug 'itchyny/lightline.vim'  " status bar
Plug 'seanponeil/wal.vim'     " pywal colorscheme
Plug 'chrisbra/unicode.vim'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim' " .editorconfig linter
Plug 'preservim/nerdcommenter'
Plug 'vim-test/vim-test'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rbgrouleff/bclose.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'chrisbra/Colorizer'
" Plug 'beeender/Comrade'           " intellij neovim link
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'hunner/vim-plist'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'glench/vim-jinja2-syntax'
Plug 'tfnico/vim-gradle'
Plug 'udalov/kotlin-vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/vim-cfr'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'vim-scripts/nc.vim--Eno'      " gcode syntax highlighter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'ryanoasis/vim-devicons' " always last
Plug 'preservim/nerdtree'
" Plug 'chrisbra/csv.vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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

" mouse support because I suck
set mouse=a

" Use vim settings instead of vi settings
set nocompatible

" colorize hex values automatically
let g:colorizer_auto_color = 1

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python2"

let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'git', 'diagnostic', 'filename', 'method' ]
      \   ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ]
      \   ],
      \ },
    \ }

" Always show last status
set laststatus=2

" Resize vim panes when host terminal is resized
autocmd VimResized * wincmd =

set endofline
set fixendofline

filetype on
filetype plugin indent on
syntax on
set modeline

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

" Fuzzy find Vim commands with alt - space
nnoremap <A-@> :Commands<CR>

set list          " Display whitespace characters
set splitbelow    " `:split`'s appear below
set splitright    " `:vsplit`'s appear right
set scrolloff=40  " always show 20 lines below my cursor

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

" window switching with ctrl - h/j/k/l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" tab switching with ctrl - left/right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

