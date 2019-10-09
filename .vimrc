"====================================================================
" Vim settings
"====================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
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


"====================================================================
" Personal plugins (Vim-Plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"====================================================================
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'flazz/vim-colorschemes'
Plug 'kien/rainbow_parentheses.vim'

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'liuchengxu/vista.vim'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
call plug#end()


" All of your Plugins must be added before the following line
"call plug#end()             " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"====================================================================
" Plugin Settings
"====================================================================

"" Colorscheme & Background
set background=dark
colorscheme gruvbox

"" Rainbow Prarentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" YCM
"You can use default config file: cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
"To disable YCM, uncomment the following line
"let g:loaded_youcompleteme = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' 

" ALE: use :ALEToggle to open
let g:ale_enabled = 0

"ctags
set tags+=./tags
" Cscsope 
set cscopetag
set cscopeprg=gtags-cscope " Replace cscope
" Gtags
let Gtags_Auto_Update = 1 "keep tag files up-to-date automatically
let Gtags_Auto_Map = 1 "use a suggested key-mapping
" Gtags-Cscope
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"tagbar
let g:tagbar_ctags_bin='ctags'
let g:tagbar_sort = 0

" NERDTree
"let g:NERDTreeWinPos = "right"

" CtrlP
let g:ctrlp_map = '<c-g>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" switch default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
set wildignore+=*/log/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
" For large projects
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40


"====================================================================
" HotKeys
"====================================================================
noremap <c-c> :set nu!<CR>
set pastetoggle=<F3>
noremap <F9> :NERDTreeToggle<CR>
noremap <F12> :TagbarToggle<CR>

"--------------------------------------------------------------------------------
" Using the clipboard as the default register (For OSX only, not Linux)
"set mouse+=a
"set clipboard=unnamed
"map <F9> :.w !pbcopy<CR><CR>
"map <F10> :r !pbpaste<CR>
"--------------------------------------------------------------------------------

" shortcut of certain strings
nmap ,. o----------------------------------------------------------------------<ESC>
nmap ,r o'''<ESC>
nmap ,k A  // @kev 
nmap ,/ A  // 
nmap ,t A  // TODO(@kev) 
