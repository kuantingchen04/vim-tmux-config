"====================================================================
" General settings
"====================================================================
let mapleader = ","           " define <leader>
set nocompatible              " be iMproved, required
filetype on                   " detect filetype
syntax on
set number
set cursorline
set updatetime=500

"====================================================================
" Tab/Indent
"====================================================================
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2

"====================================================================
" Search
"====================================================================
set incsearch
set hlsearch
set ignorecase

"====================================================================
" Buffer
"====================================================================
set nobackup
set noswapfile
set nobackup
set autoread
set confirm

" Enter command mode by typing semicolon
nnoremap ; :

" Move by line on the screen rather than by line in the file
nnoremap j gj
nnoremap k gk

"====================================================================
" Personal plugins (Vim-Plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"====================================================================
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'kien/rainbow_parentheses.vim'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ycm-core/YouCompleteMe'
"Plug 'dense-analysis/ale'
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

"" YCM
"You can use default config file: cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
"To disable YCM, uncomment the following line
"let g:loaded_youcompleteme = 0

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf="~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"
"let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_show_diagnostics_ui = 0
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1
        \}
let g:ycm_disable_for_files_larger_than_kb = 50000

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
noremap <F12> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_ctags_bin='ctags'
let g:tagbar_sort = 0

"Leaderf
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>p :LeaderfFile<cr>
noremap <leader>f :LeaderfFunction!<cr>
noremap <leader>b :LeaderfBuffer<cr>
noremap <leader>t :LeaderfTag<cr>

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.csv','*/log/*','*/tmp/*']
            \}
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

" NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
"let g:NERDTreeWinPos = "right"

"====================================================================
" HotKeys
"====================================================================
"set pastetoggle=<F3>

"--------------------------------------------------------------------------------
" Using the clipboard as the default register (For OSX only, not Linux)
"set mouse+=a
"set clipboard=unnamed
"map <F9> :.w !pbcopy<CR><CR>
"map <F10> :r !pbpaste<CR>
"--------------------------------------------------------------------------------

" shortcut of certain strings
nnoremap <leader>h o//==============================================================================<ESC>
nnoremap <leader>/ A  // 
nnoremap <leader>c A  // @kev 
nnoremap <leader>k A  // TODO(@kev) 
