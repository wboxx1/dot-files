set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"git interface
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim' 

" tmux navigator
" Helps with keybindings for vim/tmux
Plugin 'christoomey/vim-tmux-navigator'

" vimux / used for interaction betweein vim/tmux 
Plugin 'benmills/vimux'

" html
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

" reStructuredText
Plugin 'Rykka/InstantRst'
Plugin 'Rykka/riv.vim'

" syntax checker
Plugin 'vim-syntastic/syntastic'

"python syntax checker
"Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'

" auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'

" typescript completer
Plugin 'Quramy/tsuquyomi'

" need to look into supertab more
" may not be needed
"Plugin 'ervandew/supertab'

" code folding
Plugin 'tmhedberg/SimpylFold'

Plugin 'rkulla/pydiction'

"Colors!!!
"Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=","
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Prompt for a command to run/vimux
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vz :VimuxZoomRunner<CR>
"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set auto window height
set winheight=30
set winminheight=5

" remap + and - to change window height
nnoremap <silent> = :exe "resize ". (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize ". (winheight(0) * 2/3)<CR>

" Remap escape
inoremap jk <Esc>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Set color scheme
"call togglebg#map("<F5>")
"set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
"set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
"set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
set guifont=Fira:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"---------START SYNTASTIC STUFF--------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_c_checkers =
"let g:syntastic_cs_checkers =
"let g:syntastic_cpp_checkers =
let g:syntastic_dockerfile_checkers = ['dockerfile_lint']
"let g:syntastic_go_checkers =
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_markdown_checkers = ['mdl', 'proselint']
"let g:syntastic_perl_checkers =
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_rst_checkers = ['rstcheck', 'proselint'] 
let g:syntastic_ruby_checkers = ['reek', 'rubylint']
let g:syntastic_sql_checkers = ['sqlint'] 
let g:syntastic_typescript_checkers = ['tslint'] 
"let g:syntastic_vue_checkers = 

"-----------END SYNTASTIC STUFF-----------------

" Set global shift to 2
set tabstop=4
set shiftwidth=4

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"command RemoveWhitespace %s/\s\+$//e

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
