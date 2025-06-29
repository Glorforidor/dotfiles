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
# Check:
# https://github.com/vim/vim/commit/22105fd1fe0dcfe993b5c04c6ebe017a626116e3
set cpoptions-=z

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

# Redraw
set lazyredraw
set redrawtime=1000

# Split
set splitright
set splitbelow

# Buffers
set hidden

set number
set relativenumber

# Enable filetype, syntax and autocomplete
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set complete-=i
set completeopt=longest,noselect,menuone,popup,fuzzy

# Always set autoindenting on
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
# g:rehash256 = 1
# set t_Co=256
set background=dark
set termguicolors
colorscheme gruvbox

# Auto read/write file and change directory
set autoread
set autowrite
set autochdir

# Swap file
set updatetime=800
if ! isdirectory($HOME .. "/.vim/swap")
    call mkdir($HOME .. "/.vim/swap", "p", 0o755)
endif
set directory^=~/.vim/swap//

# Backup
set writebackup
set nobackup
set backupcopy=auto
if ! isdirectory($HOME .. "/.vim/backup")
    call mkdir($HOME .. "/.vim/backup", "p", 0o755)
endif
set backupdir^=~/.vim/backup//

# Undo
set undofile
if ! isdirectory($HOME .. "/.vim/undo")
    call mkdir($HOME .. "/.vim/undo", "p", 0o755)
endif
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
#
###############################################################################
#                                  FILETYPES                                  #
###############################################################################

augroup PUPPETFILETYPE
    autocmd!
    autocmd FileType puppet setlocal shiftwidth=2 tabstop=2
augroup END
