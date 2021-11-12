" Gotta be first
set nocompatible " Use Vim settings rather than Vi

" ########
" Settings
" ########

set exrc    " enable project specific vimrc

" =============================
" General Configuration Options
" =============================

set backspace=indent,eol,start " Allow various backspacing
set history=1000               " Set bigger history for commands
set showcmd                    " Show incomplete commands at the bottom
set showmode                   " Show current mode at the bottom
set autoread                   " Re-read files if unmodified inside vim
set hidden                     " Manage multiple buffers effectively

" ======================
" User Interface Options
" ======================

set laststatus=2     " Always display the status bar
set ruler            " Always show cursor position
set wildmenu         " Display cmdline tab completion as menu
set tabpagemax=40    " Maximum number of tab pages
set cursorline       " Highlight current line
set number           " Show line numbers on the sidebar
set relativenumber   " Show line number on current line and relative on others
set visualbell       " Flash screen on errors
set title            " Reflect file currently being edited

" -------------------
" Color Configuration
" -------------------

colorscheme solarized  " Set color scheme
set background=dark    " Use colors that suit a dark background

" ============================
" Swap and Backup File Options
" ============================

set noswapfile
set nobackup
set nowb

set directory=$HOME/.vim/swap//    " The `//` tell vim to use absolute path
set backupdir=$HOME/.vim/backup//

set undofile                       " Maintain undo history between sessions
set undodir=$HOME/.vim/undo//

" ===================
" Indentation Options
" ===================

set autoindent              " New lines inherit indentation of previous lines
filetype plugin indent on   " Smart auto indentation
set tabstop=4               " Show existing tab with 4 spaces
set shiftwidth=2            " Use 2 spaces when indenting
set expandtab               " Insert spaces instead of tab
set nowrap                  " Do not wrap lines

" ==============
" Search Options
" ==============

set incsearch    " Find the next match as we type the search
set hlsearch     " Highlight searches by default
set ignorecase   " Ignore case when searching ...
set smartcase    " ... unless yout type a capital

" ======================
" Text Rendering Options
" ======================

set encoding=utf-8    " Use an encoding the supports unicode
set linebreak         " Wrap lines at convenient points
set scrolloff=3       " Number of lines to keep above and below cursor
" set sidescrolloff=5   " Number of columns to keep left and right of cursor
syntax enable          " Enable syntax highlighting and set colors

" =====================
" Miscellaneous Options
" =====================

set confirm       " Confirm closing an unsaved file
set nomodeline    " Ignore file's mode lines; use vimrc config instead
"set spell         " Enable spell checking

" ----------
" Elite Mode
" ----------

let g:elite_mode=1    " Enable elite mode, i.e. no arrows!!!

" Disable arrow movement, resize splits instead
if get(g:, 'elite_mode')
  nnoremap <Up> :resize +2<CR>
  nnoremap <Down> :resize -2<CR>
  nnoremap <Left> :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif

" ############
" Key Mappings
" ############

" Show next matched string at the center of the screen
nnoremap n nzz
nnoremap N Nzz

" Make cycling through buffers more effective
"map <C-K> :bprev<CR>
"map <C-J> :bnext<CR>

" Switching windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Move visual selection
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

" #############
" Abbreviations
" #############

" ========
" Commands
" ========

" Open a terminal at the bottom
if has('terminal')
  :command Btrem botright terminal
endif

" ########
" Packages
" ########

" ======
" Colors
" ======

" ---------
" Solarized
" ---------
:packadd vim-colors-solarized

" ======
" Syntax
" ======

" ---------------------------------
" ALE - asynchronous linting engine
" ---------------------------------
source ~/.vim/conf/ale.vimrc

" ---------------------------------------------------------------------
" - JavaScript
" ---------------------------------------------------------------------
:packadd vim-javascript
:packadd vim-jsx-pretty

" =======
" Plugins
" =======

" --------------------------------------------
" airline - lean & mean status/tabline for vim 
" --------------------------------------------
source ~/.vim/conf/airline.vimrc

" ---------------------------------
" fzf - A command-line fuzzy finder
" ---------------------------------
source ~/.vim/conf/fzf.vimrc

" ---------------------------------------------------------------------
" - gitgutter
" ---------------------------------------------------------------------
:packadd vim-gitgutter

" set background color of sign column to general background color
let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

" --------
" NERDTree
" --------
source ~/.vim/conf/nerdtree.vimrc

" ------------------------------------------------------
" vim-alternate - Quickly switch between alternate files
" ------------------------------------------------------
:packadd vim-alternate

" --------------------------------------------------
" vim-auto-save - Automatically save changes to disk
" --------------------------------------------------
:packadd vim-auto-save

" -------------------------------------------------
" vim-surround - Quoting/parenthesizing made simple
" -------------------------------------------------
:packadd vim-surround

" ------------------------------------------------
" vim-unimpaired - Pairs of handy bracket mappings
" ------------------------------------------------
:packadd vim-unimpaired

" ------------------------------------------------------------
" vim-repeat - enable repeating supported plugin maps with '.'
" ------------------------------------------------------------
:packadd vim-repeat

" ---------------------------------------------------------------------
" - auto-pairs
" ---------------------------------------------------------------------
:packadd auto-pairs

" vim-cmake - working with CMake projects
source ~/.vim/conf/vim-cmake.vimrc

" ---------------------------------------------------------------------
" - coc.nvim
" ---------------------------------------------------------------------
:packadd coc.nvim

" ---------------------------------------------------------------------
" - vim-markdown-preview
" ---------------------------------------------------------------------
source ~/.vim/conf/vim-markdown-preview.vimrc

" ---------------------------------------------------------------------
" - vim-terraform
" ---------------------------------------------------------------------
:packadd vim-terraform
