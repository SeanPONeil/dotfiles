call plug#begin()
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'tpope/vim-eunuch'   " unix commands (especially :SudoWrite)
Plug 'tpope/vim-vinegar'  " tpope enhanced netrw
Plug 'itchyny/lightline.vim' " status bar
Plug 'dylanaraps/wal.vim'  " pywal colorscheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/unicode.vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
" Plug 'editorconfig/editorconfig-vim' " .editorconfig linter
Plug 'preservim/nerdcommenter'
call plug#end()

" Use vim settings instead of vi settings
set nocompatible

" Don't complain about node version
let g:coc_disable_startup_warning = 1

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python2"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

colorscheme wal

filetype on
filetype plugin indent on
syntax on
set modeline

set noshowmode
set showcmd

" enable line numbers
set number


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
nnoremap <c-p> :FZF<CR>

" Fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
" nnoremap <c-p> :Commands<CR>

" Map ctrl + enter to new vsplit
nnoremap <c-ENTER> :vsplit<CR>

set list  " Display whitespace characters
set splitbelow " `:split`'s appear below
set splitright " `:vsplit`'s appear right

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
