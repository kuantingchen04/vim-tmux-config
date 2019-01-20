"====================================================================
" Start vundle
"====================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"====================================================================
" Personal plugins
"====================================================================

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chazy/cscope_maps'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'

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

"====================================================================
" Plugin Settings
"====================================================================

" Basic settings
syntax on
set nu
set cursorline

" Tab/Indent
set tabstop=4
set softtabstop=4
set expandtab
set backspace=2

set shiftwidth=4 "Intend char
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" Search
set incsearch
set hlsearch
set ignorecase

" Enter command mode by typing semicolon
nnoremap ; :

" Move by line on the screen rather than by line in the file
nnoremap j gj
nnoremap k gk

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"" Colorscheme & Background
set background=dark
colorscheme gruvbox

"" Rainbow Prarentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" switch default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" YCM
let g:loaded_youcompleteme = 0
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' 
"Use default: cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/


" shortcut of certain strings
nmap ,. o--------------------------------------------------------------------------------<ESC>
nmap ,r o'''<ESC>

"====================================================================
" HotKeys
"====================================================================
noremap <F2> :set nu!<CR>

set pastetoggle=<F3>

noremap <F4> :TlistToggle<CR>

noremap <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

"--------------------------------------------------------------------------------
" Using the clipboard as the default register (For OSX only, not Linux)
"set mouse+=a
"set clipboard=unnamed
"map <F9> :.w !pbcopy<CR><CR>
"map <F10> :r !pbpaste<CR>
"--------------------------------------------------------------------------------

