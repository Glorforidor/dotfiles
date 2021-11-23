" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'lervag/vimtex', { 'for': 'tex' }
call plug#end()

source ~/.vim/myfiles/myvimsetup.vim
source ~/.vim/myfiles/mypluginsettings.vim
source ~/.vim/myfiles/mykeybindings.vim

