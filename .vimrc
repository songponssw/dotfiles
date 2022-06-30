" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Must be set here
let g:dracula_italic = 0

" Plugin
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-scripts/c.vim'
Plug 'https://github.com/tpope/vim-fugitive'
call plug#end()

" Base
filetype on
syntax on
set mouse=a
set number
set t_Co=256
set encoding=utf-8
let mapleader = " "

" Tab nav
nnoremap <leader>l   :bnext<CR>
nnoremap <leader>h   :bp<CR>
nnoremap <leader>qq   :bdelete<CR>

" Tab & Indent
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set autoindent smarttab smartindent cindent

" Share clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

colorscheme dracula

let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'
