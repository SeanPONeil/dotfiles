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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

let g:coc_global_extensions = [
      \ 'coc-groovy',
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-actions',
      \ 'coc-html',
      \ 'coc-angular',
      \ 'coc-tsserver',
      \ 'coc-tslint',
      \ 'coc-yaml',
      \ 'coc-fzf-preview',
      \ 'coc-sh',
      \ 'coc-toml',
      \ 'coc-docker',
      \ 'coc-xml',
      \ 'coc-go',
      \ 'coc-snippets',
      \ 'coc-highlight',
      \ 'coc-pyright',
      \ 'coc-markdownlint',
      \ 'coc-vimlsp',
      \ 'coc-sql',
      \ 'coc-yank',
      \ 'coc-css',
      \ 'coc-solargraph',
      \ 'coc-lists',
      \ 'coc-pairs',
      \ 'coc-explorer',
      \ 'coc-snippets',
      \ 'coc-floaterm',
      \]

" mouse support because I suck
set mouse=a

" Use vim settings instead of vi settings
set nocompatible

" Don't complain about node version
let g:coc_disable_startup_warning = 1

" colorize hex values automatically
let g:colorizer_auto_color = 1

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python2"

colorscheme wal
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'cocstatus':  'coc#status',
      \   'blame': 'LightlineGitBlame',
      \ },
    \ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Always show last status
set laststatus=2

" Use autocmd to force lightline update.
autocmd User CocGitStatusChange,CocStatusChange,CocDiagnosticChange call lightline#update()

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

" prefix all fzf commands with 'Fzf', e.g. :FzfFiles, :FzfAg, etc.
let g:fzf_command_prefix = 'Fzf'

" Map fzf to ctrl - space
nnoremap <silent> <C-p> :FZF<CR>

" Fuzzy find Vim commands with alt - space
nnoremap <A-@> :Commands<CR>

" Map ctrl + enter to new vsplit
nnoremap <c-ENTER> :vsplit<CR>

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

" https://vim.fandom.com/wiki/Fix_syntax_highlighting
autocmd BufEnter * :syntax sync fromstart
autocmd FileType javascript syn sync ccomment javaScriptComment
set redrawtime=10000

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

" let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
" let g:ranger_replace_netrw = 1 " open ranger when vim open a directory


"
"
"  coc.nvim
"
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `[G` and `]G` to navigate git hunks
nmap <silent> [G <Plug>(coc-git-prevchunk)
nmap <silent> ]G <Plug>(coc-git-nextchunk)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Add `:TrimWhitespace` command to trim whitespace from current buffer
command! TrimWhitespace call TrimWhitespace()

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Format current buffer with Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show lists
nnoremap <silent><nowait> <space>l :<C-u>CocList<cr>
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Show git lists
nnoremap <silent><nowait> <space>g  :<C-u>CocList --normal gstatus<CR>
" Open coc-explorer
:nmap <space>e :CocCommand explorer<CR>
