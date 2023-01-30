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
set shiftwidth=4            " Use 4 spaces when indenting
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
set fixendofline      " restore EOL at end of file if missing
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
  nnoremap <Left> :vertical resize -2<CR>
  nnoremap <Right> :vertical resize +2<CR>
endif

" ############
" Key Mappings
" ############

" Enable Meta-Key mappings
"for i in range(65,90) + range(97,122)
"  let c = nr2char(i)
"  exec "map \e".c." <M-".c.">"
"  exec "map! \e".c." <M-".c.">"
"endfor
"set timeoutlen=1000
"set ttimeoutlen=10

" Exit insert mode
inoremap qq <Esc>

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

nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>

nnoremap <M-S-h> :tabm -1<CR>
nnoremap <M-S-l> :tabm +1<CR>

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
  :command Bterm execute "botright terminal ++rows=" . winheight('.') / 5
  nnoremap <Leader>t :Bterm<CR>
endif

" ########
" Plugins
" ########

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" -----------------------------------
" gruvbox - retro groove color scheme
" -----------------------------------
Plug 'https://github.com/morhetz/gruvbox'

" --------------------------------------------
" airline - lean & mean status/tabline for vim 
" --------------------------------------------
Plug 'https://github.com/vim-airline/vim-airline'

" ---------------------------------
" fzf - A command-line fuzzy finder
" ---------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Required
" - width [float range [0 ~ 1]] or [integer range [8 ~ ]]
" - height [float range [0 ~ 1]] or [integer range [4 ~ ]]
"
" Optional
" - xoffset [float default 0.5 range [0 ~ 1]]
" - yoffset [float default 0.5 range [0 ~ 1]]
" - relative [boolean default v:false]
" - border [string default 'rounded']: Border style
"   - 'rounded' / 'sharp' / 'horizontal' / 'vertical' / 'top' / 'bottom' / 'left' / 'right'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Key Mappings

" Find git tracked files
nnoremap <silent> <Leader>ff :GFiles<CR>
" Find all files
nnoremap <silent> <Leader>fF :Files<CR>
" Find open buffer
nnoremap <silent> <Leader>fb :Buffers<CR>
" Find buffer in history
nnoremap <silent> <Leader>fB :History<CR>
" Find tags in current buffer
nnoremap <silent> <Leader>ft :BTags<CR>
" Find tags across project
nnoremap <silent> <Leader>fT :Tags<CR>
" Find lines in current buffer
nnoremap <silent> <Leader>fl :BLines<CR>
" Find lines in loaded buffers
nnoremap <silent> <Leader>fL :Lines<CR>
" Find help
nnoremap <silent> <Leader>fH :Helptags!<CR>
" Find commands
nnoremap <silent> <Leader>fC :Commands<CR>
" Find key mappings
nnoremap <silent> <Leader>fM :Maps<CR>

" --------------------------------
" easy-align - an alignment plugin
" --------------------------------
Plug 'https://github.com/junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" -------------------------------------
" minimap - minimap / scrollbar for vim
" -------------------------------------
Plug 'https://github.com/wfxr/minimap.vim'

" highlight range of visible lines
let g:minimap_highlight_range = 1

nnoremap <C-M> :MinimapToggle<CR>

" ---------------------------------------------------------------------
" vim-surround - Quoting/parenthesizing made simple
" ---------------------------------------------------------------------
"
" cs<from><to>  change surrounding <from> to <to>
" cst<to>       change surrounding tags to <to>
"
" ds<s>         delete surrounding <s>
"
" ys<motion><s> surround characters using motion
"
Plug 'https://github.com/tpope/vim-surround'

" ---------------------------------------------------------------------
" vim-repeat - enable repeating supported plugin maps with '.'
" ---------------------------------------------------------------------
Plug 'https://github.com/tpope/vim-repeat'

" ---------------------------------------------------------------------
" vim-unimpaired - Pairs of handy bracket mappings
" ---------------------------------------------------------------------
" 
" [b, ]b    previous/next buffer
" [B, ]B    first/last buffer
" 
" [a, ]a    previous/next argument
" [A, ]A    first/last argument
"
" [<Space>, ]<Space>    insert line above/below
" [e, ]e    exchange with previous/next line
" [p, ]p    put above/below current line
"
Plug 'https://github.com/tpope/vim-unimpaired'

