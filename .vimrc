"====================================================================
" General settings
"====================================================================
let mapleader = ","

syntax enable
filetype plugin indent on

set number
set relativenumber
set cursorline
set hidden
set autoread
set confirm
set updatetime=500
set signcolumn=yes
set splitbelow
set splitright
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/.git/*,*/node_modules/*,*/__pycache__/*,*/build/*

" Use true color when the SSH/tmux terminal advertises normal capabilities.
if exists('+termguicolors') && $TERM !=# 'dumb'
  set termguicolors
endif

"====================================================================
" Indentation
"====================================================================
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"====================================================================
" Search
"====================================================================
set incsearch
set hlsearch
set ignorecase
set smartcase

"====================================================================
" Recovery and undo
"====================================================================
set nobackup
set swapfile

let s:swap_dir = expand('~/.vim/swap')
if !isdirectory(s:swap_dir)
  silent! call mkdir(s:swap_dir, 'p')
endif
execute 'set directory^=' . fnameescape(s:swap_dir . '//')

if has('persistent_undo')
  let s:undo_dir = expand('~/.vim/undo')
  if !isdirectory(s:undo_dir)
    silent! call mkdir(s:undo_dir, 'p')
  endif
  set undofile
  execute 'set undodir=' . fnameescape(s:undo_dir . '//')
endif

" Move by screen line, but preserve counted j/k motions as physical lines.
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

"====================================================================
" Plugins (vim-plug)
"====================================================================
let s:plug_path = expand('~/.vim/autoload/plug.vim')
if filereadable(s:plug_path)
  call plug#begin('~/.vim/plugged')

  " Git review, status line, and file browsing.
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'

  " Fast file/buffer search. fzf#install() supplies the fzf binary.
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Lightweight Vim 8/9 LSP client; completion stays manual via CTRL-X CTRL-O.
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'

  " A single maintained colorscheme instead of a large colorscheme bundle.
  Plug 'sainnhe/gruvbox-material'

  call plug#end()
else
  echohl WarningMsg
  echom 'vim-plug is not installed; see the vim-tmux-config README'
  echohl None
endif
unlet s:plug_path

"====================================================================
" Colors
"====================================================================
set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1

try
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  " Portable fallback for a fresh machine before :PlugInstall.
  colorscheme desert
endtry

"====================================================================
" File and Git navigation
"====================================================================
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>

"====================================================================
" LSP: semantic navigation without an automatic completion framework
"====================================================================
let g:lsp_signature_help_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 500
set completeopt=menuone,noinsert,noselect

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <silent><buffer> gd <plug>(lsp-definition)
  nmap <silent><buffer> gr <plug>(lsp-references)
  nmap <silent><buffer> gs <plug>(lsp-document-symbol-search)
  nmap <silent><buffer> K <plug>(lsp-hover)
  nmap <silent><buffer> <leader>rn <plug>(lsp-rename)
  nmap <silent><buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <silent><buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"====================================================================
" Personal text helpers
"====================================================================
nnoremap <leader>h o//==============================================================================<ESC>
nnoremap <leader>/ A<Space><Space>//<Space>
nnoremap <leader>@ A<Space><Space>//<Space>@kev
nnoremap <leader>do A<Space><Space>//<Space>TODO(@kev)
