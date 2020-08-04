call plug#begin()
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'tpope/vim-eunuch'   " unix commands (especially :SudoWrite)
Plug 'tpope/vim-vinegar'  " tpope enhanced netrw
Plug 'itchyny/lightline.vim' " status bar
Plug 'dylanaraps/wal.vim'  " pywal colorscheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/unicode.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim' " .editorconfig linter
Plug 'preservim/nerdcommenter'
call plug#end()

" Don't complain about node version
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-emoji', 'coc-eslint', 'coc-prettier','coc-tsserver', 'coc-tslint', 'coc-tslint-plugin','coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-sh', 'coc-go', 'coc-java', 'coc-git' ]

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python2"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

colorscheme wal
set noshowmode
set showcmd

" enable line numbers
set number

set colorcolumn=80

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

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

" Map fzf to ctrl + p
nnoremap <c-p> :Files<CR>

" Map ctrl + enter to new vsplit
nnoremap <c-ENTER> :vsplit<CR>

" all extra windows pop up at the bottom
set splitbelow

" set tab as 2 spaces
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" On pressing tab, insert spaces or tabs to go to the next indent
set smarttab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

syntax on
set modeline
filetype plugin indent on

set nofoldenable

" Escape
inoremap jk <esc>
inoremap JK <esc>
inoremap Jk <esc>
vnoremap jk <esc>
vnoremap JK <esc>
vnoremap Jk <esc>

" window switching
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