" ---------------------------------------------------------------------
" auto-pairs - insert or delete brackets, parens, quotes in pair
" ---------------------------------------------------------------------
"
" <M-p>     toggle autopairs
" <M-n>     jump to next closed pair
"
Plug 'https://github.com/jiangmiao/auto-pairs'

" ---------------------------------------------------------------------
" NERDTree - A tree explorer
" ---------------------------------------------------------------------
Plug 'https://github.com/preservim/nerdtree'

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Mirror the NERDTree before showing it. 
" This makes it the same on all tabs.
nnoremap <Leader>p :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ---------------------------------------------------------------------
" nerdtree-git-plugin - shows git status flags for files and folders
" ---------------------------------------------------------------------
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'

" ---------------------------------------------------------------------
" gitgutter - shows git diff markers in the sign column
" ---------------------------------------------------------------------
Plug 'https://github.com/airblade/vim-gitgutter'

" set background color of sign column to general background color
let g:gitgutter_override_sign_column_highlight=0
"highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg

" ---------------------------------------------------------------------
" vim-ragtag - ghetto HTML/XML mappings
" ---------------------------------------------------------------------
"
" The table below shows what happens if the binding is pressed on the 
" end of a line consisting of "foo".
"
" Mapping       Changed to (cursor = ^)
" <C-X><Space>  <foo>^</foo>
" <C-X><CR>     <foo>\n^\n</foo>
" <C-X>/        Last HTML tag closed
"
Plug 'https://github.com/tpope/vim-ragtag'

" ---------------------------------------------------------------------
" vim-go - go development plugin
" ---------------------------------------------------------------------
Plug 'https://github.com/fatih/vim-go'

let g:go_code_completion_enabled = 1

" ---------------------------------------------------------------------
" vim-terraform - basic vim/terraform integration
" ---------------------------------------------------------------------
Plug 'https://github.com/hashivim/vim-terraform'

" ---------------------------------------------------------------------
" vim-css-color - preview colours in source code while editing
" ---------------------------------------------------------------------
Plug 'https://github.com/ap/vim-css-color'

" ---------------------------------------------------------------------
" vim-alternate - Quickly switch between alternate files
" ---------------------------------------------------------------------
Plug 'https://github.com/ton/vim-alternate'

" ---------------------------------------------------------------------
" vim-lsp - async language server protocol plugin
" ---------------------------------------------------------------------
Plug 'https://github.com/prabirshrestha/vim-lsp'

" ---------------------------------------------------------------------
" asyncomplete.vim - async completion in pure vim script
" ---------------------------------------------------------------------
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ---------------------------------------------------------------------
" asyncomplete-lsp.vim - lsp source for asyncomplete.vim vim-lsp
" ---------------------------------------------------------------------
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'

if executable('bash-language-server')
	" npm install bash-language-server
	augroup LspBash
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'bash-language-server',
					\ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
					\ 'allowlist': ['sh'],
					\ })
	augroup END
endif
if executable('pylsp')
    " pip install ruff ruff-lsp  # requires rust>=1.64
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pylsp',
                \ 'cmd': {server_info->['pylsp']},
                \ 'allowlist': ['python'],
                \ })
endif
if executable('gopls')
    " go install golang.org/x/tools/gopls@latest
    au User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {server_info->['gopls', '-remote=auto']},
                \ 'allowlist': ['go'],
                \ })

    autocmd BufWritePre *.go LspDocumentFormatSync
endif
if executable('html-languageserver')
	" npm install vscode-html-languageserver-bin
	au User lsp_setup call lsp#register_server({
				\ 'name': 'html-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
				\ 'whitelist': ['html'],
				\ })
endif
if executable('css-languageserver')
	" npm install vscode-css-languageserver-bin
	au User lsp_setup call lsp#register_server({
				\ 'name': 'css-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
				\ 'whitelist': ['css', 'less', 'sass', 'scss'],
				\ })
endif
if executable('typescript-language-server')
	" npm install typescript typescript-language-server
	au User lsp_setup call lsp#register_server({
				\ 'name': 'javascript support using typescript-language-server',
				\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
				\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
				\ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
				\ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


call plug#end()

" https://github.com/morhetz/gruvbox/wiki/Installation
autocmd vimenter * ++nested colorscheme gruvbox

