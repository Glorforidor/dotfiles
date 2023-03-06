vim9script

# In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

# Only do this part when compiled with support for autocommands.
if has("autocmd")
    # When editing a file, always jump to the last known cursor position.
    # Don't do it when the position is invalid or when inside an event handler
    # (happens when dropping a file on gvim).
    # Also don't do it when the mark is in the first line, that is the default
    # position when opening a file.
    autocmd BufReadPost * {
        if line("'\"") > 1 && line("'\"") <= line("$") |
            exe "normal! g`\"" |
        endif
    }
endif

var current_pos: list<number>
augroup MINE
    # Stole this from ThePrimeagen and added some.
    autocmd!
    autocmd BufWritePre * current_pos = getpos(".")
    autocmd BufWritePre * silent! undojoin | :%s/\s\+$//e
    autocmd BufWritePre * setpos(".", current_pos)
augroup END

# Initial setup
set nocompatible
set modifiable

# Display
set title
set encoding=utf-8 nobomb
set showcmd
# Let the airline show the mode.
# set showmode
set showmatch
set cursorline
set ruler

# Scroll
set scrolloff=8

# redraw
set lazyredraw
set redrawtime=1000

# split
set splitright
set splitbelow

# buffers
set hidden

# Set numbering
set number
set relativenumber

# Enable filetype, syntax and autocomplete
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set complete-=i
set completeopt=longest,menuone,popup

# always set autoindenting on
set autoindent

# Round indent
set shiftround

# Set style for tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

# Insure end of line
set eol

# Better cmd autocomplete
set wildmenu
set wildoptions=pum,fuzzy
# set wildmode=list:full
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

# Remember commands
set history=1000

# Undo
set undolevels=1000

# Search
set hlsearch
set incsearch
set ignorecase
set smartcase

# Color
g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme gruvbox

# Auto read/write file and change directory
set autoread
set autowrite
set autochdir

# Swap file
set updatetime=1000
set directory^=~/.vim/swap//

# Backup
set writebackup
set nobackup
set backupcopy=auto
set backupdir^=~/.vim/backup//

# Undo
set undofile
set undodir^=~/.vim/undo//

# Allow backspacing over everything in insert mode
set backspace=3

# Always show status
set laststatus=2

# Better wrapping
set wrap
set linebreak
set showbreak=

# Textwidth
set textwidth=79

# TTY behavior
set ttyfast

# Timeout
set ttimeout
set ttimeoutlen=100

# Strange spaces!
set nojoinspaces

# Python
set pyxversion=0

# Do not pass messages to |ins-completion-menu|.
set shortmess+=c

# Space for leader is more convenient.
g:mapleader = " "
g:maplocalleader = " "

# A strange fix for a strange black background in Vim from Kitty?
&t_ut = ''
