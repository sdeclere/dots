" VIMRC
let mapleader = " "

set number " show line numbers
set relativenumber "turn on relative line numbers
set showmatch "Highlight matching parenthesis
set title "set terminal title
set autochdir "Change CWD when I open a file
set path+=** "search current directory recursively
syntax on
set ignorecase "enable case insensitive searching
set smartcase "all searches are case insensitive unless there's a capital letter
set incsearch "enable incremental searching
set wrap " wrap lines
set encoding=utf-8 "encoding set to utf-8

set nohlsearch "disable all highlighted search results
set mouse=a "Enable mouse support
set clipboard+=unnamedplus "Copy/paste to system clipboard

set autoindent " indent when moving to the next line
set tabstop=4 "tabs=4spaces
set shiftwidth=4 "whitespace by level of indentation

if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set noswapfile "Don't use swapfile
  set undofile                    "turn on the feature
endif

set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:.
set list

" compltion menu wild
set wildmenu

" autocmp
set completeopt=longest,menuone

"remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" netrw
let g:netrw_banner=0 "gets rid of the annoying banner for netrw
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv = 1		" change from left splitting to right splitting
let g:netrw_liststyle=3		" tree style view in netrw

"a automatically close brackets, parethesis, double quotes, and single quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {; {};<left><left>
inoremap /* /**/<left><left>

" keymaps
nnoremap <leader>dd :25Lexplore %:p:h<CR>
nnoremap <Leader>da :25Lexplore<CR>

" buffer navigation
nnoremap <Tab> :bnext<CR>

" statusline
set laststatus=2
set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ Line:%l\/%L\ Column:%c%V\ %P


" ### PLUGINS ###
" Install Plugin manager before :
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

" themes gruvbox
set t_Co=256
colorscheme gruvbox
"let g:gruvbox_termcolors=16
set bg=dark

