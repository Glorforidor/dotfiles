" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
	Plug 'davidhalter/jedi-vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'rust-lang/rust.vim'
	Plug 'godlygeek/tabular'
	Plug 'majutsushi/tagbar'
	Plug 'SirVer/ultisnips'
	Plug 'mbbill/undotree'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'flazz/vim-colorschemes'
	Plug 'fatih/vim-go'
	Plug 'Shougo/vimproc.vim'
	Plug 'lervag/vimtex'
call plug#end()

source ~/.vim/myfiles/myvimsetup.vim
source ~/.vim/myfiles/mypluginsettings.vim
source ~/.vim/myfiles/mykeybindings.vim

